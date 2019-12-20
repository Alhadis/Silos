package sample

import "core:fmt"
import "core:sys/win32"

import gfx "../odin-libs/gfx"
import d3d "../odin-libs/d3d"

vertShaderSrc := 
`
struct vs_in {
    float4 pos: POS;
    float4 color: COLOR;
};
struct vs_out {
    float4 color: COLOR0;
    float4 pos: SV_Position;
};
vs_out main(vs_in input) {
    vs_out output;
    output.pos = input.pos;
    output.color = input.color;
    return output;
}
`;

fragShaderSrc :=
`
float4 main(float4 color: COLOR0): SV_Target0 {
    return color;
}
`;

main :: proc() {
    d3d11_init(1600, 900, 1);
    defer d3d11_shutdown();

    setup_desc := gfx.Setup_Desc {
        backend = gfx.D3D11_Backend {
            dev = get_d3d11_device(),
            dev_ctx = get_d3d11_device_context(),
            get_rtv_cb = get_d3d11_render_target_view,
            get_dsv_cb = get_d3d11_depth_stencil_view,
        },
    };

    using gfx;
    gfx_setup(&setup_desc);
    vertices := []f32 {
         0.0, 0.5, 0.5,      1.0, 0.0, 0.0, 1.0,
         0.5, -0.5, 0.5,     0.0, 1.0, 0.0, 1.0,
        -0.5, -0.5, 0.5,     0.0, 0.0, 1.0, 1.0
    };

    buf_desc := Buffer_Desc {
        size = len(vertices) * size_of(vertices[0]),
        content = &vertices[0],
    };

    vb_hndl := gfx_make_buffer(&buf_desc);
    bind: Bindings;
    bind.vertex_buffer_handles[0] = vb_hndl;

    sh_desc := Shader_Desc {
        vert_shader = {
            src_text = vertShaderSrc,
        },
        frag_shader = {
            src_text = fragShaderSrc,
        },
    };
    sh_hndl := gfx_make_shader(&sh_desc);

    pipe_desc: Pipeline_Desc;
    pipe_desc.layout.attrs[0] = { semantic_name = "POS", format = VertexFormat.FLOAT3 };
    pipe_desc.layout.attrs[1] = { semantic_name = "COLOR", format = VertexFormat.FLOAT4 };
    pipe_desc.shader_handle = sh_hndl;
    pipe := gfx_make_pipeline(&pipe_desc);

    pass_action: Pass_Action;
    pass_action.colors[0] = {
        action_type = ActionType.CLEAR,
        value = { 0.2, 0.2, 0.2, 1.0 },
    };

    using win32;
    msg: Msg;
    for msg.message != WM_QUIT {
        if peek_message_a(&msg, nil, 0, 0, PM_REMOVE) {
            translate_message(&msg);
            dispatch_message_a(&msg);
        }

        gfx_begin_default_pass(&pass_action, d3d11_width(), d3d11_height());
        gfx_apply_pipeline(pipe);
        gfx_apply_bindings(&bind);
        gfx_draw(0, 3, 1);
        gfx_end_pass();
        gfx_commit();
        d3d11_present();
    }
}


