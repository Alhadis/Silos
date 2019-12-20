/*
 *  @Name:     engine
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 04-05-2017 15:13:05
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 04-02-2018 22:18:53 UTC+1
 *  
 *  @Description:
 *      Contains the engine context.
 */
import "core:math.odin";
import "input.odin";
import "time.odin";
import "renderer.odin";
import imgui "shared:libbrew/brew_imgui.odin";

Context :: struct {
    settings             : ^Setting,
    input                : ^input.Input,
    imgui_state          : ^imgui.State,
    time                 : ^time.Data,

    adaptive_vsync       : bool,
    scale_factor         : math.Vec2,
    window_size          : math.Vec2,
}

Setting :: struct {
    show_cursor         : bool,
    show_debug_menu      : bool,
    program_running     : bool,
}

create_context :: proc() -> ^Context {
    ctx               := new(Context);
    ctx.input          = new(input.Input);
    ctx.settings       = new(Setting);
    ctx.imgui_state    = new(imgui.State);
    ctx.time           = time.create_data();

    return ctx;
}

create_default_context :: proc() -> ^Context {
    ctx := create_context();

    ctx.adaptive_vsync = true;
    ctx.settings.program_running = true;
    ctx.settings.show_debug_menu = true;
    ctx.settings.show_cursor = true;

    return ctx;
}