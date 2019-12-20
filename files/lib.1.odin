package sgl

destroy :: proc{
    delete_render_context,
    delete_buffer,
    delete_bitmap,
    delete_obj_model,
    delete_shader_program
};