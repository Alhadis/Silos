package dirtool

import "core:fmt"
import "core:os"
import st "shared:gruftools/stringtools"

FileType :: enum {
    Pipe,       // FIFO
    Character,  // character device
    Directory,  // directory
    Block,      // block device
    Regular,    // regular file
    Link,       // symbolic link
    Socket,     // unix socket
    Nil,        // Error checking
}

FilePermissions :: struct {
    usr_read    : bool, // is <user> readable
    usr_write   : bool, // is <user> writeable
    usr_exec    : bool, // is <user> executable
    grp_read    : bool, // is <group> readable
    grp_write   : bool, // is <group> writeable
    grp_exec    : bool, // is <group> executable
    oth_read    : bool, // readable by others
    oth_write   : bool, // writeable by others
    oth_exec    : bool, // executable by others
    setuid      : bool, // open as user owner id
    setgid      : bool, // open as group owner id
}

DirectoryItem :: struct {
    name        : string,           // file name
    size        : u64,              // residing directory
    type        : FileType,         // easier-to-handle than Stat.mode masks
    perms       : ^FilePermissions, // easier-to-handle than Stat.mode masks
    modified    : i64,              // time in nano seconds
    uid         : u32,              // file user owner id
    gid         : u32,              // file group owner id
}

OpenDir :: struct {
    path    : string,
    dir     : os.Dir,
}

__open: ^OpenDir;
__err:  os.Errno;

init :: proc() {
    __open = new(OpenDir);
}

cleanup :: proc() {
    if __open != nil {
        free(__open);
    }
}

read_directory :: proc(path: string) -> []DirectoryItem {
    if __open.path != path {
        // Only need to opendir if path has changed
        __open.dir, __err = os.opendir(path);
        if __err != os.ERROR_NONE {
            fmt.eprintf("Error [%d] opening dir: %s\n", __err, path);
            os.exit(1);
        }
    } 

    else {
        // Else rewind back to start of dir
        __err = os.rewinddir(__open.dir);
        if __err != os.ERROR_NONE {
            fmt.eprintf("Error [%d] opening dir: %s\n", __err, path);
            os.exit(1);
        }
    }

    item_list := make([dynamic]DirectoryItem);
    for dirent, __err := os.readdir(__open.dir); dirent != nil; dirent, __err = os.readdir(__open.dir) {
        if dirent == nil {
            if __err != os.ERROR_NONE {
                fmt.eprintf("Error [%d] reading dir: %s\n", __err, path);
                os.exit(1);
            }

            break;
        }

        dir_item := __handle_dirent(path, dirent);
        append(&item_list, dir_item^);
    }

    return item_list[:];
}

__handle_dirent :: proc(path: string, dirent : ^os.Dirent) -> ^DirectoryItem {
    item := new(DirectoryItem);

    file_name := st.u8_array_to_string(dirent.d_name[:]);
    file_str := fmt.aprintf("%s/%s", path, file_name);
    file_stat, __err := os.stat(file_str);
    if __err != os.ERROR_NONE {
        fmt.eprintf("Error [%d] get file stat: %s", __err, file_str);
        os.exit(1);
    }

    item.name       = file_name;
    item.size       = 0;
    item.type       = __get_file_type(file_stat.mode);
    item.perms      = __get_file_perms(file_stat.mode);
    item.modified   = file_stat.modified.nanoseconds;
    item.uid        = file_stat.uid;
    item.gid        = file_stat.gid;

    return item;
}

__get_file_type :: proc(file_mode: u32) -> FileType {
    if os.S_ISFIFO(file_mode) {
        return FileType.Pipe;
    } else if os.S_ISCHR(file_mode) {
        return FileType.Character;
    } else if os.S_ISDIR(file_mode) {
        return FileType.Directory;
    } else if os.S_ISBLK(file_mode) {
        return FileType.Block;
    } else if os.S_ISREG(file_mode) {
        return FileType.Regular;
    } else if os.S_ISLNK(file_mode) {
        return FileType.Link;
    } else if os.S_ISSOCK(file_mode) {
        return FileType.Socket;
    } else {
        return FileType.Nil;
    }
}

__get_file_perms :: proc(file_mode: u32) -> ^FilePermissions {
    file_perms := new(FilePermissions);

    file_perms.usr_read    = (file_mode & os.S_IRUSR) != 0;
    file_perms.usr_write   = (file_mode & os.S_IWUSR) != 0;
    file_perms.usr_exec    = (file_mode & os.S_IXUSR) != 0;
    file_perms.grp_read    = (file_mode & os.S_IRGRP) != 0;
    file_perms.grp_write   = (file_mode & os.S_IWGRP) != 0;
    file_perms.grp_exec    = (file_mode & os.S_IXGRP) != 0;
    file_perms.oth_read    = (file_mode & os.S_IROTH) != 0;
    file_perms.oth_write   = (file_mode & os.S_IWOTH) != 0;
    file_perms.oth_exec    = (file_mode & os.S_IXOTH) != 0;
    file_perms.setuid      = (file_mode & os.S_ISUID) != 0;
    file_perms.setgid      = (file_mode & os.S_ISGID) != 0;

    return file_perms;
}
