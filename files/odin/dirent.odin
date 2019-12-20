package dirent

foreign import libc "system:c"

import _c "core:c"

ino_t :: _c.ulong;
off_t :: _c.long;

RawDir :: any;
Dir :: ^RawDir;

Dirent :: struct {
    __ino_t   : ino_t,
    __off_t   : off_t,
    d_reclen  : _c.ushort,
    d_type    : _c.uchar,
    d_name    : [256]_c.char,
};

@(default_calling_convention="c")
foreign libc {
    @(link_name="alphasort")
    alphasort :: proc(d1 : ^^Dirent, d2 : ^^Dirent) -> _c.int ---;

    @(link_name="opendir")
    opendir :: proc(dirname : cstring) -> Dir ---;

    @(link_name="fdopendir")
    fdopendir :: proc(fd : _c.int) -> Dir ---;

    @(link_name="dirfd")
    dirfd :: proc(dirp : Dir) -> _c.int ---;

    @(link_name="closedir")
    closedir :: proc(dirp : Dir) -> _c.int ---;

    @(link_name="readdir")
    readdir :: proc(dirp : Dir) -> ^Dirent ---;

    @(link_name="readdir_r")
    readdir_r :: proc(dirp : Dir, entry : ^Dirent, result : ^^Dirent) -> _c.int ---;

    @(link_name="rewinddir")
    rewinddir :: proc(dirp : Dir) ---;

    @(link_name="scandir")
    scandir :: proc(dir : cstring, namelist : ^^^Dirent, sel : ^proc(dirp : ^Dirent) -> _c.int, compar : ^proc(d1 : ^^Dirent, d2 : ^^Dirent) -> _c.int) -> _c.int ---;

    @(link_name="seekdir")
    seekdir :: proc(dirp : Dir, loc : _c.long) ---;

    @(link_name="telldir")
    telldir :: proc(dirp : Dir) -> _c.long ---;
}
