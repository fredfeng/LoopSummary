#lang s-exp rosette

(require json rosette/query/debug racket/sandbox "solidity-parser.rkt" "inst.rkt")

;;; convert a symbolic var to string
; (define (constant->string x)
;     (format "~a" x))

; ;;; hash-set! method for when key is a REF_? var
; (define (ref-hash-set! regs-out rkey rval)
;     (if (string-prefix? rkey "REF_")
;         ; if key is a reference variable, do ref-hash-set!
;         (begin
;             (define rdkey (constant->string (hash-ref regs-out rkey)))
;             ; do a sanity check here
;             (if (hash-has-key? regs-out rdkey)
;                 (hash-set! regs-out rdkey rval)
;                 (raise-user-error (format "referred key ~a does not exist in env, check your implementation\n" rdkey))))
;         ; else: normal hash-set
;         (hash-set! regs-out rkey rval)))

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
    (vector-set! base offset source)
    ; return value (no need to return anything)
    ; (vector-ref base offset)
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
    ;;; assume there is only one output
    (define out-reg1 (hash-ref input-json `write1))
    (define out-reg2 (hash-ref input-json `write2))

    (define insts-1 (hash-ref input-json `insts1))
    (define insts-2 (hash-ref input-json `insts2))

    (for ([cur-inst insts-1])
        (pretty-display cur-inst)
        (define inst-code (vector-ref (parse-code cur-inst) 0))
        (interpret-inst inst-code regs-out-1))

    (define output1 (hash-ref regs-out-1 out-reg1))

    (printf "\n")

    (for ([cur-inst insts-2])
        (pretty-display cur-inst)
        (define inst-code (vector-ref (parse-code cur-inst) 0))
        (interpret-inst inst-code regs-out-2))

    (define output2 (hash-ref regs-out-2 out-reg2))

    (pretty-display regs-out-1)
    (printf "\n")
    (pretty-display regs-out-2)
    (printf "\n")
    (print regs-out-1)
    (printf "\n")
    (print regs-out-2)
    (printf "\n")
    (define ok (sat? (solve (assert (not (equal? output1 output2))))))
    (printf " output1 = ~a \n output2 = ~a eq? = ~a \n" output1 output2 ok)
    ;;; (printf "Register ~a = ~a ~a \n" out-reg output ok)
    (if ok "NEQ" "EQ")
    ;;; debugging
    ; (display (solve (assert (not (equal? output1 output2)))))
)

(define (interpret-inst inst env)
    (define op-name (inst-op inst))
    (define args (inst-args inst))
    (printf "working=~a args=~a \n" op-name args)

    (define (assign)
        (define d (vector-ref args 1))
        (define a (vector-ref args 2))
        (define val (gen-var-by-name a env))
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))
        ; (ref-hash-set! env d val))

    (define (assign#)
        (define d (vector-ref args 1))
        (define a (vector-ref args 2))
        (define val (string->number a)) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))
        ; (ref-hash-set! env d val))

    (define (array-read)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        ;;; use gen-vec-by-name instead
        ;;; (define base-val (gen-var-by-name base env))
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
        ;;; use gen-vec-by-name instead
        ;;; (define base-val (gen-var-by-name base env))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (gen-var-by-name source env))
        ;;; d won't be used, so no need to set it
        ; (hash-set! env d val)
        ; (define val (sym-array-write base-val offset-val source-val))
        (sym-array-write base-val offset-val source-val)
    )

    (define (array-write#)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define source (vector-ref args 4))
        ;;; use gen-vec-by-name instead
        ;;; (define base-val (gen-var-by-name base env))
        (define base-val (gen-vec-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define source-val (string->number source)) ;; reg const
        ;;; d won't be used, so no need to set it
        ; (hash-set! env d val)
        ; (define val (sym-array-write base-val offset-val source-val))
        (sym-array-write base-val offset-val source-val)
    )

    (define (add##)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define val (+ (string->number a1) (string->number a2))) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (add#)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define val (+ a1-val (string->number a2))) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (add)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (+ a1-val a2-val)) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (sub##)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define val (- (string->number a1) (string->number a2))) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (sub#)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define val (- a1-val (string->number a2))) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (sub)
        (define d (vector-ref args 1))
        (define a1 (vector-ref args 2))
        (define a2 (vector-ref args 3))
        (define a1-val (gen-var-by-name a1 env))
        (define a2-val (gen-var-by-name a2 env))
        (define val (- a1-val a2-val)) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (cond
         [(equal? op-name "nop")   (void)]
         [(equal? op-name "add")   (add)]
         [(equal? op-name "add#")   (add#)]
         [(equal? op-name "add##")   (add##)]
         [(equal? op-name "sub")   (sub)]
         [(equal? op-name "sub#")   (sub#)]
         [(equal? op-name "sub##")   (sub##)]
         [(equal? op-name "eq#") (assign#)]
         [(equal? op-name "eq") (assign)]
         [(equal? op-name "lt") (void)]
         [(equal? op-name "arrayread") (array-read)]
         [(equal? op-name "arraywrite") (array-write)]
         [(equal? op-name "arraywrite#") (array-write#)]
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