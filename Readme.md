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





## (qp-encode bv start-col max-col separator)

Allow for RFC1522 quoting for headers by always escaping `?` and `_`

## (quoted-printable-encode-string src . o)

Return a quoted-printable encoded representation of the input
according to the official standard as described in RFC2045.

`?` and `_` are always encoded for compatibility with RFC1522
encoding, and soft newlines are inserted as necessary to keep each
lines length less than `max-col` (default 76).  The starting
column may be overridden with `start-col` (default 0).

## (quoted-printable-encode . o)

Variation of the above to read and write to ports.

## (quoted-printable-encode-bytevector . o)

## (quoted-printable-encode-header encoding . o)

Return a quoted-printable encoded representation of string as
above, wrapped in =?ENC?Q?...?= as per RFC1522, split across
multiple MIME-header lines as needed to keep each lines length
less than `max-col`.  The string is encoded as is, and the
encoding `enc` is just used for the prefix, i.e. you are
responsible for ensuring `str` is already encoded according to
`enc`.


## (quoted-printable-decode-string src . o)

Return a quoted-printable decoded representation of `str`.  If
`mime-header?` is specified and true, _ will be decoded as as
space in accordance with RFC1522.  No errors will be raised on
invalid input.

## (quoted-printable-decode-bytevector  . o)

## (quoted-printable-decode . o)

Variation of the above to read and write to ports.

