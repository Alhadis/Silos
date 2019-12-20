foreign import winmm_lib "system:Winmm.lib"
using import "core:c.odin"
using import "winmm.odin"

Caps :: struct {
	wMid, wPid:              u16,
	vDriverVersion:          c_uint,
	szPname:                 [MAXPNAMELEN]byte,
	wTechnology, wReserved1: u16,
	dwSupport:               u32,
}

@(default_calling_convention="std")
foreign winmm_lib {
	@(link_name="auxGetDevCaps") get_dev_caps :: proc(uDeviceID: c_uintptr_t, lpCaps: ^Caps, cbCaps: c_uint) ---;
	@(link_name="auxGetNumDevs") get_num_devs :: proc() -> c_uint ---;
	@(link_name="auxGetVolume")  get_volume   :: proc(uDeviceID: c_uint, lpdwVolume: ^u32) -> c_uint ---;
	@(link_name="auxOutMessage") out_message  :: proc(uDeviceID, uMsg: c_uint, dwParam1, dwParam2: ^u32) -> u32 ---;
	@(link_name="auxSetVolume")  set_volume   :: proc(uDeviceID: c_uint, dwVolume: u32) -> c_uint ---;
}
