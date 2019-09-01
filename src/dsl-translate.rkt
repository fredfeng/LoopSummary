#lang racket
(require "inst.rkt")

(provide (all-defined-out))

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
        [_           (println "I dont know about this!!!")])

      ))