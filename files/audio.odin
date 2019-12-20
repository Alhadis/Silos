package audio

import "core:strings"

import "shared:odin-al/al"
import "shared:odin-al/alc"

import "core:os"

//Link with dr_wav
when os.OS == "windows" {
	foreign import "dr_wav.lib";
} else when os.OS == "linux" {
	foreign import "system:dr_wav";
} else {
	#assert(false);
}

foreign dr_wav {
    drwav_open_and_read_file_s16 :: proc"c"(filename: cstring, channels: ^u32, sampleRate: ^u32, totalSampleCount: ^u64) -> ^i16 ---;
    drwav_free :: proc"c"(pDataReturnedByOpenAndRead: ^u8) ---;
}

audio :: struct {
	device: alc.Device,
	cont: alc.Context,
}

init :: proc() -> audio {
	result: audio;
	result.device = alc.open_device(nil);

	result.cont = alc.create_context(result.device, nil);
	alc.make_context_current(result.cont);

	return result;
}

load_sound :: proc(file: string) -> i32 {
	return 0;
}