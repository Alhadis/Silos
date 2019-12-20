package http

// Info codes - 1xx
CODE_100 :: "Continue";
CODE_101 :: "Switching Protocols";

// Success codes - 2xx
CODE_200 :: "OK";
CODE_201 :: "Created";
CODE_202 :: "Accepted";
CODE_203 :: "Non-Authoritative Information";
CODE_204 :: "No Content";
CODE_205 :: "Reset Content";
CODE_206 :: "Partial Content";

// Redirection codes - 3xx
CODE_300 :: "Multiple Choices";
CODE_301 :: "Moved Permanently";
CODE_302 :: "Found";
CODE_303 :: "See Other";
CODE_304 :: "Not Modified";
CODE_305 :: "Use Proxy";
// CODE_306 - unused
CODE_307 :: "Temporary Redirect";

// Client error - 4xx
CODE_400 :: "Bad Request";
CODE_401 :: "Unauthorized";
CODE_402 :: "Payment Required";
CODE_403 :: "Forbidden";
CODE_404 :: "Not Found";
CODE_405 :: "Method Not Allowed";
CODE_406 :: "Not Acceptable";
CODE_407 :: "Proxy Authentication Required";
CODE_408 :: "Request Timeout";
CODE_409 :: "Conflict";
CODE_410 :: "Gone";
CODE_411 :: "Length Required";
CODE_412 :: "Precondition Failed";
CODE_413 :: "Request Entity Too Large";
CODE_414 :: "Request-URI Too Long";
CODE_415 :: "Unsupported Media Type";
CODE_416 :: "Requested Range Not Satisfiable";
CODE_417 :: "Expectation Failed";

// Server error - 5xx
CODE_500 :: "Internal Server Error";
CODE_501 :: "Not Implemented";
CODE_502 :: "Bad Gateway";
CODE_503 :: "Service Unavailable";
CODE_504 :: "Gateway Timeout";
CODE_505 :: "HTTP Version Not Supported";

/*
General headers
===============

Cache-Control
Connection
Date
Pragma
Trailer
Transfer-Encoding
Upgrade
Via
Warning
*/

/*
Request methods
===============

OPTIONS
GET
HEAD
POST
PUT
DELETE
TRACE
CONNECt

Request headers
===============

Accept
Accept-Charset
Accept-Encoding
Accept-Language
Authorization
Expect
From
Host - required in HTTP/1.1
If-Match
If-Modified-Since
If-None-Match
If-Range
If-Unmodified-Since
Max-Forwards
Proxy-Authorization
Range
Referer
TE
User-Agent
*/

/*
Response header
===============

Accept-Ranges
Age
ETag
Location
Proxy-Authenticate
Retry-After
Server
Vary
WWW-Authenticate
*/

/*
Entity header
=============

Allow
Content-Encoding
Content-Language
Content-Length
Content-Location
Content-MD5
Content-Range
Content-Type
Expires
Last-Modified

*/