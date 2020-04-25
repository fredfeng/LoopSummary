#lang s-exp rosette

(require json rosette/query/debug racket/sandbox "solidity-parser.rkt" "inst.rkt")

;;; Uninterpreted function to model array access
(define-symbolic array-app (~> integer? integer? integer?))

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
    (pretty-display regs-out-2)
    (define ok (sat? (solve (assert (not (equal? output1 output2))))))
    (printf "output1 = ~a,  output2 = ~a eq? = ~a \n" output1 output2 ok)
    ;;; (printf "Register ~a = ~a ~a \n" out-reg output ok)
    (if ok "NEQ" "EQ")
    ;;; debugging
    ;;; (display (solve (assert (not (equal? output1 output2)))))
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

    (define (assign#)
        (define d (vector-ref args 1))
        (define a (vector-ref args 2))
        (define val (string->number a)) ;; reg const 
        (printf "debug ri: val=~a \n" val)
        (hash-set! env d val))

    (define (array-access)
        (define d (vector-ref args 1))
        (define base (vector-ref args 2))
        (define offset (vector-ref args 3))
        (define base-val (gen-var-by-name base env))
        (define offset-val (gen-var-by-name offset env))
        (define val (array-app base-val offset-val))
        (hash-set! env d val)
    )

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

    (cond
         [(equal? op-name "nop")   (void)]
         [(equal? op-name "add")   (add)]
         [(equal? op-name "add#")   (add#)]
         [(equal? op-name "eq#") (assign#)]
         [(equal? op-name "eq") (assign)]
         [(equal? op-name "lt") (void)]
         [(equal? op-name "arrayaccess") (array-access)]
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