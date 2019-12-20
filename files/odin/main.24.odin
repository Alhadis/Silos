package main

import "core:fmt"
import "core:os"
import "core:mem"

foreign import libwebpdemux "libwebpdemux_debug_dll.lib"

INPUT_FILE :: "dancer.webp";

CSPMode :: enum i32 {
    MODE_RGB = 0,
    MODE_RGBA = 1,
    MODE_BGR = 2,
    MODE_BGRA = 3,
    MODE_ARGB = 4,
    MODE_RGBA_4444 = 5,
    MODE_RGB_565 = 6,
    MODE_rgbA = 7,
    MODE_bgrA = 8,
    MODE_Argb = 9,
    MODE_rgbA_4444 = 10,
    MODE_YUV = 11,
    MODE_YUVA = 12,
    MODE_LAST = 13,
}

AnimDecoderOptions :: struct #packed {
    color_mode: CSPMode,
    use_threads: int,
    pad: [7]u32,
}

WebPData :: struct #packed {
    data: uintptr,
    size: uintptr,
}

AnimInfo :: struct #packed {
    canvas_width: u32,
    canvas_height: u32,
    loop_count: u32,
    bgcolor: u32,
    frame_count: u32,
    pad: [4]u32,
}

WEBP_DECODER_ABI_VERSION:i32 : 0x0208;
WEBP_DEMUX_ABI_VERSION:i32 : 0x0107;

Decoder :: struct #packed {
}

@(default_calling_convention="c")
foreign libwebpdemux {
    @(link_name="WebPAnimDecoderOptionsInitInternal")
    anim_decoder_options_init :: proc(options: ^AnimDecoderOptions, abi_version: i32) -> i32 ---;

    @(link_name="WebPAnimDecoderNewInternal")
    anim_decoder_new_internal :: proc(webp_data: ^WebPData, options: ^AnimDecoderOptions, abi_version: i32) -> ^Decoder ---;

    @(link_name="WebPAnimDecoderGetInfo")
    anim_decoder_get_info :: proc(decoder: ^Decoder, info: ^AnimInfo) -> i32 ---;

    @(link_name="WebPAnimDecoderHasMoreFrames")
    anim_decoder_has_more_frames :: proc(decoder: ^Decoder) -> i32 ---;

    @(link_name="WebPAnimDecoderGetNext")
    anim_decoder_get_next :: proc(decoder: ^Decoder, buf: ^^u8, timestamp: ^i32) -> i32 ---;

    @(link_name="WebPAnimDecoderDelete")
    anim_decoder_delete :: proc(decoder: ^Decoder) ---;
}

main :: proc() {
    options: AnimDecoderOptions;
    if 0 == anim_decoder_options_init(&options, WEBP_DEMUX_ABI_VERSION) {
        fmt.println_err("error inititalizing config");
        return;
    }

    bytes, ok := os.read_entire_file(INPUT_FILE);
    if !ok {
        fmt.println_err("error reading file");
        return;
    }

    webp_data := WebPData { cast(uintptr)&bytes[0], cast(uintptr)len(bytes) };

    decoder := anim_decoder_new_internal(&webp_data, &options, WEBP_DEMUX_ABI_VERSION);
    if decoder == nil {
        fmt.println_err("got a null decoder");
        return;
    }

    defer anim_decoder_delete(decoder);

    info: AnimInfo;
    if 1 != anim_decoder_get_info(decoder, &info) {
        fmt.println_err("get_info returned an error");
        return;
    }

    fmt.println(info);

    frame_number := 0;

    for anim_decoder_has_more_frames(decoder) != 0 {
        buf : ^u8;
        timestamp :i32 = -1;
        if 0 == anim_decoder_get_next(decoder, &buf, &timestamp) {
            fmt.println_err("parsing or decoding error or no more frames");
            return;
        }
        if buf == nil {
            fmt.println_err("get_next assigned a null image buffer pointer");
            return;
        }

        buf_size_in_bytes := 4 * info.canvas_width * info.canvas_height;
        slice := mem.slice_ptr(buf, cast(int)buf_size_in_bytes);

        frame_number += 1;
        os.write_entire_file(fmt.tprintf("output%d.raw", frame_number), slice);

        fmt.println("parsed frame with timestamp", timestamp);
    }

}
