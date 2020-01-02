%module sha256
%{
#define SWIG_FILE_WITH_INIT
#include "config.h"
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<mbedtls/bn.h>
#include<mbedtls/sha.h>
#include<mbedtls/rand.h>
%}

%include "typemaps.i"
%include "cstring.i"

%cstring_bounded_output(char *p, 1024);
%cstring_bounded_output(char *q, 1024);
%cstring_bounded_output(char *g, 1024);
%cstring_bounded_output(char *hk, 1024);
%cstring_bounded_output(char *tk, 1024);
extern int keygen(int bits, char *p, char *q, char *g, char *hk, char *tk);
