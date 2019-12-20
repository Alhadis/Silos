package main

using import "core:fmt"
      import "core:os"
      import "core:mem"
      import rt "core:runtime"
      import "core:strings"

      import wb "shared:workbench"
using import "shared:workbench/math"
      import "shared:workbench/wbml"
      import "shared:workbench/laas"
      import "shared:workbench/platform"
      import "shared:workbench/reflection"
      import "shared:workbench/external/imgui"
using import "shared:workbench/basic"
using import "shared:workbench/logging"
using import "shared:workbench/types"

EntityID :: int;
Entity :: struct {
    enabled: bool,
    name: string,
    id: int "imgui_readonly",
    marked_for_destruction: bool "wbml_noserialize,imgui_hidden",
    serialized_file_on_disk: string "wbml_noserialize,imgui_readonly",
    scene: ^Scene "wbml_noserialize,imgui_hidden",

    position: Vec3,
    scale: Vec3,
    rotation: Quat,
    model_info: Maybe(Model_Info),
    derived: union {
        Tile_Entity,
        Light,
        Box,
        Clouds,
    },
}

Entity_Base :: struct {
    id: int "imgui_readonly",
}

Model_Info :: struct {
    model_id: string,
    shader_id: string,
    texture_id: string,
    material: wb.Material,
    offset: Vec3,
    scale: Vec3,
}

Scene :: struct {
    scene_name: string,
    all_entities: [dynamic]Entity,
    new_entities: [dynamic]Entity,
    entity_files_to_destroy_on_save: [dynamic]string,
    entity_storage_by_type: map[typeid][dynamic]rawptr,
}

Scene_Mode :: enum {
    Edit,
    Play,
}

scene_mode: Scene_Mode;
do_draw_entity_window: bool;

active_scene: ^Scene;
entity_typename_to_ti: map[string]^rt.Type_Info;

selected_entity_index: i32 = -1;
selected_entity: ^Entity;

entity_init :: proc() {
    for variant in all_entity_variants() {
        name := aprint(variant);
        entity_typename_to_ti[name] = variant;
    }
}

all_entity_variants :: proc() -> []^rt.Type_Info {
    e: Entity;
    return type_info_of(type_of(e.derived)).variant.(rt.Type_Info_Union).variants;
}

entity_update :: proc(dt: f32) {
    if platform.get_input_down(.F2) {
        #complete switch scene_mode {
            case .Play: switch_to_edit_mode();
            case .Edit: switch_to_play_mode();
            case: panic(tprint(scene_mode));
        }
        do_draw_entity_window = !do_draw_entity_window;
    }



    #complete switch scene_mode {
        case .Edit: {
            if platform.get_input(.Left_Control) {
                if platform.get_input_down(.D) && selected_entity != nil {
                    duplicate_entity(selected_entity);
                }
                if platform.get_input_down(.S) {
                    save_scene(active_scene.scene_name);
                }
            }
            else {
                wb.do_camera_movement(&wb.wb_camera, dt, game_config.camera_freecam_speed, game_config.camera_freecam_speed_fast, game_config.camera_freecam_speed_slow);
            }

            draw_entity_window();
        }

        case .Play: {

        }

        case: panic(tprint(scene_mode));
    }

    if selected_entity_index >= 0 {
        selected_entity = &active_scene.all_entities[selected_entity_index];
    }
    else {
        selected_entity = nil;
    }

    // destroy entities
    {
        for idx := len(active_scene.all_entities)-1; idx >= 0; idx -= 1 {
            e := &active_scene.all_entities[idx];
            if e.marked_for_destruction {
                unordered_remove(&active_scene.all_entities, idx);
            }
        }
    }

    // flush new entities into all_entities
    {
        for e in active_scene.new_entities {
            append(&active_scene.all_entities, e);
        }
        clear(&active_scene.new_entities);
    }

    // length check
    len_at_start_of_frame := len(active_scene.all_entities);
    defer {
        len_at_end_of_frame := len(active_scene.all_entities);
        assert(len_at_start_of_frame == len_at_end_of_frame, "all_entities array changed during frame. This shouldn't ever happen.");
    }

    // setup entity_storage_by_type
    {
        for tid, array in active_scene.entity_storage_by_type {
            array := array;
            clear(&array);
            active_scene.entity_storage_by_type[tid] = array;
        }

        for _, idx in active_scene.all_entities {
            e := &active_scene.all_entities[idx];
            if !e.enabled do continue;
            assert(e.id != 0);
            eti := reflection.get_union_type_info(e.derived);
            if eti != nil {
                array, ok := active_scene.entity_storage_by_type[eti.id];
                assert(ok);
                append(&array, &e.derived);
                active_scene.entity_storage_by_type[eti.id] = array;
            }
        }
    }

    if selected_entity != nil {
        wb.gizmo_manipulate(&selected_entity.position, &selected_entity.scale, &selected_entity.rotation);
    }
}

switch_to_edit_mode :: proc() {
    scene_mode = .Edit;

    current_scene := aprint(active_scene.scene_name); // @Leak
    unload_scene();
    load_scene(current_scene);
}
switch_to_play_mode :: proc() {
    scene_mode = .Play;
    
}

entity_render :: proc() {

}

entity_post_render :: proc() {
    if selected_entity != nil {
        wb.gizmo_render(selected_entity.position, selected_entity.scale, selected_entity.rotation);
    }
}

make_entity :: proc{make_entity_none, make_entity_typed};

make_entity_none :: proc(name: string) -> ^Entity {
    assert(active_scene != nil);

    @static last_entity_id: int;
    last_entity_id += 1;

    e: Entity;
    e.id = last_entity_id;
    e.name = name;
    e.scale = {1, 1, 1};
    e.rotation = {0, 0, 0, 1};
    e.scene = active_scene;
    append(&active_scene.new_entities, e);
    return &active_scene.new_entities[len(active_scene.new_entities)-1];
}

make_entity_typed :: proc(name: string, $T: typeid) -> ^T {
    assert(active_scene != nil);

    e := make_entity_none(name);
    t := new(T);
    e.derived = any{t, typeid_of(T)};
    t.id = e.id;
    storage_raw, ok := active_scene.entity_storages[typeid_of(T)];
    assert(ok);
    storage := transmute(^[dynamic]^T)storage_raw;
    append(storage, t);
    return t;
}

make_entity_ti :: proc(name: string, ti: ^rt.Type_Info) -> ^Entity {
    assert(active_scene != nil);

    e := make_entity_none(name);
    set_entity_derived_ti(e, ti);

    return e;
}

destroy_entity :: proc(e: ^Entity) {
    e.marked_for_destruction = true;
    if e.serialized_file_on_disk != "" {
        append(&active_scene.entity_files_to_destroy_on_save, e.serialized_file_on_disk);
    }
}

ti_struct :: proc(ti: ^rt.Type_Info) -> ^rt.Type_Info_Struct {
    switch kind in ti.variant {
        case rt.Type_Info_Named: return ti_struct(kind.base);
    }
    return &ti.variant.(rt.Type_Info_Struct);
}

set_entity_derived_ti :: proc(e: ^Entity, ti: ^rt.Type_Info, can_stomp_existing := false) {
    if !can_stomp_existing {
        assert(reflection.get_union_type_info(e.derived) == nil);
    }

    assert(ti.id in active_scene.entity_storage_by_type, tprint("Unknown entity type: ", ti));
    reflection.set_union_type_info(e.derived, ti);
    update_entity_derived_base_id(e);
}

update_entity_derived_base_id :: proc(e: ^Entity) {
    assert(e.derived != nil);
    ti := reflection.get_union_type_info(e.derived);
    struct_ti := ti_struct(ti);
    assert(struct_ti.names[0] == "base");
    assert(struct_ti.types[0] == type_info_of(Entity_Base));
    assert(e.id != 0);
    (cast(^Entity_Base)&e.derived)^ = {e.id};
}

base_type_info :: proc(ti: ^rt.Type_Info) -> ^rt.Type_Info {
    switch variant in ti.variant {
        case rt.Type_Info_Named: {
            return base_type_info(variant.base);
        }
    }
    return ti;
}

entity_base :: proc(kind: $T, loc := #caller_location) -> ^Entity {
    assert(kind.base.id != 0, tprint(loc));
    for _, idx in active_scene.all_entities {
        e := &active_scene.all_entities[idx];
        if e.id == kind.base.id do return e;
    }
    assert(false, tprint(kind, "    ", loc));
    return nil;
}

draw_entity_window :: proc() {
    if imgui.begin("Scene") {
        imgui.label_text("Scene name", active_scene.scene_name);

        // save/load panel
        {
            do_input_text :: proc(buf: []byte) -> string {
                imgui.input_text("", buf);
                buf[len(buf)-1] = 0;
                text := cast(string)cast(cstring)&buf[0];
                return text;
            }

            @static save_scene_name_buffer: [64]byte;
            @static load_scene_buffer: [64]byte;
            @static do_load_after_save := false;
            @static do_new_after_save := false;

            if imgui.button("Save") {
                imgui.open_popup("Save scene");
            }
            imgui.same_line();
            if imgui.button("Load") {
                do_load_after_save = true;
                imgui.open_popup("Save scene");
                save_scene_name_buffer = {};
            }
            imgui.same_line();
            if imgui.button("New") {
                do_new_after_save = true;
                imgui.open_popup("Save scene");
                save_scene_name_buffer = {};
            }

            save_answered := false;
            if imgui.begin_popup("Save scene") {
                defer imgui.end_popup();

                save_scene_name: string;
                if active_scene.scene_name == "" {
                    save_scene_name = do_input_text(save_scene_name_buffer[:]);
                }
                else {
                    save_scene_name = active_scene.scene_name;
                }

                imgui.text(tprint("Save current scene '", save_scene_name, "'?"));
                if imgui.button("Yes") {
                    if save_scene_name == "" {
                        logln("Please enter a name to save the scene as.");
                    }
                    else {
                        save_scene(save_scene_name);
                        imgui.close_current_popup();
                        save_answered = true;
                    }
                }
                imgui.same_line();
                if imgui.button("No") {
                    imgui.close_current_popup();
                    save_answered = true;
                }
            }

            if save_answered {
                if do_load_after_save {
                    do_load_after_save = false;
                    load_scene_buffer = {};
                    imgui.open_popup("Load scene");
                }
                else if do_new_after_save {
                    do_new_after_save = false;
                    unload_scene();
                    load_empty_scene("New Scene");
                }
            }

            if imgui.begin_popup("Load scene") {
                defer imgui.end_popup();

                load_scene_name := do_input_text(load_scene_buffer[:]);
                if imgui.button("Load!") {
                    if load_scene_name == "" {
                        logln("Please enter a scene name to load.");
                    }
                    else {
                        unload_scene();
                        load_scene(load_scene_name);
                        imgui.close_current_popup();
                    }
                }
            }
        }

        if active_scene != nil {
            if imgui.button("Create Entity") {
                make_entity("New Entity");
            }

            // todo(josh): clean up all these allocations. I was trying to use the frame_allocator but it wasn't working.
            // todo(josh): clean up all these allocations. I was trying to use the frame_allocator but it wasn't working.
            // todo(josh): clean up all these allocations. I was trying to use the frame_allocator but it wasn't working.
            // todo(josh): clean up all these allocations. I was trying to use the frame_allocator but it wasn't working.
            entity_names: [dynamic]^u8;
            defer {
                for n in entity_names do free(n);
                delete(entity_names);
            }
            for _, idx in active_scene.all_entities {
                e := &active_scene.all_entities[idx];
                str := strings.clone_to_cstring(e.name);
                append(&entity_names, cast(^u8)str);
            }

            if len(entity_names) > 0 {
                imgui.list_box("Entities", &selected_entity_index, &entity_names[0], cast(i32)len(entity_names), 30);
                if cast(int)selected_entity_index > len(active_scene.all_entities) {
                    selected_entity_index = -1;
                }
            }

            entity: ^Entity;
            if selected_entity_index >= 0 && cast(int)selected_entity_index < len(active_scene.all_entities) {
                entity = &active_scene.all_entities[selected_entity_index];
            }
            else {
                selected_entity_index = -1;
            }

            if imgui.begin("Inspector") {
                if entity != nil {
                    entity_to_clone: ^Entity;

                    imgui.push_id(tprint(entity.name," - ", entity.id)); defer imgui.pop_id();

                    if imgui.button("Clone") {
                        entity_to_clone = entity;
                    }

                    imgui.same_line();
                    if imgui.button("Destroy") {
                        destroy_entity(entity);
                    }

                    wb.imgui_struct(entity, "", false);
                    if entity.derived != nil {
                        // todo(josh): why is this here? entities should already have their IDs set up at all times
                        update_entity_derived_base_id(entity);
                    }

                    @static entity_type_name_buffer: [64]byte;
                    just_opened := false;

                    if imgui.button("Clear derived") do entity.derived = {};
                    // imgui.same_line();
                    // if imgui.button("Change type") {
                    //     entity_type_name_buffer = {};
                    //     imgui.open_popup("Change type");
                    //     just_opened = true;
                    // }

                    // if imgui.begin_popup("Change type") {
                    //     if just_opened do imgui.set_keyboard_focus_here(0);
                    //     imgui.input_text("Type Name", entity_type_name_buffer[:]);

                    //     input := cast(string)cast(cstring)&entity_type_name_buffer[0];
                    //     input_lower := APRINT(string_to_lower(input));
                    //     for name, ti in entity_typename_to_ti {
                    //         name_lower := string_to_lower(name);
                    //         if len(input_lower) > 0 && string_starts_with(name_lower, input_lower) {
                    //             if imgui.button(name) {
                    //                 set_entity_derived_ti(entity, ti, true);
                    //                 imgui.close_current_popup();
                    //             }
                    //         }
                    //     }
                    //     imgui.end_popup();
                    // }

                    if entity_to_clone != nil {
                        duplicate_entity(entity_to_clone);
                    }
                }
            }
            imgui.end();
        }
    }
    imgui.end();
}

duplicate_entity :: proc(entity: ^Entity) {
    new_entity := make_entity("Clone"); // todo(josh): better clone name
    new_entity_id := new_entity.id;
    new_entity^ = entity^;
    new_entity.id = new_entity_id;
    new_entity.serialized_file_on_disk = "";
    if new_entity.derived != nil {
        update_entity_derived_base_id(new_entity);
    }

    // todo(josh): select the new entity in the inspector
}








//
// Scenes
//

load_scene :: proc(scene_name: string) {
    assert(active_scene == nil);
    load_empty_scene(scene_name);

    scene_path := tprint_scene_path(scene_name);
    filepaths := get_all_filepaths_recursively(scene_path);
    // todo(josh): @Leak filepaths
    // note(josh): contents of filepaths get given to entities

    for filepath in filepaths {
        if !string_ends_with(filepath, ".e") {
            logln("Warning: Non-entity file in scene folder: ", filepath);
        }
        else {
            entity_data, ok := os.read_entire_file(filepath);
            assert(ok);
            lexer := laas.make_lexer(cast(string)entity_data);

            entity_base_value_node := wbml.parse_value(&lexer);
            defer wbml.delete_node(entity_base_value_node);
            assert(entity_base_value_node != nil);

            e := make_entity("");
            wbml.write_value(entity_base_value_node, e, type_info_of(Entity));
            e.serialized_file_on_disk = filepath;
        }
    }
}

get_entity_storage :: proc($T: typeid) -> []^T {
    if active_scene == nil do return {};
    storage, ok := active_scene.entity_storage_by_type[typeid_of(T)];
    if !ok do return {};
    return transmute([]^T)storage[:];
}

load_empty_scene :: proc(name: string) {
    assert(active_scene == nil);
    active_scene = new(Scene);
    active_scene.scene_name = name;
    for v in all_entity_variants() {
        active_scene.entity_storage_by_type[v.id] = make([dynamic]rawptr, 0, 10);
    }
}

tprint_scene_path :: proc(name: string) -> string {
    return tprint("scenes/", name);
}

aprint_scene_path :: proc(name: string) -> string {
    return aprint("scenes/", name);
}

save_scene :: proc(save_name: string) {
    assert(active_scene != nil);
    if active_scene.scene_name != "" {
        assert(active_scene.scene_name == save_name);
    }
    else {
        active_scene.scene_name = strings.clone(save_name);
    }

    assert(active_scene.scene_name == save_name);
    scene_path := aprint_scene_path(save_name);
    defer delete(scene_path);
    _, err := os.last_write_time_by_name(scene_path);
    if err == os.ERROR_FILE_NOT_FOUND {
        ok := wb.create_directory(scene_path);
        assert(ok, tprint("Couldn't create directory ", scene_path));
    }

    // delete
    {
        for file in active_scene.entity_files_to_destroy_on_save {
            assert(file != "");
            ok := wb.delete_file(file);
            if ok {
                logln("Deleted entity file: ", file);
            }
            else {
                logln("Error: Couldn't find entity file: ", file);
            }
        }
        // todo(josh): I think we are @Leaking the file names. investigate
        clear(&active_scene.entity_files_to_destroy_on_save);
    }

    assert(scene_path != "");
    sb: strings.Builder;
    for _, idx in active_scene.all_entities {
        defer strings.reset_builder(&sb);

        entity := &active_scene.all_entities[idx];
        wbml.serialize_string_builder(entity, &sb);

        entity_file_name := tprint(scene_path, "/", entity.name, "-", entity.id, ".e");
        if entity.serialized_file_on_disk != "" {
            if entity_file_name != entity.serialized_file_on_disk {
                logln("Entity file changed from ", entity.serialized_file_on_disk, " to ", entity_file_name, " Deleting old one.");
                wb.delete_file(entity.serialized_file_on_disk);
                // todo(josh): @Leak data.serialized_file_on_disk
                entity.serialized_file_on_disk = aprint(entity_file_name); // todo(josh): @Leak figure out the lifetime of this allocation
            }
        }
        else {
            entity.serialized_file_on_disk = aprint(entity_file_name);
        }

        assert(entity.serialized_file_on_disk != "");
        wrote := os.write_entire_file(entity.serialized_file_on_disk, transmute([]u8)strings.to_string(sb));
        assert(wrote);
    }
}

unload_scene :: proc() {
    if active_scene == nil do return;

    // todo(josh): proper cleanup
    free(active_scene);
    active_scene = nil;
}



@private
@(deferred_out=delete_APRINT)
APRINT :: proc(args: ..any) -> string {
    return aprint(..args);
}

@private
delete_APRINT :: proc(str: string) {
    delete(str);
}
