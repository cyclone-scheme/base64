Implementation of [Base64 encoding](https://en.wikipedia.org/wiki/Base64) ported from Chibi Scheme.

# API

## (base64-encode-header encoding str . o)

Return a base64 encoded representation of the string `str` 
 as per RFC1522, split across
multiple MIME-header lines as needed to keep each lines length
less than `max-col`.  The string is encoded as is, and the
encoding `enc` is just used for the prefix, i.e. you are
responsible for ensuring `str` is already encoded according to
`enc`.  The optional argument `nl` is the newline
separator, defaulting to `crlf`.

base64-encode 
base64-encode-string 
base64-encode-bytevector
base64-decode 
base64-decode-string 
base64-decode-bytevector

