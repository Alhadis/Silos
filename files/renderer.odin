// _currentProgram:
// _mesh:

Mesh :: struct {
    geometry: Geometry,
    material: 
}

// bindBuffer - skąd gpu ma brać dane
// vertexAttribPointer - jak gpu ma interpretować te dane, jakich bufferów używają dane atrybuty
// when you call vertexAttribPointer it copies current value of buffer to the specified attribute
function sendAttributes(mesh) {
    let attribs = mesh.geometry.attributes

    // indices
    if (mesh.geometry.indicesAttribute != undefined) {
        gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, mesh.geometry.indicesAttribute["buffer"])
        gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array(mesh.geometry.indices), gl.STATIC_DRAW) // TODO array
    }

    //gl.enableVertexAttribArray(0) // todo better performance? why? where should it go?

    // other attributes
    let attrib
    for (let i = 0; i < attribs.length; ++i) {
        attrib = attribs[i]
        if (attrib.needsUpdate) {
            attribs[i].needsUpdate = false

            gl.enableVertexAttribArray(attrib["location"])

            gl.bindBuffer(gl.ARRAY_BUFFER, attrib["buffer"])
            gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(attrib["data"]), gl.STATIC_DRAW) // TODO ARRAY

            gl.vertexAttribPointer(
                attrib.location,          // location
                attrib.elementsPerVertex, // size (elements in array per vertex)
                gl.FLOAT,                        // type      // TODO parametrize this
                gl.FALSE,                        // normalize // TODO parametrize this
                attrib.stride,            // stride, number of elements per vertex
                0                                // offset
            )
        }
    }
}

function sendUniforms(mesh) {
    let uniform
    let texUnit = 0
    for (let i = 0; i < mesh.material.uniforms.length; ++i) {
        uniform = mesh.material.uniforms[i]

        if (uniform.type == UniformType.Texture) {
            gl.activeTexture(gl.TEXTURE0 + texUnit)
            gl.bindTexture(gl.TEXTURE_2D, uniform.value)
            gl.uniform1i(uniform.location, texUnit++)
        } else if (uniform.needsUpdate) {
            mesh.material.uniforms[i].needsUpdate = false

            //let func = uniform.set.bind(uniform.location, gl.FALSE, uniform.value)
            //func()
            //uniform.set(uniform.location, gl.FALSE, uniform.value)

            switch (uniform.type) {
                case UniformType.Matrix4: {
                    gl.uniformMatrix4fv(uniform.location, gl.FALSE, uniform.value)
                } break;

                case UniformType.Matrix3: {
                    gl.uniformMatrix3fv(uniform.location, gl.FALSE, uniform.value)
                } break;

                case UniformType.V3: {
                    gl.uniform3fv(uniform.location, uniform.value)
                } break;

                case UniformType.V2: {
                    gl.uniform2fv(uniform.location, uniform.value)
                } break;

                case UniformType.V4: {
                    gl.uniform4fv(uniform.location, uniform.value)
                } break;

                case UniformType.Float: {
                    gl.uniform1f(uniform.location, uniform.value)
                } break;
                
                case UniformType.Int: {
                    gl.uniform1i(uniform.location, uniform.value)
                } break;

                default: {
                    console.log("UNKNOWN UNIFORM TYPE!")
                }
            }
        }
    }
}

draw ::proc(meshes: []Mesh) { //camera
    for i = 0; i < meshes.length; ++i {
        mesh = meshes[i];

        if !mesh.visible continue;

        /*
        // switching programs
        //if (_drawCurrentProgram !== _mesh.material.program) {
            _drawCurrentProgram = _mesh.material.program
            gl.useProgram(_drawCurrentProgram)
            
            getAttributeLocations(_mesh, _drawCurrentProgram)
            getUniformLocations(_mesh, _drawCurrentProgram)

            if (_drawCurrentProgram === gs.pixelProgram || _drawCurrentProgram  === gs.UITextureProgram || _drawCurrentProgram === gs.fontProgram || Config.EditorMode === true) {
                gl.viewport(0, 0, gs.canvas.width, gs.canvas.height)
                gl.scissor( 0, 0, gs.canvas.width, gs.canvas.height)
            } else {
                gl.viewport(35, 25, 146, 130)
                gl.scissor(35,  25, 146, 130)
            }
        //}
        */
        /*
        switch (_currentProgram) {

            case gs.textureProgram: {
                _mesh.geometry.setAttrib("position", _mesh.geometry.vertices)
                _mesh.geometry.setAttrib("uv", _mesh.geometry.uv)

                _mesh.material.setUniform("view",       camera.viewMatrix)
                _mesh.material.setUniform("projection", camera.projMatrix)
                _mesh.material.setUniform("modelPosition", _mesh.worldMatrix)
            }

            case gs.ballProgram: {
                _mesh.geometry.setAttrib("position", _mesh.geometry.vertices)
                _mesh.geometry.setAttrib("uv", _mesh.geometry.uv)

                _mesh.material.setUniform("view",       camera.viewMatrix)
                _mesh.material.setUniform("projection", camera.projMatrix)
                _mesh.material.setUniform("modelPosition", _mesh.worldMatrix)
            } break;

            case gs.pixelProgram: {
                _mesh.geometry.setAttrib("VertexPos", _mesh.geometry.vertices)
                
                _mesh.material.setUniform("ModelPos", _mesh.worldMatrix)
                _mesh.material.setUniform("color", _mesh.color)
            } break;

            
            case gs.UITextureProgram: {
                _mesh.geometry.setAttrib("VertexPos", _mesh.geometry.vertices)
                _mesh.geometry.setAttrib("uv", _mesh.geometry.uv)

                _mesh.material.setUniform("ModelPos", _mesh.worldMatrix)

                if (_mesh.material.getUniform("texture") !== _mesh.texture) {
                    _mesh.material.setUniform("texture", _mesh.texture)
                }
            } break;

            case gs.fontProgram: {
                _mesh.material.setUniform("ModelPos", _mesh.worldMatrix)
                _mesh.material.setUniform("time", _mesh.time)
                _mesh.material.setUniform("color", _mesh.color)

                _mesh.geometry.setAttrib("VertexPos", _mesh.geometry.vertices)
                _mesh.geometry.setAttrib("uv", _mesh.geometry.uv)
            } break;
            

            default: {
                //console.log("DEFAULT CURRENT PROGRAM") // TODO LOGGER
            } break;
        }
        */

        sendAttributes(mesh)
        sendUniforms(mesh)

        gl.drawElements(gl.TRIANGLES, mesh.geometry.indices.length, gl.UNSIGNED_SHORT, 0)
    }
}