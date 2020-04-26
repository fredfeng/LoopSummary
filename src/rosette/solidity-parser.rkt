#lang racket

(require parser-tools/lex
         (prefix-in re- parser-tools/lex-sre)
         parser-tools/yacc
	 "parser.rkt" "inst.rkt")

(provide solidity-parser%)

;; This is a Racket Lex Yacc parser.
;; Refer to the follow resources to complete this file.
;; - Lexer:   http://docs.racket-lang.org/parser-tools/Lexers.html
;; - Parser:  http://docs.racket-lang.org/parser-tools/LALR_1__Parsers.html
;; - Example: https://gist.github.com/danking/1068185
(define solidity-parser%
  (class parser%
    (super-new)
    (inherit-field asm-parser asm-lexer)
    (init-field [compress? #f])
    
    (define-tokens a (VAR WORD NUM REG)) ;; add more tokens
    (define-empty-tokens b (EOF EQ HOLE BLOCKHASH EQCMP COMMA CREATE THROW THROWI NOP LOG BALANCE ISZERO SGT GT SLT LT SHA3 DELEGATECALL CALLCODE CALL NOT OR
                            SELFDESTRUCT MSIZE NUMBER CALLDATACOPY CODECOPY SUB TIMESTAMP EXP DIV RETURNDATACOPY MUL AND ADD REVERT RETURNDATASIZE
                            CODESIZE EXTCODECOPY MOD XOR DIFFICULTY BYTE ARRAYACCESS
                            RETURN COLON ORIGIN CALLVALUE JUMP EXTCODESIZE JUMPI SLP LC RC LP RP ADDRESS CALLDATASIZE CALLDATALOAD)) ;; add more tokens

    (define-lex-abbrevs
      (digit10 (char-range "0" "9"))
      (number10 (number digit10))
      (snumber10 (re-or number10 (re-seq "-" number16)))
      (number16 (re-or (char-range "0" "9") (char-range "a" "f")))

      (snumber16 (re-+ "0x" number16))




      (identifier-characters (re-or (char-range "A" "Z") (char-range "a" "z") "_"))
      ;;; (identifier-characters-ext (re-* (re-or digit10 identifier-characters "_")))
      ;;; (identifier (re-+ identifier-characters))
      ;;; (identifier (re-+ identifier-characters))

      (identifier (re-seq identifier-characters 
                          (re-* (re-or identifier-characters digit10))))
      ;;; (var (re-: "%" (re-+ (re-or identifier-characters digit10))))
      ;;; (var (re-+ (re-or identifier-characters digit10)))

      ;;; (reg (re-seq (re-or "V" "S") number10))

      )

    ;; Complete lexer
    (set! asm-lexer
      (lexer-src-pos
       ; ? ;; add more tokens
       ("M["         (token-LP))
       ("S["         (token-SLP))
       ("]"         (token-RP))
       ("}"         (token-RC))
       ("{"         (token-LC))
       ("LT"         (token-LT))
       ("SLT"         (token-SLT))
       ("GT"         (token-GT))
       ("SGT"         (token-SGT))
       (":"         (token-COLON))
       ("ADD"       (token-ADD))
       ("BYTE"       (token-BYTE))
       ("XOR"       (token-XOR))
       ("MOD"       (token-MOD))
       ("NOT"       (token-NOT))
       ("OR"       (token-OR))
       ("AND"       (token-AND))
       ("DIV"       (token-DIV))
       ("MUL"       (token-MUL))
       ("SUB"       (token-SUB))
       ("EXP"       (token-EXP))
       ("JUMPDEST"  (token-NOP))
       ("JUMPI"     (token-JUMPI))
       ("JUMP"     (token-JUMP))
       ("THROWI"     (token-THROWI))
       ("THROW"     (token-THROW))
       ("SHA3"     (token-SHA3))
       ("ARRAYACCESS" (token-ARRAYACCESS))
       ("ISZERO"    (token-ISZERO))
       ("RETURN"    (token-RETURN))
       ("NOP"    (token-NOP))
       ("EQ"         (token-EQCMP))
       ("="         (token-EQ))
       ("?"         (token-HOLE))
       (","         (token-COMMA))
       (identifier   (token-REG lexeme))
       (snumber10   (token-NUM lexeme))
       (snumber16   (token-NUM lexeme))
       (identifier  (token-WORD lexeme))
       (identifier   (token-VAR lexeme))
       (whitespace   (position-token-token (asm-lexer input-port)))
       ((eof) (token-EOF))))

    ;; Complete parser
    (set! asm-parser
      (parser
       (start program)
       (end EOF)
       (error
        (lambda (tok-ok? tok-name tok-value start-pos end-pos)
          (raise-syntax-error 'parser
                              (format "syntax error at '~a' in src l:~a c:~a"
                                      tok-name
                                      (position-line start-pos)
                                      (position-col start-pos)))))
       (tokens a b)
       (src-pos)
       (grammar

        ; ? ;; add more grammar rules
        ;;; (arg  ((REG) $1)
        ;;;       ((NUM) $1))

        ;;; (args ((arg) (list $1))
        ;;;       ((arg args) (cons $1 $2))
        ;;;       ((arg COMMA args) (cons $1 $3)))
        (instruction
          ;;; ((NUM COLON WORD args)    (inst $3 (list->vector $4)))
         ;; when parsing ?, return (inst #f #f) as an unknown instruction
         ;; (a place holder for synthesis)
          ((HOLE)         (inst #f #f))
          ((NUM COLON REG EQ LT REG REG) (inst "lt" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ GT REG REG) (inst "gt" (vector $1 $3 $6 $7)))
          ((NUM COLON REG EQ SUB REG REG) (inst "sub" (vector $1 $3 $6 $7)))
          ((NUM COLON REG EQ SUB REG NUM) (inst "sub#" (vector $1 $3 $6 $7)))
          ((NUM COLON REG EQ ADD REG REG) (inst "add" (vector $1 $3 $6 $7)))
          ((NUM COLON REG EQ ADD REG NUM) (inst "add#" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ XOR REG REG) (inst "xor" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ MOD REG REG) (inst "mod" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ DIV REG REG) (inst "div" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ MUL REG REG) (inst "mul" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ AND REG REG) (inst "and" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ OR REG REG) (inst "or" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ EQCMP NUM REG) (inst "eqcmp" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON REG EQ LP arg RP) (inst "load" (vector $1 $3 $6)))
          ;;; ((NUM COLON LP REG RP EQ arg) (inst "store" (vector $1 $4 $7)))
          ;;; ((NUM COLON LP NUM RP EQ arg) (inst "store" (vector $1 $4 $7)))
          ;;; ((NUM COLON REG EQ SLP arg RP) (inst "sload" (vector $1 $3 $6)))

          ;;; ((NUM COLON SLP arg RP EQ arg) (inst "sstore" (vector $1 $4 $7)))
          ;;; ((NUM COLON LP arg RP EQ LC arg COMMA arg RC) (inst "nop" (vector $1)))
          ;;; ((NUM COLON LP NUM RP EQ LC args RC) (inst "store-set" (vector $1 $4 (list->vector $8))))

          ((NUM COLON REG EQ NUM) (inst "eq#" (vector $1 $3 $5)))
          ((NUM COLON REG EQ REG) (inst "eq" (vector $1 $3 $5)))
          ((NUM COLON REG EQ ARRAYACCESS REG REG) (inst "arrayaccess" (vector $1 $3 $6 $7)))
          ;;; ((NUM COLON NOP)        (inst "nop" (vector $1))) 
          ;;; ((NUM COLON JUMPI arg REG) (inst "jumpi" (vector $1 $4 $5)))
          ;;; ((NUM COLON JUMP arg) (inst "jump" (vector $1 $4)))
         ) 
        
        (code   
         (() (list))
         ((instruction code) (cons $1 $2)))

        (program
         ((code) (list->vector $1)))
       )))


    ;;;;;;;;;;;;;;;;;;;;;;;;; For cooperative search ;;;;;;;;;;;;;;;;;;;;;;;
    #|
    ;; Required method if using cooperative search driver.
    ;; Read from file and convert file content into the format we want.
    ;; Info usually includes live-out information.
    ;; It can also contain extra information such as precondition of the inputs.
    (define/override (info-from-file file)
      ? ;; modify this function

      ;; Example
      ;; read from file
      (define lines (file->lines file))
      (define live-out (string-split (first lines) ","))
      live-out)
    |#

    ))

