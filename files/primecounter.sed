# Author:
#   cyriax <brast@cs.uni-frankfurt.de>
#
# Usage:
#       echo [number] | sed -f primecounter.sed
#           counts number of primes < n

# "So I heard you like searching and replacing...
# Did you know sed is turing-complete?"
# "Well, of course - searching and replacing is
# lambda calculus, isn't it?".

# Took about 5h of funtime!
# I thought about calling it jobsecurity.sed :-P

## WARNING: uses UNARY, BINARY, TRINARY and DECIMAL logic
## WARNING: contains regular expressions
## WARNING: it's evil, trust me!

# If you want watch the program calculate,
# look for "#p" and uncomment away.
# The more "#" in front of the "p"
# the more uncommenting it will spam.

# From the sed manual at:
# https://www.gnu.org/software/sed/manual/sed.html#Programming-Commands
#
#	3.7 Commands for sed gurus
#	
#	In most cases, use of these commands indicates that you are probably better off programming in something like awk or Perl. But occasionally one is committed to sticking with sed, and these commands can enable one to write quite convoluted scripts.




# License:
#   Copyright (c) 2016 Jonathan Cyriax Brast
#
#       Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#       The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### incipit


###p

s/[^0-9]/?/g;t ierror
s/^0*$/NOPE/;t zeroerror
s/^0*//

s/^[0-9]*$/&p/
b decToBin
:ierror
s/^.*$/Error: input is no integer!/;q
:zeroerror
s/^.*$/Error: input must be larger than zero!/;q


##
## Convert stuff to 
##

:decToBin
##p
s/p0\+/p/;tdecToBin
s/Xp//;t checkBin
s/^1\([0-9]*\)p\([01]*\)/X\1pA\2B1/;tbinaddloop
s/^2\([0-9]*\)p\([01]*\)/X\1pA\2B10/;tbinaddloop
s/^3\([0-9]*\)p\([01]*\)/X\1pA\2B11/;tbinaddloop
s/^4\([0-9]*\)p\([01]*\)/X\1pA\2B100/;tbinaddloop
s/^5\([0-9]*\)p\([01]*\)/X\1pA\2B101/;tbinaddloop
s/^6\([0-9]*\)p\([01]*\)/X\1pA\2B110/;tbinaddloop
s/^7\([0-9]*\)p\([01]*\)/X\1pA\2B111/;tbinaddloop
s/^8\([0-9]*\)p\([01]*\)/X\1pA\2B1000/;tbinaddloop
s/^9\([0-9]*\)p\([01]*\)/X\1pA\2B1001/;tbinaddloop
s/^0\([0-9]*\)p\([01]*\)/X\1p\2/;tdecToBin
# Multiply by 1010
s/^X\([0-9]*\)p\([01]*\)/\1pA\2000B\20/
:binaddloop
###p
s/p\([012]*\)A\([01]*\)0B\([01]*\)0$/p0\1A\2B\3/;t binaddloop
s/p\([012]*\)A\([01]*\)0B\([01]*\)1$/p1\1A\2B\3/;t binaddloop
s/p\([012]*\)A\([01]*\)1B\([01]*\)0$/p1\1A\2B\3/;t binaddloop
s/p\([012]*\)A\([01]*\)1B\([01]*\)1$/p2\1A\2B\3/;t binaddloop
s/p\([012]*\)A\([01]*\)B\([01]*\)$/p\2\3\1/
:bincarry;t bincarry
####p
s/02/10/g;s/12/20/g;s/p2/p10/;t bincarry
b decToBin

##
## Exit on small numbers
## (this is because 5 is the first number to be checked!)

:checkBin;tcheckBin
# quit on 1,2 or 3
s/^1$/0/;t kthxbye
s/^10$/0/;t kthxbye
s/^11$/1/;t kthxbye

##
## Initialize memory pattern
##

s/1$/0/
s/^[10]\+$/b11i11n&c10/
h;t loop



#########################
#### MAIN LOOP BEGIN ####
#########################



: loop; t loop; g
##p

##
## increment Index
##

s/\([^i]*\)i\([01]*\)1n\(.*\)/\1i\22n\3/
:indexcarry
###p
s/12/20/;s/02/10/;s/i2/i10/;t indexcarry
s/\([^i]*\)i\([01]*\)0n\(.*\)/\1i\21n\3/
h

##
## Exit if index >= target
## 

s/[^i]*i\([01]*\).n\([01]*\)0.*/<\1=\2>/
:cutcmp
##p
s/<\([01]*\)0=\([01]*\)0>/<\1=\2>/  ;t cutcmp
s/<\([01]*\)1=\([01]*\)1>/<\1=\2>/  ;t cutcmp
# if both are equal then exit
s/<=>/will exit/ ; g ; t exit
g


##
## Compute GCD of index and bignum
##

s/b\([01]*\)i\([01]*\)n.*/<\1G\2>/
: gcdloop ; t gcdloop
##p
# exit if gcd is 1
s/<G1>.*/gcd is 1 -> prime found/ ; t newprime
s/<1G>.*/gcd is 1 -> prime found/ ; t newprime
# exit if gcd > 1
s/<G[01]*>.*/gcd is > 1 -> composite found/ ; t loop
s/<[01]*0\+G[01]*0>.*/gcd is > 1 -> composite found/ ; t loop
# strip away trailing 0s
s/<\([01]*1\)0\+G\([01]*1\)>/<\1G\2>/; t gcdloop
# subtract gcd(A,B) = gcd((A-B)/2,B)
s/<\([01]*\)G\([01]*\)>/\1-\2=<\1G\2>\2/

: gcdsubloop ; t gcdsubloop
###p
s/^0*\([01]*\)-=\([01]*\)/\1\2/;t gcdsubfinish
s/^-/&/;t gcdsuberror
s/^0*\([01]*\)0-\([01]*\)0=\([01]*\)/\1-\2=0\3/;t gcdsubloop
s/^0*\([01]*\)1-\([01]*\)1=\([01]*\)/\1-\2=0\3/;t gcdsubloop
s/^0*\([01]*\)1-\([01]*\)0=\([01]*\)/\1-\2=1\3/;t gcdsubloop
s/^0*\([01]*\)0-\([01]*\)1=\([01]*\)/\1U-\20=\3/
:gcdsubcarry
####p
s/0U/U1/;t gcdsubcarry
s/1U/01/;t gcdsubloop

:gcdsuberror
###p
s/^-\([01]*\)=\([01]*\)<\([01]*\)G\([01]*\)>.*$/\1-=\2<\3G\4>\3/
:gcdsuberrorloop
####p
s/\([01]*\)-\([01]*\)=1\([01]*\)/\10-\21\=\3/;tgcdsuberrorloop
s/\([01]*\)-\([01]*\)=0\([01]*\)/\10-\20\=\3/;tgcdsuberrorloop
s/^0*\([01]*\)-0*\([01]*\)/\1-\2/;b gcdsubloop

:gcdsubfinish
###p
s/^0*\([01]*\)<[^<]*>\([01]*\)/<\1G\2>/;t gcdloop





: newprime
##
## Multiply bignum by index 
## (Only if gcd(index, bignum) == 1)
##

g
s/b\([01]*\)i\([01]*\)n.*/\1x\2p/
:multiloop ; t multiloop
##p
# AxB0 = A0xB
s/\([01]*\)x\([01]*\)0p/\10x\2p/;t multiloop
# AxB1 = A0xB+A
s/\([01]*\)x\([01]*\)1p/\10x\2pA\1B/;t addloop
s/[01]*xp\([01]*\)$/R\1/;t multiend
:addloop
# Addition rules in trinary ^^
s/p\([012]*\)A\([01]*\)0B\([01]*\)0$/p0\1A\2B\3/;t addloop
s/p\([012]*\)A\([01]*\)0B\([01]*\)1$/p1\1A\2B\3/;t addloop
s/p\([012]*\)A\([01]*\)1B\([01]*\)0$/p1\1A\2B\3/;t addloop
s/p\([012]*\)A\([01]*\)1B\([01]*\)1$/p2\1A\2B\3/;t addloop
# fallthrough: just paste the rest
s/p\([012]*\)A\([01]*\)B\([01]*\)$/p\2\3\1/
:addloopcarry ; t addloopcarry
s/02/10/g;s/12/20/g;s/p2/p10/;t addloopcarry
b multiloop


:multiend
# add result as bignum to memory pattern
x;G
s/b[01]*i\(.*\)\nR\([01]*\)$/b\2i\1/
h



##
## increment counter
## Only if gcd(index, bignum) == 1
## 
:incrementcounter ; t incrementcounter
###p
s/\([^c]*c[01]*\)0$/\11/;t debugout
s/\([^c]*c[01]*\)1$/\12/;t countcarry
:countcarry
####p
s/12/20/;s/02/10/;s/c2/c10/;t countcarry
h




:debugout
h
s/^.*i\(.*\)n.*c\(.*\)$/DBG: prime: \1 counter: \2/
#p
t loop


#######################
#### MAIN LOOP END ####
#######################

##
## Converting the counter to decimal output
##

: exit

# delete everything but the counter
s/[^c]*c\([01]\)/\1/

# convert binary to unary
s/^.*$/&A/
:binToUnary;t binToUnary
###p
s/^0*A//;t unaryToDec
s/1A/0A|/;t binToUnary
s/0A/UA|/;t unarycarry
:unarycarry ; t unarycarry
s/0U/U1/;s/1U/01/; t unarycarry ; b binToUnary

# convert unary to decimal
:unaryToDec
s/|*/&D/
:unaryToDecLoop ; t unaryToDecLoop
##p
s/^D//; t kthxbye
s/X/|/g
s/||||||||||/X/g
:clear1;tclear1
s/\(X*\)|||||||||D\([0-9]*\)/\1D9\2/;t unaryToDecLoop
s/\(X*\)||||||||D\([0-9]*\)/\1D8\2/;t unaryToDecLoop
s/\(X*\)|||||||D\([0-9]*\)/\1D7\2/;t unaryToDecLoop
s/\(X*\)||||||D\([0-9]*\)/\1D6\2/;t unaryToDecLoop
s/\(X*\)|||||D\([0-9]*\)/\1D5\2/;t unaryToDecLoop
s/\(X*\)||||D\([0-9]*\)/\1D4\2/;t unaryToDecLoop
s/\(X*\)|||D\([0-9]*\)/\1D3\2/;t unaryToDecLoop
s/\(X*\)||D\([0-9]*\)/\1D2\2/;t unaryToDecLoop
s/\(X*\)|D\([0-9]*\)/\1D1\2/;t unaryToDecLoop
s/\(X*\)D\([0-9]*\)/\1D0\2/;t unaryToDecLoop


:kthxbye
q


