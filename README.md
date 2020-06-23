# base64

## Index 
- [Intro](#Intro)
- [Dependencies](#Dependencies)
- [Test dependencies](#Test-dependencies)
- [Foreign dependencies](#Foreign-dependencies)
- [API](#API)
- [Examples](#Examples)
- [Author(s)](#Author(s))
- [Maintainer(s)](#Maintainer(s))
- [Version](#Version) 
- [License](#License) 
- [Tags](#Tags) 

## Intro 
Implementation of [Base64 encoding](https://en.wikipedia.org/wiki/Base64) ported from Chibi Scheme.

## Dependencies 
None

## Test-dependencies 
None

## Foreign-dependencies 
None

## API 

### (cyclone base64)

#### [procedure] `(base64-encode [[input-port] [output-port]])`

Read and write encoding to default input / output ports, or specific ports if given.

#### [procedure] `(base64-encode-string str)`

Return a base64 encoded representation of string according to the official base64 standard as described in RFC3548.

#### [procedure] `(base64-encode-bytevector bv)`
Return a base64 encoded representation of bytevector according to the official base64 standard as described in RFC3548.

#### [procedure] `(base64-decode [[input-port] [output-port]])`

Read and write decoding to default input / output ports, or specific ports if given.

#### [procedure] `(base64-decode-string str)`
Return a base64 decoded representation of string, also interpreting the alternate 62 & 63 valued characters as described in RFC3548.  Other out-of-band characters are silently stripped, and = signals the end of the encoded string.  No errors will be raised.

Create a result buffer with the maximum possible length for the input, and pass it to the internal base64-decode-string! utility.  If the resulting length used is exact, we can return that buffer,
otherwise we return the appropriate substring.

#### [procedure] `(base64-decode-bytevector bv)`
Same as above but decode the given bytevector.

#### [procedure] `(base64-encode-header encoding str . o)`

Return a base64 encoded representation of the string `str` as per RFC1522, split across multiple MIME-header lines as needed to keep each lines length less than `max-col`.  The string is encoded as is, and the encoding `enc` is just used for the prefix, i.e. you are responsible for ensuring `str` is already encoded according to `enc`.  The optional argument `nl` is the newline separator, defaulting to `crlf`.

## Examples
```scheme
(import (scheme base) 
        (cyclone base64) 
        (cyclone string) 
        (cyclone test))
(test-group "base64"

    (test "YW55IGNhcm5hbCBwbGVhc3VyZS4="
        (base64-encode-string "any carnal pleasure."))
    (test "YW55IGNhcm5hbCBwbGVhc3VyZQ=="
        (base64-encode-string "any carnal pleasure"))
    (test "YW55IGNhcm5hbCBwbGVhc3Vy"
        (base64-encode-string "any carnal pleasur"))
    (test "YW55IGNhcm5hbCBwbGVhc3U="
        (base64-encode-string "any carnal pleasu"))
    (test "YW55IGNhcm5hbCBwbGVhcw=="
        (base64-encode-string "any carnal pleas"))

    (test "any carnal pleas"
        (base64-decode-string "YW55IGNhcm5hbCBwbGVhcw=="))
    (test "any carnal pleasu"
        (base64-decode-string "YW55IGNhcm5hbCBwbGVhc3U="))
    (test "any carnal pleasur"
        (base64-decode-string "YW55IGNhcm5hbCBwbGVhc3Vy"))
    (test "any carnal pleas"
        (base64-decode-string "YW55IGNhcm5hbCBwbGVhcw"))
    (test "any carnal pleasu"
        (base64-decode-string "YW55IGNhcm5hbCBwbGVhc3U"))
)

(test-exit)
```

## Author(s)
Alex Shinn

## Maintainer(s) 
Justin Ethier

## Version 
0.2

## License 
BSD

## Tags 
networking

