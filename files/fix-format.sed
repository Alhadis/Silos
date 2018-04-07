#!/bin/sed -f

/^$/{
    N
    /^.$/D
}
/\[picture.*/{
    s//!&/g
}
