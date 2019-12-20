foreign import winmm_lib "system:Winmm.lib"
using import "core:c.odin"
import "core:os.odin"

MAXPNAMELEN :: 32;

Smpte :: struct {
	hour, min, sec, frame, fps, dummy: byte,
	pad: [2]byte,
}

Midi :: struct {
	songptrpos: u32,
}

Time :: struct {
	// TODO(ReneHSZ): Fill this
}

Result :: enum u32 {
	// TODO(ReneHSZ): Fill this
}

@(default_calling_convention="std")
foreign winmm_lib {
	@(link_name="PlaySound")    play_sound     :: proc(pszSound: ^u16, hmod: os.Handle, fdwSound: u32) -> b32 ---;
	@(link_name="sndPlaySound") snd_play_sound :: proc(lpszSound: ^u16, fuSound: c_uint) -> b32 ---;
}
