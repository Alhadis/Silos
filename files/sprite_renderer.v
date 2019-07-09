module vex

#flag linux -lSDL2
#flag linux -lSDL2_ttf
#flag linux -lSDL2_mixer
#flag linux -lSDL2_image
#flag linux -lGLEW
#flag linux -lGL
#flag linux -I @VROOT/thirdparty/vex

#include "vex.h"
/**
 *
 */
struct SpriteRenderer {
pub:
    shader Shader
    vao u32
}


/**
 * CreateSpriteRenderer
 */
pub fn create_sprite_renderer(shader *Shader) *SpriteRenderer
{
    mut s := &SpriteRenderer{ shader: shader }
    s.init_render_data()
    return s
}

pub fn (s mut SpriteRenderer) draw_sprite(texture mut Texture2D, position Vec2, size Vec2, rotate f32, color Vec3)
{
    s.shader.use()
    mut model := glm_identity()

    // First translate (transformations are: scale happens first, then rotation and 
    //                  then finall translation happens reversed order)
    model = glm_translate(model, vec3(position.x, position.y, 0))  
    model = glm_translate(model, vec3(0.5*size.x, 0.5*size.y, 0))
    // Move origin of rotation to center of quad
    model = glm_translate(model, vec3(f32(0.5) * size.x, f32(0.5) * size.y, f32(0))) 
    // Then rotate
    model = glm_rotate(model, rotate, vec3(f32(0), f32(0),f32(1))) 
    // Move origin back
    model = glm_translate(model, vec3(-f32(0.5) * size.x, -f32(0.5) * size.y, f32(0))) 
    // Last scale
    model = glm_scale(model, vec3(size.x, size.y, f32(1))) 

    // Render textured quad
    s.shader.set_matrix('model', model, true)
    s.shader.set_vector3('spriteColor', color, true)

    C.glActiveTexture(GL_TEXTURE0)
    texture.bind()

    C.glBindVertexArray(s.vao)
    C.glDrawArrays(GL_TRIANGLES, 0, 6)
    C.glBindVertexArray(0)
}

fn (s mut SpriteRenderer) init_render_data()
{
    mut vbo := u32(0)
    vertices := [
        f32(0), f32(1), f32(0), f32(1),
        f32(1), f32(0), f32(1), f32(0),
        f32(0), f32(0), f32(0), f32(0), 

        f32(0), f32(1), f32(0), f32(1),
        f32(1), f32(1), f32(1), f32(1),
        f32(1), f32(0), f32(1), f32(0)
    ] 

    C.glGenVertexArrays(1, &s.vao)
    C.glGenBuffers(1, &vbo)

    C.glBindBuffer(GL_ARRAY_BUFFER, vbo)
    C.glBufferData(GL_ARRAY_BUFFER, 24, &vertices, GL_STATIC_DRAW)
    //glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW)

    C.glBindVertexArray(s.vao)
    C.glEnableVertexAttribArray(0)
    C.glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 4 * 4, 0)
    //glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 4 * sizeof(GLfloat), (GLvoid*)0)
    C.glBindBuffer(GL_ARRAY_BUFFER, 0)
    C.glBindVertexArray(0)

    
}
