#lang s-exp rosette

(require json rosette/query/debug racket/sandbox "solidity-parser.rkt" "inst.rkt")

;;; n is the length of the symbolic vector
(define (get-sym-vec name n)
  (list->vector
    (for/list ([i (range n)])
      (constant
        (format "~a@~a" name i) integer?))))
        ; (string->symbol (format "~a@~a" name i)) integer?))))

;;; Racket function to model array read
(define (sym-array-read base offset)
    ;;; (notice) first tell if the variables are symbolic or not before assertion
    (if (not (or (constant? offset) (term? offset) (expression? offset)))
        (if (or (< offset 0) (>= offset (vector-length base)))
            (begin
                (printf "constant-check@read: eq? = #t\n") ; programs not equal 
                (printf "~a\n" offset)
                (exit 0)
            )
            (printf "")
        )
        (printf "")
    )
    ;;; if you pass the above without exitting, 
    ;;; then it's ok to issue the rosette assertions
    (assert (>= offset 0)) 
    (assert (< offset (vector-length base)))
    (vector-ref base offset) )

;;; Racket function to model array write
;;; return base[offset] (TMP: won't be used)
(define (sym-array-write base offset source)
    ;;; (notice) first tell if the variables are symbolic or not before assertion
    (if (not (or (constant? offset) (term? offset) (expression? offset)))
        (if (or (< offset 0) (>= offset (vector-length base)))
            (begin
                (printf "constant-check@write: eq? = #t\n") ; programs not equal 
                (printf "~a\n" offset)
                (exit 0)
            )
            (printf "")
        )
        (printf "")
    )
    ;;; if you pass the above without exitting, 
    ;;; then it's ok to issue the rosette assertions
    (assert (>= offset 0)) 
    (assert (< offset (vector-length base)))
    ;;; no return value will be used
    (vector-set! base offset source)
)

(define parser (new solidity-parser%))

;;; Map names to symbolic variables
(define regs-out-1 (make-hash))
(define regs-out-2 (make-hash))

(define (gen-var-by-name name regs-out)
    (define var (constant name integer?))
    (if (hash-has-key? regs-out name)
        (hash-ref regs-out name)
        (begin
            (hash-set! regs-out name var)
            var))
)

;;; special method for flag variable
(define (gen-bool-by-name name regs-out)
    (define var (constant name boolean?))
    (if (hash-has-key? regs-out name)
        (hash-ref regs-out name)
        (begin
            (hash-set! regs-out name var)
            var))
)

;;; FIXME: change to larger constant later
(define fixed-vector-length 10)
(define (gen-vec-by-name name regs-out)
    (define var (get-sym-vec name fixed-vector-length))
    (if (hash-has-key? regs-out name)
        (hash-ref regs-out name)
        (begin
            (hash-set! regs-out name var)
            var)))

(define (check-equivalent input-json) 
    ;;; there could be multiple variables to check/verify
    ;;; (notice) assume the Python side has done necessary pre-checking
    ;;; e.g., at least 1 variable for checking
    ;;; e.g., all variables for checking should match
    ;;; e.g., they are in order
    ;;; ------ (important) -------
    ;;; Python side should preprocess to add program aware prefix
    ;;; e.g., CKPT_0 --> PROG1_CKPT_0
    ;;;       CKPT_0 --> PROG2_CKPT_0
    ;;; because rosette's `define-symbolic` is whatever global and can be defined twice
    ;;; e.g., (define-symbolic a integer?) refers to the same "a" symbolic variable
    ;;;       no matter where you define it, and you can do that multiple times without
    ;;;       triggering any exception
    (define outs-reg1 (hash-ref input-json `write1))
    (define outs-reg2 (hash-ref input-json `write2))
    (printf "--> outs-reg1: ~a \n" outs-reg1)
    (printf "--> outs-reg2: ~a \n" outs-reg2)

    (define insts-1 (hash-ref input-json `insts1))
    (define insts-2 (hash-ref input-json `insts2))

    (for ([cur-inst insts-1])
        (pretty-display cur-inst)
        (define inst-code (vector-ref (parse-code cur-inst) 0))
        (interpret-inst inst-code regs-out-1))

    ;;; (debug) print out all expressions
    (for ([i (in-range (length outs-reg1))])
        (define key-1 (list-ref outs-reg1 i))
        (printf "--> file1, ~a: \n" key-1)
        (printf "~a" (hash-ref regs-out-1 key-1))
        (printf "\n"))

    (for ([cur-inst insts-2])
        (pretty-display cur-inst)
        (define inst-code (vector-ref (parse-code cur-inst) 0))
        (interpret-inst inst-code regs-out-2))

    ;;; (debug) print out all expressions
    (for ([i (in-range (length outs-reg2))])
        (define key-2 (list-ref outs-reg2 i))
        (printf "--> file2, ~a: \n" key-2)
        (printf "~a" (hash-ref regs-out-2 key-2))
        (printf "\n"))

    ;;; (debug)
    (printf "--> regs1: \n~a \n" regs-out-1)
    (printf "--> regs2: \n~a \n" regs-out-2)
    (printf "--> asserts <---\n")
    (printf "~a \n" (asserts))


    ;;; start verification
    ;;; first construct the ultimate predicate
    (define upred
        (for/list ([i (in-range (length outs-reg1))])
            (equal? 
                (hash-ref regs-out-1 (list-ref outs-reg1 i)) 
                (hash-ref regs-out-2 (list-ref outs-reg2 i)) 
            )
        )
    )

    (printf "upred: ~a \n" upred)
    ;;; super solve with conjunction of all variables being equal
    (define ok (sat? (solve (assert (not (apply && upred))))))
    ; (define ok (sat? (solve (assert (not (equal? output1 output2))))))
    (printf "sat? = ~a \n" ok)
    (if ok "NEQ" "EQ")
)

(define (interpret-inst inst env)
    (define op-name (inst-op inst))
    (define args (inst-args inst))
    (printf "working=~a args=~a \n" op-name args)

    (define (assign)
        (define d (vector-ref args 1))
        (define a (vector-ref args 2))
        (define val (gen-var-by-name a env))
        (hash-set! env d val))
        ; (ref-hash-set! env d val))

    (define (assign#)
        (define d (vector-ref args 1))
        (define a (vector-ref args 2))
        (define val (string->number a)) ;; reg const 
        (hash-set! env d val))
        ; (ref-hash-set! env d val))

    (define (array-read)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define val (sym-array-read base-val offset-val))
        (hash-set! env d val)
    )

    (define (array-write)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define source (vector-ref args 4))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (gen-var-by-name source env))
        ;;; d won't be used, so no need to set it
        (sym-array-write base-val offset-val source-val)
    )

    (define (array-write#)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define source (vector-ref args 4))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (string->number source)) ; reg const
        ;;; d won't be used, so no need to set it
        (sym-array-write base-val offset-val source-val)
    )

    (define (array-op op)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define source (vector-ref args 4))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (gen-var-by-name source env))
        (define val (op (sym-array-read base-val offset-val) source-val))
        (hash-set! env d val)
    )

    (define (array-op# op)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define source (vector-ref args 4))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (string->number source)) ; reg const
        (define val (op (sym-array-read base-val offset-val) source-val))
        (hash-set! env d val)
    )

    (define (add##)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define val (+ (string->number a1) (string->number a2))) ;; reg const 
        (hash-set! env d val))

    (define (add#)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define val (+ a1-val (string->number a2))) ;; reg const 
        (hash-set! env d val))

    (define (add)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (+ a1-val a2-val)) ;; reg const 
        (hash-set! env d val))

    (define (sub##)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define val (- (string->number a1) (string->number a2))) ;; reg const 
        (hash-set! env d val))

    (define (sub#)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define val (- a1-val (string->number a2))) ;; reg const 
        (hash-set! env d val))

    (define (sub)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (- a1-val a2-val)) ;; reg const 
        (hash-set! env d val))

    (define (lt)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (< a1-val a2-val)) ;; reg const 
        (hash-set! env d val))

    (define (gt)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (> a1-val a2-val)) ;; reg const 
        (hash-set! env d val))

    (define (rq)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a1-val (gen-var-by-name a1 env))
        ;;; special trick for assert verification
        ;;; define separate d-val for different programs
        ;;; (important) don't use gen-var, use the special gen-bool
        ;;; flags must be bool so that they can be correctly process by rosette
        (define d-val (gen-bool-by-name d env))
        (if a1-val 
            ; either one will be captured by rosette assertion store
            (assert d-val)
            (assert (not d-val))
        )
        (hash-set! env d d-val)
    )

    (cond
         ; [(equal? op-name "nop")   (void)]

         [(equal? op-name "add")   (add)]
         [(equal? op-name "add#")   (add#)]
         [(equal? op-name "add##")   (add##)]
         [(equal? op-name "sub")   (sub)]
         [(equal? op-name "sub#")   (sub#)]
         [(equal? op-name "sub##")   (sub##)]

         [(equal? op-name "assign#") (assign#)]
         [(equal? op-name "assign") (assign)]
         [(equal? op-name "lt") (lt)]
         [(equal? op-name "gt") (gt)]

         [(equal? op-name "array-read") (array-read)]
         [(equal? op-name "array-write") (array-write)]
         [(equal? op-name "array-write#") (array-write#)]

         [(equal? op-name "array-lt") (array-op <)]
         [(equal? op-name "array-lt#") (array-op# <)]
         [(equal? op-name "array-lte") (array-op <=)]
         [(equal? op-name "array-lte#") (array-op# <=)]
         [(equal? op-name "array-gt") (array-op >)]
         [(equal? op-name "array-gt#") (array-op# >)]
         [(equal? op-name "array-gte") (array-op >=)]
         [(equal? op-name "array-gte#") (array-op# >=)]
         [(equal? op-name "array-eq") (array-op equal?)]
         [(equal? op-name "array-eq#") (array-op# equal?)]
         [(equal? op-name "array-neq") (array-op (lambda (x y) (not (equal? x y))))]
         [(equal? op-name "array-neq#") (array-op# (lambda (x y) (not (equal? x y))))]

         [(equal? op-name "require") (rq)] ; use rq to avoid keyword require

         [else (assert #f (format "simulator: undefine instruction ~a" op-name))])
)

(define (parse-code inst-str)
    (define code
        (with-handlers ([(lambda (v) #t) (lambda (v) 'parser-error)])
            (send parser ir-from-string inst-str)))
            code)

;;; Uncomment this if you want to test bmc separately.
;;; (define json-obj (call-with-input-file "eq.json" read-json))

;;; Default integration point with python.
(define cmd (current-command-line-arguments))
(define json-obj (string->jsexpr (vector-ref cmd 0)))


;;; (pretty-display "debugging interface...........")
;;; (pretty-display cmd)
;;; (pretty-display json-obj)
(check-equivalent json-obj)