package fmt

import "core:fmt"
import "core:os"
import "core:strings"
import dt "shared:gruftools/dirtool"

print_directory :: proc(path: string) {

}

print_item :: proc(item: ^dt.DirectoryItem, use_color, show_all, long_print, human_readable: bool) {
    if !show_all && item.name[0] == '.' {
        // Don't show dotfiles unless SHOW_ALL specified
        return;
    }

    perms_str := __gen_perms_string(item.perms);

    fmt.printf("%c%s\t%s\n",
        __gen_filetype_rune(item.type),
        __gen_perms_string(item.perms),
        item.name
    );
}

__gen_filetype_rune :: proc(type: dt.FileType) -> rune {
    switch (type) {
        case dt.FileType.Pipe:
            return 'p';
        case dt.FileType.Character:
            return 'c';
        case dt.FileType.Directory:
            return 'd';
        case dt.FileType.Block:
            return 'b';
        case dt.FileType.Link:
            return 'l';
        case dt.FileType.Socket:
            return 's';
        case:
            return '-';
    }
}

__gen_perms_string :: proc(perms: ^dt.FilePermissions) -> string {
    builder := strings.make_builder();
    defer strings.destroy_builder(&builder);

    strings.write_rune(&builder, perms.usr_read   ? 'r' : '-');
    strings.write_rune(&builder, perms.usr_write  ? 'w' : '-');
    strings.write_rune(&builder, perms.usr_exec   ? 'x' : '-');
    strings.write_rune(&builder, perms.grp_read   ? 'r' : '-');
    strings.write_rune(&builder, perms.grp_write  ? 'w' : '-');
    strings.write_rune(&builder, perms.grp_exec   ? 'x' : '-');
    strings.write_rune(&builder, perms.oth_read   ? 'r' : '-');
    strings.write_rune(&builder, perms.oth_write  ? 'w' : '-');
    strings.write_rune(&builder, perms.oth_exec   ? 'x' : '-');

    return strings.clone(strings.to_string(builder));
}

__get_user_string :: proc(userid: u32) -> string {
    return "";
}

__get_group_string :: proc(groupid: u32) -> string {
    return "";
}
