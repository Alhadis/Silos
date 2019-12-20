foreign import winmm_lib "system:Winmm.lib"
using import "core:c.odin"
using import "winmm.odin"
import "core:os.odin"

Hdr :: struct {
	lpData:          ^byte,
	dwBufferLength,
	dwBytesRecorded: u32,
	dwUser:          ^u32,
	dwFlags:         u32,  // TODO(ReneHSZ): Make an enum for those flags rather than just u32
	dwLoops:         u32,
	lpNext:          ^Hdr,
	reserved:        ^u32,
}

InCaps :: struct {
	wMid, wPid:            u32,
	vDriverVersion:        c_uint,
	szPname:               [MAXPNAMELEN]byte,
	dwFormats:             u32,
	wChannels, wReserved1: u32,
}

OutCaps :: struct {
	wMid, wPid:     u32,
	vDriverVersion: c_uint,
	szPname:        [MAXPNAMELEN]byte,
	dwFormats:      u32,
	wChannels:      u16,
	wReserved1:     u16,
	dwSupport:      u32,
}

FormatEx :: struct {
	wFormatTag, nChannels: u16,
	nSamplesPerSec:        u32,
	nAvgBytesPerSec:       u32,
	nBlockAlign:           u16,
	wBitsPerSample:        u16,
	cbSize:                u16,
}

@(default_calling_convention="std")
foreign winmm_lib {
	@(link_name="waveInAddBuffer")        in_add_buffer         :: proc(hwi: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
	@(link_name="waveInClose")            in_close              :: proc(hwi: os.Handle) -> Result ---;
	@(link_name="waveInGetDevCaps")       in_get_dev_caps       :: proc(uDeviceID: c_uintptr_t, pwic: ^InCaps, cbwic: c_uint) -> Result ---;
	@(link_name="waveInGetErrorText")     in_get_error_text     :: proc(mmrError: c_int, pszText: ^byte, cchText: c_uint) -> Result ---;
	@(link_name="waveInGetID")            in_get_id             :: proc(hwi: os.Handle, puDeviceID: ^c_uint) -> Result ---;
	@(link_name="waveInGetNumDevs")       in_get_num_devs       :: proc() -> c_uint ---;
	@(link_name="waveInGetPosition")      in_get_position       :: proc(hwi: os.Handle, pmmt: ^Time, cbmmt: c_uint) -> Result ---;
	@(link_name="waveInMessage")          in_message            :: proc(deviceID: os.Handle, uMsg: c_uint, dwParam1, dwParam2: ^u32) -> u32 ---;
	@(link_name="waveInOpen")             in_open               :: proc(phwi: ^os.Handle, uDeviceID: c_uint, pwfx: ^FormatEx, dwCallback, dwCallbackInstance: ^u32, fdwOpen: u32) -> Result ---;
	@(link_name="waveInPrepareHeader")    in_prepare_header     :: proc(hwi: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
	@(link_name="waveInProc")             in_proc               :: proc(hwi: os.Handle, uMsg: c_uint, dwInstance, dwParam1, dwParam2: ^u32) ---;
	@(link_name="waveInReset")            in_reset              :: proc(hwi: os.Handle) -> Result ---;
	@(link_name="waveInStart")            in_start              :: proc(hwi: os.Handle) -> Result ---;
	@(link_name="waveInStop")             in_stop               :: proc(hwi: os.Handle) -> Result ---;
	@(link_name="waveInUnprepareHeader")  in_unprepare_header   :: proc(hwi: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
	@(link_name="waveOutBreakLoop")       out_break_loop        :: proc(hwo: os.Handle) -> Result ---;
	@(link_name="waveOutClose")           out_close             :: proc(hwo: os.Handle) -> Result ---;
	@(link_name="waveOutGetDevCaps")      out_get_dev_caps      :: proc(uDeviceID: ^c_uint, pwoc: ^OutCaps, cbwoc: c_uint) -> Result ---;
	@(link_name="waveOutGetErrorText")    out_get_error_text    :: proc(mmrError: Result, pszText: ^u16, cchText: c_uint) -> Result ---;
	@(link_name="waveOutGetID")           out_get_id            :: proc(hwo: os.Handle, puDeviceID: ^c_uint) -> Result ---;
	@(link_name="waveOutGetNumDevs")      out_get_num_devs      :: proc() -> c_uint ---;
	@(link_name="waveOutGetPitch")        out_get_pitch         :: proc(hwo: os.Handle, pdwPitch: ^u32) -> Result ---;
	@(link_name="waveOutGetPlaybackRate") out_get_playback_rate :: proc(hwo: os.Handle, pdwRate: ^u32) -> Result ---;
	@(link_name="waveOutGetPosition")     out_get_position      :: proc(hwo: os.Handle, pmmt: ^Time, cbmmt: c_uint) -> Result ---;
	@(link_name="waveOutGetVolume")       out_get_volume        :: proc(hwo: os.Handle, pdwVolume: ^u32) -> Result ---;
	@(link_name="waveOutMessage")         out_message           :: proc(deviceID: os.Handle, uMsg: c_uint, dwParam1, dwParam2: ^u32) -> u32 ---;
	@(link_name="waveOutOpen")            out_open              :: proc(phwo: ^os.Handle, uDeviceID: ^c_uint, pwfx: ^FormatEx, dwCallback, dwCallbackInstance: ^u32, fdwOpen: u32) -> Result ---;
	@(link_name="waveOutPause")           out_pause             :: proc(hwo: os.Handle) -> Result ---;
	@(link_name="waveOutPrepareHeader")   out_prepare_header    :: proc(hwo: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
	@(link_name="waveOutProc")            out_proc              :: proc(hwo: os.Handle, uMsg: c_uint, dwInstance, dwParam1, dwParam2: ^u32) ---;
	@(link_name="waveOutReset")           out_reset             :: proc(hwo: os.Handle) -> Result ---;
	@(link_name="waveOutRestart")         out_restart           :: proc(hwo: os.Handle) -> Result ---;
	@(link_name="waveOutSetPitch")        out_set_pitch         :: proc(hwo: os.Handle, dwPitch: u32) -> Result ---;
	@(link_name="waveOutSetPlaybackRate") out_set_playback_rate :: proc(hwo: os.Handle, dwRate: u32) -> Result ---;
	@(link_name="waveOutSetVolume")       out_set_volume        :: proc(hwo: os.Handle, dwVolume: u32) -> Result ---;
	@(link_name="waveOutUnprepareHeader") out_unprepare_header  :: proc(hwo: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
	@(link_name="waveOutWrite")           out_write             :: proc(hwo: os.Handle, pwh: ^Hdr, cbwh: c_uint) -> Result ---;
}
