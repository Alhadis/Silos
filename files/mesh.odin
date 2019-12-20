EntityType :: union {
    Empty,
    FloorTile1,
    FloorTile2,
    SmallHole,
    BigHole,
    Savepoint,
    LongJump,
    ExtraLife,
    ExtraJump,
    Shifter,
    Teleport,
    TunnelStart,
    TunnelStop,
    BrightnessPlus,
    BrightnessMinus,
    Lightning,
    Earthquake,
    NextLevel,
    Ball,
    Texture,
    Object,
    UIElement,
    Text,
    RectTile,
    TriangleTile,
    StrippedTile,
    HalfFloorTile1,
    HalfStrippedTile
}

GeometryType :: union {
    Empty,
    Plane,
    Cube,
    Sphere,
    Tube,
    TubeFragment
}

/*
mergeMesh :: proc(container, mesh) {
    vertexCount := mesh.geometry.vertices.length / 3; // 3 - x, y, z
    vertices := [];
    indices := [];

    for i..vertexCount {
        vertices.push(mesh.geometry.vertices[i*3] + (mesh.position.x))
        vertices.push(mesh.geometry.vertices[i*3+1] + (mesh.position.y))
        vertices.push(mesh.geometry.vertices[i*3+2] + (mesh.position.z))
    }

    for (let i = 0; i < (mesh.geometry.indices.length); ++i) {
        indices.push(mesh.geometry.indices[i] + container.meshCount*vertexCount)
    }

    container.geometry.vertices = container.geometry.vertices.concat(vertices)
    container.geometry.indices = container.geometry.indices.concat(indices)
    container.geometry.uv = container.geometry.uv.concat(mesh.geometry.uv)

    container.uniforms = mesh.uniforms
    //container.material = mesh.material // TODO

    container.meshCount++
}
*/
/*
function getTextureAtlasOffset(type) {
    let offset = new V2(0, 0)

    switch (type) {
        case EntityType.Object: break;
        case EntityType.Text: break;
        case EntityType.UIElement: break;

        case EntityType.Ball: { // TODO
            offset.x = 0
            offset.y = 0
        } break;

        case EntityType.Empty: {
            offset.x = 6
            offset.y = 6
        } break;

        case EntityType.FloorTile1: {
            offset.x = 0
            offset.y = 0
        } break;

        case EntityType.FloorTile2: {
            offset.x = 1
            offset.y = 0
        } break;

        case EntityType.SmallHole: {
            offset.x = 2
            offset.y = 0
        } break;

        case EntityType.BigHole: {
            offset.x = 3
            offset.y = 0
        } break;

        case EntityType.Savepoint: {
            offset.x = 0
            offset.y = 1
        } break;

        case EntityType.LongJump: {
            offset.x = 1
            offset.y = 1
        } break;

        case EntityType.ExtraLife: {
            offset.x = 2
            offset.y = 1
        } break;

        case EntityType.ExtraJump: {
            offset.x = 3
            offset.y = 1
        } break;

        case EntityType.Shifter: {
            offset.x = 0
            offset.y = 2
        } break;

        case EntityType.Teleport: {
            offset.x = 1
            offset.y = 2
        } break;

        case EntityType.TunnelStart: {
            offset.x = 2
            offset.y = 2
        } break;

        case EntityType.TunnelStop: {
            offset.x = 3
            offset.y = 2
        } break;

        case EntityType.BrightnessPlus: {
            offset.x = 0
            offset.y = 3
        } break;

        case EntityType.BrightnessMinus: {
            offset.x = 1
            offset.y = 3
        } break;

        case EntityType.Lightning: {
            offset.x = 2
            offset.y = 3
        } break;

        case EntityType.Earthquake: {
            offset.x = 3
            offset.y = 3
        } break;

        case EntityType.NextLevel: {
            offset.x = 5
            offset.y = 1
        } break;

        case EntityType.RectTile: {
            offset.x = 5
            offset.y = 2
        } break;

        case EntityType.TriangleTile: {
            offset.x = 5
            offset.y = 3
        } break;

        case EntityType.StrippedTile: {
            offset.x = 4
            offset.y = 3
        } break;

        case EntityType.HalfFloorTile1: {
            offset.x = 4
            offset.y = 1
        } break;

        case EntityType.HalfStrippedTile: {
            offset.x = 4
            offset.y = 2
        } break;

        case -1: {
            offset.x = 5
            offset.y = 0
        } break;

        default: {
            console.log("EntityType not recognized!: " + type)
            offset.x = 6
            offset.y = 6
        } break;
    }

    return offset
}
*/
/*
function getEntityCollisionSoundName(entityType) {
    let soundName = null

    switch (entityType) {
        case EntityType.Lightning: {
            soundName = "lightning" + randInt(1, 3)
        } break;

        case EntityType.Earthquake: {
            soundName = "earthquake" + randInt(1, 2)
        } break;

        case EntityType.Shifter: {
            soundName = "shifter"
        } break;

        case EntityType.Teleport: {
            soundName = "teleport"
        } break;

        case EntityType.Savepoint: {
            soundName = "savepoint"
        } break;

        case EntityType.ExtraJump: {
            soundName = "extrajump"
        } break;

        case EntityType.ExtraLife: {
            soundName = "extralife"
        } break;

        case EntityType.BrightnessMinus: {
            soundName = "brightnessminus"
        } break;

        case EntityType.BrightnessPlus: {
            soundName = "brightnessplus"
        } break;
    }

    return soundName
}

function getDeathCollisionArea(entityType) { // thih maps coords like UV: <0.0, 1.0>
    let area = []
    let max = 1.0
    let pixel = max * 0.125 // (1/8)

    switch (entityType) {
        case EntityType.Empty: {
            area.push(new Rect(0.0, 0.0, max, max))
        } break;

        case EntityType.SmallHole: {
            area.push(new Rect(3.0*pixel, 3.0*pixel, 5.0*pixel, 5.0*pixel))
        } break;

        case EntityType.BigHole: {
            area.push(new Rect(1.0*pixel, 1.0*pixel, 7.0*pixel, 7.0*pixel))
        } break;

        default: break;
    }

    return area
}
*/

/*
function changePlaneDim(planeMesh, newDim) {
    if (planeMesh.geometry.type != GeometryType.Plane) {
        console.log("geometry is not a plane!!!")
        return
    }

    if (newDim.width != undefined) {
        let newWidth = newDim.width

        planeMesh.geometry.width = newWidth

        if (planeMesh.geometry.origin == Origin.Center) {
            planeMesh.geometry.vertices[0] = -newWidth/2.0
            planeMesh.geometry.vertices[3] = -newWidth/2.0
            planeMesh.geometry.vertices[6] = newWidth/2.0
            planeMesh.geometry.vertices[9] = newWidth/2.0
        } else {
            planeMesh.geometry.vertices[6] = newWidth
            planeMesh.geometry.vertices[9] = newWidth
        }
    }

    if (newDim.height != undefined) {
        let newHeight = newDim.height

        planeMesh.geometry.height = newHeight

        if (planeMesh.geometry.origin == Origin.Center) {
            planeMesh.geometry.vertices[1] = -newWidth/2.0
            planeMesh.geometry.vertices[4] = newWidth/2.0
            planeMesh.geometry.vertices[7] = newWidth/2.0
            planeMesh.geometry.vertices[10] = -newWidth/2.0
        } else {
            planeMesh.geometry.vertices[1] = -newHeight
            planeMesh.geometry.vertices[10] = -newHeight
        }
    }
}
*/

Geometry :: struct {
    
}

function Geometry(info) {
    setProperties(this, info, ["attributes"])

    this.vertices = [] 
    this.indices  = []
    this.uv       = []

    attributeExtension(this, info.attributes)

    //this.addAttrib(new Attribute("normal", 3, new Float32Array(), AttributeType.Float32))

    switch (info.type) {
        case GeometryType.Empty: break;

        case GeometryType.Plane: {
            let halfWidth  = this.width  / 2.0
            let halfHeight = this.height / 2.0
            if (this.origin == undefined || this.origin == Origin.Center) {
                this.vertices = [
                    -halfWidth, -halfHeight, 0.0,   // left down
                    -halfWidth,  halfHeight, 0.0,   // left top
                     halfWidth,  halfHeight, 0.0,   // right top
                     halfWidth, -halfHeight, 0.0    // right down
                ]
            } else {
                this.vertices = [
                     0.0,       -this.height,  0.0, // left down
                     0.0,        0.0,          0.0, // left top
                     this.width, 0.0,          0.0, // right top
                     this.width, -this.height, 0.0  // right down
                ]
            }

            this.indices = [
                0, 1, 2,
                0, 2, 3
            ]

            this.uv = [
                0.0, 1.0,
                0.0, 0.0,
                1.0, 0.0,
                1.0, 1.0 
            ]
        } break;

        case GeometryType.Cube: {

            this.vertices = [
                // FRONT
                -(this.width/2),  -(this.height/2), this.depth/2, // left down
                -(this.width/2), (this.height/2), this.depth/2, // left top
                (this.width/2), (this.height/2), this.depth/2, // right top
                (this.width/2),  -(this.height/2), this.depth/2, // right down

                // BACK
                -(this.width/2),  -(this.height/2), -this.depth/2, // left down
                -(this.width/2), (this.height/2), -this.depth/2, // left top
                (this.width/2), (this.height/2), -this.depth/2, // right top
                (this.width/2),  -(this.height/2), -this.depth/2, // right down

                // LEFT
                -(this.width/2),  -(this.height/2), -this.depth/2, // left down
                -(this.width/2), (this.height/2), -this.depth/2, // left top
                -(this.width/2), (this.height/2), this.depth/2, // right top
                -(this.width/2),  -(this.height/2), this.depth/2, // right down

                // RIGHT
                (this.width/2),  -(this.height/2), -this.depth/2, // left down
                (this.width/2), (this.height/2), -this.depth/2, // left top
                (this.width/2), (this.height/2), this.depth/2, // right top
                (this.width/2),  -(this.height/2), this.depth/2, // right down

                // TOP
                -(this.width/2),  (this.height/2), this.depth/2, // left down
                -(this.width/2), (this.height/2), -this.depth/2, // left top
                (this.width/2), (this.height/2), -this.depth/2, // right top
                (this.width/2),  (this.height/2), this.depth/2, // right down

                // BOTTOM
                -(this.width/2),  -(this.height/2), this.depth/2, // left down
                -(this.width/2), -(this.height/2), -this.depth/2, // left top
                (this.width/2), -(this.height/2), -this.depth/2, // right top
                (this.width/2),  -(this.height/2), this.depth/2 // right down
            ]

            this.indices = [
                0, 1, 2,
                0, 2, 3,

                4, 5, 6, // + 4
                4, 6, 7,

                8, 9, 10,
                8, 10, 11,

                12, 13, 14,
                12, 14, 15,

                16, 17, 18,
                16, 18, 19,

                20, 21, 22,
                20, 22, 23,
            ]

            this.uv = [
                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0
            ]
        }

        case GeometryType.Sphere: {

            this.normals = []

            let grid  = []
            let index = 0
            
            for (let y = 0; y <= this.horizontalSegments; ++y) {
                let verticesRow = []
                let v = y / this.horizontalSegments

                for (let x = 0; x <= this.verticalSegments; ++x) {
                    let u = x / this.verticalSegments

                    let vertex = new V3(
                        -this.radius * Math.Cos(TAU*u)  * Math.Sin(PI*v),
                        this.radius  * Math.Cos(PI*v), 
                        this.radius  * Math.Sin(TAU*u)  * Math.Sin(PI*v)
                    )

                    this.vertices.push(vertex.x, vertex.y, vertex.z)

                    let vetexNormalized = vertex.normalize()
			        this.normals.push(vetexNormalized.x, vetexNormalized.y, vetexNormalized.z)

                    this.uv.push(u, 1-v)
                    verticesRow.push(index++)
                }

                grid.push(verticesRow)
            }

            for (let i = 0; i < this.uv.length; ++i) {
                this.uv[i] /= Config.TextureAtlasSize
            }

            for (let y = 0; y < this.horizontalSegments; ++y) {
                for (let x = 0; x < this.verticalSegments; ++x) {
                    let a = grid[y][x+1]
                    let b = grid[y][x]
                    let c = grid[y+1][x]
                    let d = grid[y+1][x+1]

                    if (y != 0) this.indices.push(a, b, d)
                    if (y != (this.horizontalSegments-1)) this.indices.push(b, c, d)
                }
            }

            //this.addAttrib(new Attribute("normal", 3, new Float32Array(), AttributeType.Float32))
            //this.setAttrib("normal", this.normals)
        } break;

        case GeometryType.Tube: {

            let currentAngle = 1.5*PI
            let offset = new V3(0.0, 0.0, 0.0)

            for (let i = 0; i < this.segments; ++i) {
                let nextAngle = currentAngle + this.segmentAngle
                offset.x = -Math.Cos(currentAngle) * this.radius
                offset.y = Math.Sin(currentAngle)  * this.radius
                let angleX = -Math.Cos(nextAngle)  * this.radius
                let angleY = Math.Sin(nextAngle)   * this.radius

                this.vertices.push(offset.x,  offset.y,  this.depth/2) // left down
                this.vertices.push(offset.x,  offset.y, -this.depth/2) // left top
                this.vertices.push(angleX,  angleY, -this.depth/2) // right top
                this.vertices.push(angleX,  angleY,  this.depth/2) // right down

                this.indices.push(4*i + 0, 4*i + 1, 4*i + 2, 4*i + 0, 4*i + 2, 4*i + 3)
                currentAngle = nextAngle
            }
        } break;

        case GeometryType.TubeFragment: {
            
            this.segmentAngle      = TAU / this.outerSegments
            this.innerSegmentAngle = this.segmentAngle / this.innerSegments
            this.segmentWidth      = 2.0*this.radius*Math.Sin(this.segmentAngle/2.0)

            let currentAngle = (1.5*PI) + (this.segmentAngle*(this.n-1))
            let offset = new V3(0.0, 0.0, 0.0)
            
            for (let i = 0; i < this.innerSegments; ++i) {
                let nextAngle = currentAngle + this.innerSegmentAngle
                offset.x = -Math.Cos(currentAngle) * this.radius
                offset.y = Math.Sin(currentAngle) * this.radius
                let angleX = -Math.Cos(nextAngle) * this.radius
                let angleY = Math.Sin(nextAngle) * this.radius
                this.vertices.push(offset.x,  offset.y,  this.depth/2) // left down
                this.vertices.push(offset.x,  offset.y, -this.depth/2) // left top
                this.vertices.push(angleX,  angleY, -this.depth/2) // right top
                this.vertices.push(angleX,  angleY,  this.depth/2) // right down

                this.indices.push(4*i + 0, 4*i + 1, 4*i + 2, 4*i + 0, 4*i + 2, 4*i + 3)
                currentAngle = nextAngle
            }

            for (let i = this.innerSegments; i >= 1; --i) {
                this.uv.push(
                    i/this.innerSegments, 0.0,
                    i/this.innerSegments, 1.0,
                    (i-1)/this.innerSegments, 1.0,
                    (i-1)/this.innerSegments, 0.0
                )
            }

            
            for (let i = 0; i < this.uv.length; ++i) {
                this.uv[i] /= Config.TextureAtlasSize
            }
        } break;

        default: {
            console.log("UNKNOWN GEOMETRY TYPE!")
        } break;
    }
}

function Material(materialInfo) {
    setProperties(this, materialInfo, ["uniforms"])
    uniformExtension(this, materialInfo.uniforms.uniforms, materialInfo.uniforms.index)
}

function generateTextureData(mesh) {
    if (mesh.type == EntityType.Texture) return

    let textureOffset = getTextureAtlasOffset(mesh.type).mul(new V2(1/Config.TextureAtlasSize, 1/Config.TextureAtlasSize))

    for (let i = 0; i < mesh.geometry.uv.length; ++i) {
        if (i % 2 == 0)
            mesh.geometry.uv[i] += textureOffset.x
        else
            mesh.geometry.uv[i] += textureOffset.y
    }
}

function Entity(entityInfo) {
    setProperties(this, entityInfo)
    this.id = 0 // TODO generateObjectID(hash) -> unique
    this.deathArea = getDeathCollisionArea(this.type)
    this.sound = getEntityCollisionSoundName(this.type)
    this.stepped = false
    this.needsUpdate = true // position update flag for performance

    if (this.type == EntityType.Object || this.type == EntityType.Text) {
        this.meshCount = 0
    }

    generateTextureData(this)

    this.worldMatrix = new Float32Array(16)
    identity(this.worldMatrix)

    this.position = gs.scene.origin.clone()
    updatePosition(this)
    this.needsUpdate = true
}