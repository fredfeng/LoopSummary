#lang racket
(require parser-tools/lex
         (prefix-in re- parser-tools/lex-sre)
         parser-tools/yacc
         "inst.rkt")

(provide (all-defined-out))

(define-tokens a (NUM VAR))
(define-empty-tokens b (+ - EOF UPDATERANGE SHIFTLEFT SUM MAP COPYRANGE RB LB COMMA))
(define-lex-trans number
  (syntax-rules ()
    ((_ digit)
     (re-: (re-? (re-or "-" "-")) (uinteger digit)
           (re-? (re-: "." (re-? (uinteger digit))))))))
(define-lex-trans uinteger
  (syntax-rules ()
    ((_ digit) (re-+ digit))))

(define-lex-abbrevs
  (digit10 (char-range "0" "9"))
  (number10 (number digit10))
  (identifier-characters (re-or (char-range "A" "z") (char-range "0" "9")
                                "?" "!" ":" "$" "%" "^" "&"))
  (identifier (re-+ identifier-characters)))

(define dsl-lexer
           (lexer
            ((re-+ number10) (token-NUM (string->number lexeme)))
            ("-" (token--))
            ("+" (token-+))
            ("(" (token-LB))
            (")" (token-RB))
            ("," (token-COMMA))
            ("UPDATERANGE" (token-UPDATERANGE))
            ("SHIFTLEFT" (token-SHIFTLEFT))
            ("SUM" (token-SUM))
            ("COPYRANGE" (token-COPYRANGE))
            ("MAP" (token-MAP))
            (identifier  (token-VAR lexeme))
            ;; recursively calls the lexer which effectively skips whitespace
            (whitespace (dsl-lexer input-port))
            ((eof) (token-EOF))))

(define dsl-parser
           (parser
            (start code)
            (end EOF)
            (error void)
            (tokens a b)
            (precs (left - +))
            (grammar
             (exp ((NUM) $1)
                  ;;; updateRange(target, container, val)
                  ((UPDATERANGE LB VAR COMMA VAR COMMA VAR RB) (inst "UPDATERANGE" (vector $3 $5 $7)))
                  ;;; shiftLeft(org, startIdx, endIdx)
                  ((SHIFTLEFT LB VAR COMMA VAR COMMA VAR RB) (inst "SHIFTLEFT" (vector $3 $5 $7)))

                  ;;; sum(target, startIdx, endIdx)
                  ((SUM LB VAR COMMA VAR COMMA VAR RB) (inst "SUM" (vector $3 $5 $7)))

                  ;;; CopyRange(Src, srcStart, srcEnd, trgt, tgtStart, tgtEnd)
                  ((COPYRANGE LB VAR COMMA VAR COMMA VAR COMMA VAR COMMA VAR COMMA VAR RB) (inst "COPYRANGE" (vector $3 $5 $7 $9 $11 $13)))

                  ;;; map(tgt, startIdx, endIdx, val)
                  ((MAP LB VAR COMMA VAR COMMA VAR COMMA VAR RB) (inst "MAP" (vector $3 $5 $7 $9)))


                  ;;; incRange(a,range1,b, range2): b[j] += a[i] for i in range1 and j in range2 
                  ;;; INCREMENTRANGE(playerValue, 0, 12, Bettors[0].betsVAlue, 0, 12)

                  ;;; UPDATERANGEWithfunction(minerAddress, minerTokens, minerRewardToeksn, \lamdba (v, i). v + minerRewardTokens[i])

                  ((exp + exp) (+ $1 $3))
                  ((exp - exp) (- $1 $3))
              )

            ;;; Each code contains multiple expressions.
            (code   
                  (() (list))
                  ((exp code) (cons $1 $2)))
            )))

(define (lex-this lexer input) (lambda () (lexer input)))

(let ((input (open-input-string "3 - 3.3 + 6")))
           (dsl-parser (lex-this dsl-lexer input)))

(let ((input (open-input-string "UPDATERANGE(target, container, val)")))
           (dsl-parser (lex-this dsl-lexer input)))


(define code (open-input-string "
    UPDATERANGE(target, container, val)
    SHIFTLEFT(target2, container, val)
    SUM(target, startIdx, endIdx)
    MAP(tgt, startIdx, endIdx, val)
    COPYRANGE(Src, srcStart, srcEnd, trgt, tgtStart, tgtEnd)
    "))

(define (generate-updaterange args)
  ;;; target
  (define arg0 (vector-ref args 0))
  ;;; container
  (define arg1 (vector-ref args 1))
  ;;; value
  (define arg2 (vector-ref args 2))

  (define template "
  for (uint i = 0; i < addresses.length; i++) {
   	container[addresses[i]] = val;
   }
  ")
  (pretty-display (string-replace 
    (string-replace 
      (string-replace template "addresses" arg0) 
                               "container" arg1) 
                               "val" arg2)))


(define (generate-shiftleft args)
  ;;; org
  (define arg0 (vector-ref args 0))
  ;;; startIdx
  (define arg1 (vector-ref args 1))
  ;;; endIdx
  (define arg2 (vector-ref args 2))

  (define template "
    for(uint i=startIdx; i < endIdx;i++){
      addresses[i] = addresses[i+1];
    }
  ")
  (pretty-display (string-replace 
    (string-replace 
      (string-replace template "addresses" arg0) 
                               "startIdx" arg1) 
                               "endIdx" arg2)))

(define (generate-sum args)
  ;;; org
  (define arg0 (vector-ref args 0))
  ;;; startIdx
  (define arg1 (vector-ref args 1))
  ;;; endIdx
  (define arg2 (vector-ref args 2))

  (define template "
    uint total = 0;
    for(uint i=startIdx; i < endIdx;i++){
      total = total.add(addresses[i]);
    }
  ")
  (pretty-display (string-replace 
    (string-replace 
      (string-replace template "addresses" arg0) 
                               "startIdx" arg1) 
                               "endIdx" arg2)))

(define (generate-map args)
  ;;; org
  (define arg0 (vector-ref args 0))
  ;;; startIdx
  (define arg1 (vector-ref args 1))
  ;;; endIdx
  (define arg2 (vector-ref args 2))
  ;;; value 
  (define arg3 (vector-ref args 3))

  (define template "
    for(uint i = 0; i < endIdx;i++){
      addresses[i + startIdx] = val;
    }
  ")
  (pretty-display (string-replace 
    (string-replace 
      (string-replace 
        (string-replace template "addresses" arg0) 
                                "startIdx" arg1) 
                                "endIdx" arg2) 
                                "val" arg3)))

(define (generate-copyrange args)
  ;;; CopyRange(Src, srcStart, srcEnd, tgt, tgtStart, tgtEnd)
  ;;; src
  (define arg0 (vector-ref args 0))
  ;;; srcStart
  (define arg1 (vector-ref args 1))
  ;;; srcEnd
  (define arg2 (vector-ref args 2))
  ;;; tgt
  (define arg3 (vector-ref args 3))
  ;;; tgtStart
  (define arg4 (vector-ref args 4))
  ;;; tgtEnd
  (define arg5 (vector-ref args 5))

  (define template "
    for (uint i = srcStart; i < srcEnd; ++i) {
          tgt[i + tgtStart] = src[i + srcStart];
    }
  ")
  (pretty-display (string-replace 
    (string-replace 
    (string-replace 
    (string-replace 
    (string-replace 
      (string-replace template "src" arg0) 
                               "srcStart" arg1) 
                               "srcEnd" arg2) 
                               "tgt" arg3) 
                               "tgtStart" arg4) 
                               "tgtEnd" arg5)))

(define (translate code) 
    (for ([expr code])
      (match (inst-op expr)
        ["UPDATERANGE" (generate-updaterange (inst-args expr))]
        ["SHIFTLEFT" (generate-shiftleft (inst-args expr))]
        ["SUM" (generate-sum (inst-args expr))]
        ["MAP" (generate-map (inst-args expr))]
        ["COPYRANGE" (generate-copyrange (inst-args expr))]
        [_           (println "I dont know this")])

      ))

(translate (dsl-parser (lex-this dsl-lexer code)))

