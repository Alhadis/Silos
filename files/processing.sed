1,3d
s/^    //
/tyInfo/,+1d
s/There/T/g
s/Here/H/g
s/\\ //g
s/\['/\[ '/g
s/ghc-prim-.*:GHC\.Types\.//g
/instance HasDatatypeInfo/,$d
