
(define-library (cyclone base64)
  (export base64-encode base64-encode-string base64-encode-bytevector
          base64-decode base64-decode-string base64-decode-bytevector
          base64-encode-header)
  (import (scheme base)
          (cyclone string)
          (srfi 60))
  (begin
    (define (port->string in)
      (let ((out (open-output-string)))
        (let lp ()
          (let ((ch (read-char in)))
            (cond
             ((eof-object? ch)
              (get-output-string out))
             (else
              (write-char ch out)
              (lp))))))))
  (include "base64.scm"))
