// By 0x9ef
module winreg

// A handle to the open key to be closed. 
// The handle must have been opened by the 
// RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx,
// RegOpenKeyTransacted, or RegConnectRegistry function.
type Key voidptr

// Status of action.
type Status u32

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regclosekey
// close_key closes a handle to the specified registry key.
fn close_key(k mut Key) Status {
    if k != HKEY_MAKE {
        status := C.RegCloseKey(k)
        if status == ERROR_SUCCESS {
            k = 0x00000000 // reset key
        }
        return status
    }
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regclosekey
fn (k mut Key) close() Status {
    return close_key(k)
}

// Ref - winnt.h
const (
    ERROR_SUCCESS  =  0
    ERROR_MAKED    =  0xffffffff // Not from winnt.h
)

// Ref - winnt.h
const ( 
    HKEY_MAKE                 =  Key ( i32( 0xffffffff ) )           
    HKEY_CLASSES_ROOT         =  Key ( i32( 0x80000000 ) )
    HKEY_CURRENT_USER         =  Key ( i32( 0x80000001 ) )
    HKEY_LOCAL_MACHINE        =  Key ( i32( 0x80000002 ) )
    HKEY_USERS                =  Key ( i32( 0x80000003 ) )
    HKEY_PERFORMANCE_DATA     =  Key ( i32( 0x80000004 ) )
    HKEY_PERFORMANCE_TEXT     =  Key ( i32( 0x80000050 ) )
    HKEY_PERFORMANCE_NLSTEXT  =  Key ( i32( 0x80000060 ) )
)

const (
    REG_NONE                        =  u32( 0x00000000 )  // No value type
    REG_SZ                          =  u32( 0x00000001 )  // Unicode nul terminated string
    REG_EXPAND_SZ                   =  u32( 0x00000002 )  // Unicode nul terminated string (with environment variable references)
    REG_BINARY                      =  u32( 0x00000003 )  // Free form binary
    REG_DWORD                       =  u32( 0x00000004 )  // 32-bit number
    REG_DWORD_LITTLE_ENDIAN         =  u32( 0x00000004 )  // 32-bit number (same as REG_DWORD)
    REG_DWORD_BIG_ENDIAN            =  u32( 0x00000005 )  // 32-bit number
    REG_LINK                        =  u32( 0x00000006 )  // Symbolic Link (unicode)
    REG_MULTI_SZ                    =  u32( 0x00000007 )  // Multiple Unicode strings
    REG_RESOURCE_LIST               =  u32( 0x00000008 )  // Resource list in the resource map
    REG_FULL_RESOURCE_DESCRIPTOR    =  u32( 0x00000009 )  // Resource list in the hardware description
    REG_RESOURCE_REQUIREMENTS_LIST  =  u32( 0x00000010 )
    REG_QWORD                       =  u32( 0x00000011 )  // 64-bit number
    REG_QWORD_LITTLE_ENDIAN         =  u32( 0x00000011 )  // 64-bit number (same as REG_QWORD)
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regcreatekeyexa
const (
    // If this flag is set, the function ignores the samDesired parameter 
    // and attempts to open the key with the access required to backup or restore the key. 
    // If the calling thread has the SE_BACKUP_NAME privilege enabled,
    // the key is opened with the ACCESS_SYSTEM_SECURITY and KEY_READ access rights. 
    // If the calling thread has the SE_RESTORE_NAME privilege enabled, 
    // beginning with Windows Vista, the key is opened with the ACCESS_SYSTEM_SECURITY, 
    // DELETE and KEY_WRITE access rights. If both privileges are enabled, 
    // the key has the combined access rights for both privileges. 
    // For more information, see Running with Special Privileges.
    REG_OPTION_BACKUP_RESTORE  =  u32( 0x00000004 )

    // This key is a symbolic link. 
    // The target path is assigned to the L"SymbolicLinkValue" value of the key. 
    // The target path must be an absolute registry path.
    REG_OPTION_CREATE_LINK     =  u32( 0x00000002 )

    // This key is not volatile; this is the default. 
    // The information is stored in a file and is preserved when the system is restarted. 
    // The RegSaveKey function saves keys that are not volatile.
    REG_OPTION_NON_VOLATILE    =  u32( 0x00000000 )

    // All keys created by the function are volatile. 
    // The information is stored in memory and is not preserved when the corresponding 
    // registry hive is unloaded. 
    // For HKEY_LOCAL_MACHINE, this occurs only when the system initiates a full shutdown. 
    // For registry keys loaded by the RegLoadKey function, 
    // this occurs when the corresponding RegUnLoadKey is performed. 
    // The RegSaveKey function does not save volatile keys. 
    // This flag is ignored for keys that already exist.
    REG_OPTION_VOLATILE        =  u32( 0x00000001 )
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regnotifychangekeyvalue#parameters
const (
    // Notify the caller if a subkey is added or deleted.
    REG_NOTIFY_CHANGE_NAME        =  u32( 0x00000001 )

    // Notify the caller of changes to the attributes of the key, 
    // such as the security descriptor information.
    REG_NOTIFY_CHANGE_ATTRIBUTES  =  u32( 0x00000002 )

    // Notify the caller of changes to a value of the key. 
    // This can include adding or deleting a value, or changing an existing value.
    REG_NOTIFY_CHANGE_LAST_SET    =  u32( 0x00000004 )

    // Notify the caller of changes to the security descriptor of the key.
    REG_NOTIFY_CHANGE_SECURITY    =  u32( 0x00000008 )

    // Indicates that the lifetime of the registration must not be tied to the lifetime 
    // of the thread issuing the RegNotifyChangeKeyValue call.
    REG_NOTIFY_THREAD_AGNOSTIC    =  u32( 0x10000000 )
)

// Ref - winnt.h
const (
    DELETE        =  u32( 0x00010000 ) // Delete access.
    READ_CONTROL  =  u32( 0x00020000 ) // Read access to the owner, group, and discretionary access control 
                                       // // list (DACL) of the security descriptor.
    WRITE_DAC     =  u32( 0x00040000 ) // Write access to the DACL.
    WRITE_OWNER   =  u32( 0x00080000 ) // Write access to owner.
    SYNCHRONIZE   =  u32( 0x00100000 ) // Synchronize access.
)

// Ref - winnt.h
const (
    STANDARD_RIGHTS_READ     =  (READ_CONTROL)
    STANDARD_RIGHTS_WRITE    =  (READ_CONTROL)
    STANDARD_RIGHTS_EXECUTE  =  (READ_CONTROL)

    // Combines DELETE, READ_CONTROL, WRITE_DAC, WRITE_OWNER, and SYNCHRONIZE access.
    STANDARD_RIGHTS_ALL      =  u32( 0x001F0000 )
    SPECIFIC_RIGHTS_ALL      =  u32( 0x0000FFFF )
)

// Ref - winnt.h
const (
    KEY_QUERY_VALUE          =  u32( 0x0001 ) // Required to query the values of a registry key.
    KEY_SET_VALUE            =  u32( 0x0002 ) // Required to create, delete, or set a registry value.
    KEY_CREATE_SUB_KEY       =  u32( 0x0004 ) // Required to create a subkey of a registry key.
    KEY_ENUMERATE_SUB_KEYS   =  u32( 0x0008 ) // Required to enumerate the subkeys of a registry key.
    KEY_NOTIFY               =  u32( 0x0010 ) // Required to request change notifications for a registry key or for subkeys of a registry key
    KEY_CREATE_LINK          =  u32( 0x0020 ) // Reserved for system use.
)

// Ref - winnt.h
const (
    // Combines the STANDARD_RIGHTS_READ, KEY_QUERY_VALUE, KEY_ENUMERATE_SUB_KEYS, and KEY_NOTIFY values.
    KEY_READ       =  (STANDARD_RIGHTS_READ|KEY_QUERY_VALUE|KEY_ENUMERATE_SUB_KEYS|KEY_NOTIFY)

    // Combines the STANDARD_RIGHTS_WRITE, KEY_SET_VALUE, and KEY_CREATE_SUB_KEY access rights.
    KEY_WRITE      =  (STANDARD_RIGHTS_WRITE|KEY_SET_VALUE|KEY_CREATE_SUB_KEY)

    // Equivalent to KEY_READ.
    KEY_EXECUTE    =  KEY_READ

    // Combines the STANDARD_RIGHTS_REQUIRED, KEY_QUERY_VALUE, KEY_SET_VALUE, 
    // KEY_CREATE_SUB_KEY, KEY_ENUMERATE_SUB_KEYS, KEY_NOTIFY, and KEY_CREATE_LINK access rights.
    KEY_ALL_ACCESS =  0xF003F
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regconnectregistrya
fn connect_registry(k mut Key, machine_name string) ?Key {
    mut _p_hkey := Key(HKEY_MAKE) // initialize
    status := C.RegConnectRegistry(machine_name.cstr(), k, &_p_hkey)
    if (status != ERROR_SUCCESS) {
        // Must be handle with get_last_error()
        return error('Cannot connect to remote rigistry.')
    }
    return _p_hkey
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regcopytreea
fn copy_tree(k_src mut Key, path string, k_dst mut Key) Status {
    // Must be fixed
    return C.RegCopyTree(k_src, path.cstr(), k_dst)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regcreatekeyexa
const (
    REG_DEFAULT_RESERVED     =  u32( 0x00000000 ) // dwReserved = NULL
    REG_DEFAULT_DISPOSITION  =  REG_DEFAULT_RESERVED
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regcreatekeya
fn create_key(k mut Key, path string, access u32) ?/***/Key {
    mut _p_hkey := Key(HKEY_MAKE)
    status := C.RegCreateKeyEx(k, 
        path.cstr(), REG_DEFAULT_RESERVED, 0, REG_OPTION_VOLATILE, access, 0, &_p_hkey, REG_DEFAULT_DISPOSITION)
    if status != ERROR_SUCCESS {
        return error('Cannot create registry key')
    }
    return _p_hkey // &_p_hkey Must return pointer of Key
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletekeyexa#parameters
const (
    KEY_WOW64_32KEY  = 0x0200 // Delete the key from the 32-bit registry view.
    KEY_WOW64_64KEY  = 0x0100 // Delete the key from the 64-bit registry view.
    KEY_WOW64_RES    = 0x0300 // Restore
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletekeya
fn delete_key(k mut Key, path string) Status {
    return C.RegDeleteKey(k, path.cstr())
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletekeyvaluea
// delete_key_value removes the specified value from the specified registry key and subkey.
fn delete_key_value(k mut Key, path string, v string) Status {
    return C.RegDeleteKeyValue(k, path.cstr(), v.cstr())
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletetreea
// delete_tree deletes the subkeys and values of the specified key recursively.
fn delete_tree(k mut Key, path string) Status {
    return C.RegDeleteTree(k, path.cstr())
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletevaluea
// delete_value removes a named value from the specified registry key. 
// Note that value names are not case sensitive.
fn delete_value(k mut Key, name string) Status {
    return C.RegDeleteValue(k, name.cstr()) 
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdeletevaluea
fn (k mut Key) delete_value(name string) Status {
    return delete_value(k, name)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regdisablereflectionkey
// Disables registry reflection for the specified key. 
// Disabling reflection for a key does not affect reflection of any subkeys.
fn disable_reflection_key(k Key) Status {
    if k != HKEY_CLASSES_ROOT && k != HKEY_CURRENT_USER
        && k != HKEY_LOCAL_MACHINE && k != HKEY_USERS
        && k != HKEY_PERFORMANCE_DATA && k != HKEY_PERFORMANCE_TEXT
        && k != HKEY_PERFORMANCE_NLSTEXT {
        return error('Invalid provided base branch.')
    }
    return C.RegDisableReflectionKey(k)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regenablereflectionkey
// Restores registry reflection for the specified disabled key. 
// Restoring reflection for a key does not affect reflection of any subkeys.
fn enable_reflection_key(k Key) Status {
    if k != HKEY_CLASSES_ROOT && k != HKEY_CURRENT_USER
        && k != HKEY_LOCAL_MACHINE && k != HKEY_USERS
        && k != HKEY_PERFORMANCE_DATA && k != HKEY_PERFORMANCE_TEXT
        && k != HKEY_PERFORMANCE_NLSTEXT {
        return error('Invalid provided base branch.')
    }
    return C.RegEnableReflectionKey(k)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regflushkey
// flush_key writes all the attributes of the specified open registry key into the registry.
fn flush_key(k mut Key) Status {
    if k != HKEY_MAKE {
        return C.RegFlushKey(k)
    }
}

// // Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regflushkey
fn (k mut Key) flush() Status {
    return flush_key(k)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-reggetvaluea#parameters
const (
    RRF_RT_ANY             =  u32( 0x0000ffff ) // No type restriction.
    RRF_RT_DWORD           =  u32( 0x00000018 ) // Restrict type to 32-bit RRF_RT_REG_BINARY | RRF_RT_REG_DWORD.
    RRF_RT_QWORD           =  u32( 0x00000048 ) // Restrict type to 64-bit RRF_RT_REG_BINARY | RRF_RT_REG_DWORD.
    RRF_RT_REG_BINARY      =  u32( 0x00000008 ) // Restrict type to REG_BINARY.
    RRF_RT_REG_DWORD       =  u32( 0x00000010 ) // Restrict type to REG_DWORD.
    RRF_RT_REG_EXPAND_SZ   =  u32( 0x00000004 ) // Restrict type to REG_EXPAND_SZ.
    RRF_RT_REG_MULTI_SZ    =  u32( 0x00000020 ) // Restrict type to REG_MULTI_SZ.
    RRF_RT_REG_NONE        =  u32( 0x00000001 ) // Restrict type to REG_NONE.
    RRF_RT_REG_QWORD       =  u32( 0x00000040 ) // Restrict type to REG_QWORD.
    RRF_RT_REG_SZ          =  u32( 0x00000002 ) // Restrict type to REG_SZ.
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-reggetvaluea#parameters
const (
    // Do not automatically expand environment strings if the value is of type REG_EXPAND_SZ.
    RRF_NOEXPAND           =  u32( 0x10000000 )

    // If pvData is not NULL, set the contents of the buffer to zeroes on failure.
    RRF_ZEROONFAILURE      =  u32( 0x20000000 )

    // If lpSubKey is not NULL, open the subkey that lpSubKey specifies with the 
    // KEY_WOW64_64KEY access rights. For information about these access rights, 
    // see Registry Key Security and Access Rights.
    // You cannot specify RRF_SUBKEY_WOW6464KEY in combination with RRF_SUBKEY_WOW6432KEY.
    RRF_SUBKEY_WOW6464KEY  =  u32( 0x00010000 )

    // If lpSubKey is not NULL, open the subkey that lpSubKey specifies with the 
    // KEY_WOW64_32KEY access rights. For information about these access rights, 
    // see Registry Key Security and Access Rights.
    // You cannot specify RRF_SUBKEY_WOW6432KEY in combination with RRF_SUBKEY_WOW6464KEY.
    RRF_SUBKEY_WOW6432KEY  =  u32( 0x00020000 )
)

struct ValueData {
pub mut:
    ptype   u32     // Key type
    data    voidptr // Key data
    pcbdata voidptr // Length of key data
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-reggetvaluea
// get_key_value retrieves the type and data for the specified registry value.
fn get_key_value(k mut Key, path string, value string) ?/***/ValueData {
    mut _rvkdata = ValueData{
        ptype:   0xffffffff // invalid for all
        data:    voidptr(0xffffffff)
        pcbdata: voidptr(0xffffffff)
    }
    status := C.RegGetValue(k, 
        path.cstr(), value.cstr(), RRF_RT_ANY, &_rvkdata.ptype, &_rvkdata.data, &_rvkdata.pcbdata)
    if status != ERROR_SUCCESS {
        return error('Cannot get value from selected key.')
    }
    return _rvkdata // &_rvkdata
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regloadkeya
// load_key creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE 
// and loads the data from the specified registry hive into that subkey.
// Applications that back up or restore system state including system files 
// and registry hives should use the Volume Shadow Copy Service instead of the registry functions.
fn load_key(k mut Key, path string, file_path string) Status {
    return C.RegLoadKey(k, path.cstr(), file_path.cstr())
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regopenkeyexa
// open_key opens the specified registry key. 
// Note that key names are not case sensitive.
fn open_key(k mut Key, path string, access u32) ?Key {
    mut _p_hkey := Key(HKEY_MAKE)
    status := C.RegOpenKeyEx(k, path.cstr(), 0, access, &_p_hkey)
    if status != ERROR_SUCCESS {
        return error('Cannot open registry key.')
    }
    return _p_hkey
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regqueryvalueexw
// query_value retrieves the type and data for the specified value name associated with an open registry key.
fn (k mut Key) query_value(v string) Status { return 0} // not implemented

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regrestorekeya
const (
    // If specified, the restore operation is executed even 
    // if open handles exist at or beneath the location in the registry hierarchy 
    // to which the hKey parameter points.
    REG_FORCE_RESTORE        =  u32( 0x00000008 ) 

    // If specified, a new, volatile (memory only) set of registry information, or hive, is created. 
    // If REG_WHOLE_HIVE_VOLATILE is specified,
    //  the key identified by the hKey parameter must be 
    // either the HKEY_USERS or HKEY_LOCAL_MACHINE value.
    REG_WHOLE_HIVE_VOLATILE  =  u32( 0x00000001 ) 
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regrestorekeya
// restore reads the registry information in a specified file and copies it over the specified key. 
// This registry information may be in the form of a key and multiple levels of subkeys.
fn restore_key(k mut Key, file_path string) Status {
    return C.RegRestoreKey(k, file_path.cstr(), REG_FORCE_RESTORE)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regsavekeyexa#parameters
const (
    // The key or hive is saved in standard format. 
    // The standard format is the only format supported by Windows 2000.
    REG_STANDARD_FORMAT = u32( 0x00000001 ) 

    // The key or hive is saved in the latest format. 
    // The latest format is supported starting with Windows XP. 
    // After the key or hive is saved in this format, it cannot be loaded on an earlier system.
    REG_LATEST_FORMAT   = u32( 0x00000002 )

    // The hive is saved with no compression, for faster save operations. 
    // The hKey parameter must specify the root of a hive under 
    // HKEY_LOCAL_MACHINE or HKEY_USERS. For example, HKLM\SOFTWARE is the root of a hive.
    REG_NO_COMPRESSION  = u32( 0x00000004 )
)

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regsavekeyexa#parameters
// save saves the specified key and all of its subkeys and values to a registry file, in the specified format.
fn save_key(k mut Key, file_path string, flags u32) Status {
    return C.RegSaveKeyEx(k, file_path.cstr(), 0, flags)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regsetkeyvaluea
// set_key_value sets the data and type of a specified value under a registry key.
fn set_key_value(k mut Key, name string, ktype u32, data voidptr, size i64) Status {
    if ktype != REG_SZ && ktype != REG_EXPAND_SZ
        && ktype != REG_BINARY && ktype != REG_DWORD
        && ktype != REG_DWORD_LITTLE_ENDIAN && ktype != REG_DWORD_BIG_ENDIAN
        && ktype != REG_LINK && ktype != REG_MULTI_SZ 
        && ktype != REG_RESOURCE_LIST && ktype != REG_FULL_RESOURCE_DESCRIPTOR
        && ktype != REG_RESOURCE_REQUIREMENTS_LIST 
        && ktype != REG_QWORD && ktype != REG_QWORD_LITTLE_ENDIAN {
        return error('Undefined key type')
    }
    return C.RegSetValueEx(k, name.cstr(), 0, ktype, data, size)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regsetkeyvaluea
// set_key_value sets the data and type of a specified value under a registry key.
fn (k mut Key) set_value(name string, ktype u32, data voidptr, size i64) Status {
    return set_key_value(k, name, ktype, data, size)
}

// Ref - https://docs.microsoft.com/en-us/windows/win32/api/winreg/nf-winreg-regunloadkeya
// unload unloads the specified registry key and its subkeys from the registry.
fn unload_key(k Key, path string) Status {
    return C.RegUnLoadKey(k, path.cstr())
}