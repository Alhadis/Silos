%module Ogre
%{
  #include <Ogre.h>
  #include "ogre/SdkCameraMan.h"
  using namespace Ogre;
  using namespace OgreBites;
%}

%include "std_string.i"

namespace Ogre {
  typedef unsigned char uchar;
  typedef unsigned short ushort;
  typedef unsigned int uint;
	typedef unsigned long ulong;
  typedef float Real;
  typedef std::string String;

  typedef uint32 RGBA;
  typedef uint32 ARGB;
  typedef uint32 ABGR;
	typedef uint32 BGRA;

  typedef int uint8;


  typedef map<String, String> NameValuePairList;

  enum PixelFormat
  {
  /// Unknown pixel format.
  PF_UNKNOWN = 0,
  /// 8-bit pixel format, all bits luminace.
  PF_L8 = 1,
  PF_BYTE_L = PF_L8,
  /// 16-bit pixel format, all bits luminace.
  PF_L16 = 2,
  PF_SHORT_L = PF_L16,
  /// 8-bit pixel format, all bits alpha.
  PF_A8 = 3,
  PF_BYTE_A = PF_A8,
  /// 8-bit pixel format, 4 bits alpha, 4 bits luminance.
  PF_A4L4 = 4,
  /// 2 byte pixel format, 1 byte luminance, 1 byte alpha
  PF_BYTE_LA = 5,
  /// 16-bit pixel format, 5 bits red, 6 bits green, 5 bits blue.
  PF_R5G6B5 = 6,
  /// 16-bit pixel format, 5 bits red, 6 bits green, 5 bits blue.
  PF_B5G6R5 = 7,
  /// 8-bit pixel format, 2 bits blue, 3 bits green, 3 bits red.
  PF_R3G3B2 = 31,
  /// 16-bit pixel format, 4 bits for alpha, red, green and blue.
  PF_A4R4G4B4 = 8,
  /// 16-bit pixel format, 5 bits for blue, green, red and 1 for alpha.
  PF_A1R5G5B5 = 9,
  /// 24-bit pixel format, 8 bits for red, green and blue.
  PF_R8G8B8 = 10,
  /// 24-bit pixel format, 8 bits for blue, green and red.
  PF_B8G8R8 = 11,
  /// 32-bit pixel format, 8 bits for alpha, red, green and blue.
  PF_A8R8G8B8 = 12,
  /// 32-bit pixel format, 8 bits for blue, green, red and alpha.
  PF_A8B8G8R8 = 13,
  /// 32-bit pixel format, 8 bits for blue, green, red and alpha.
  PF_B8G8R8A8 = 14,
  /// 32-bit pixel format, 8 bits for red, green, blue and alpha.
  PF_R8G8B8A8 = 28,
  /// 32-bit pixel format, 8 bits for red, 8 bits for green, 8 bits for blue
  /// like PF_A8R8G8B8, but alpha will get discarded
  PF_X8R8G8B8 = 26,
  /// 32-bit pixel format, 8 bits for blue, 8 bits for green, 8 bits for red
  /// like PF_A8B8G8R8, but alpha will get discarded
  PF_X8B8G8R8 = 27,
  #if OGRE_ENDIAN == OGRE_ENDIAN_BIG
  /// 3 byte pixel format, 1 byte for red, 1 byte for green, 1 byte for blue
  PF_BYTE_RGB = PF_R8G8B8,
  /// 3 byte pixel format, 1 byte for blue, 1 byte for green, 1 byte for red
  PF_BYTE_BGR = PF_B8G8R8,
  /// 4 byte pixel format, 1 byte for blue, 1 byte for green, 1 byte for red and one byte for alpha
  PF_BYTE_BGRA = PF_B8G8R8A8,
  /// 4 byte pixel format, 1 byte for red, 1 byte for green, 1 byte for blue, and one byte for alpha
  PF_BYTE_RGBA = PF_R8G8B8A8,
  #else
  /// 3 byte pixel format, 1 byte for red, 1 byte for green, 1 byte for blue
  PF_BYTE_RGB = PF_B8G8R8,
  /// 3 byte pixel format, 1 byte for blue, 1 byte for green, 1 byte for red
  PF_BYTE_BGR = PF_R8G8B8,
  /// 4 byte pixel format, 1 byte for blue, 1 byte for green, 1 byte for red and one byte for alpha
  PF_BYTE_BGRA = PF_A8R8G8B8,
  /// 4 byte pixel format, 1 byte for red, 1 byte for green, 1 byte for blue, and one byte for alpha
  PF_BYTE_RGBA = PF_A8B8G8R8,
  #endif
  /// 32-bit pixel format, 2 bits for alpha, 10 bits for red, green and blue.
  PF_A2R10G10B10 = 15,
  /// 32-bit pixel format, 10 bits for blue, green and red, 2 bits for alpha.
  PF_A2B10G10R10 = 16,
  /// DDS (DirectDraw Surface) DXT1 format
  PF_DXT1 = 17,
  /// DDS (DirectDraw Surface) DXT2 format
  PF_DXT2 = 18,
  /// DDS (DirectDraw Surface) DXT3 format
  PF_DXT3 = 19,
  /// DDS (DirectDraw Surface) DXT4 format
  PF_DXT4 = 20,
  /// DDS (DirectDraw Surface) DXT5 format
  PF_DXT5 = 21,
  // 16-bit pixel format, 16 bits (float) for red
  PF_FLOAT16_R = 32,
  // 48-bit pixel format, 16 bits (float) for red, 16 bits (float) for green, 16 bits (float) for blue
  PF_FLOAT16_RGB = 22,
  // 64-bit pixel format, 16 bits (float) for red, 16 bits (float) for green, 16 bits (float) for blue, 16 bits (float) for alpha
  PF_FLOAT16_RGBA = 23,
  // 32-bit pixel format, 32 bits (float) for red
  PF_FLOAT32_R = 33,
  // 96-bit pixel format, 32 bits (float) for red, 32 bits (float) for green, 32 bits (float) for blue
  PF_FLOAT32_RGB = 24,
  // 128-bit pixel format, 32 bits (float) for red, 32 bits (float) for green, 32 bits (float) for blue, 32 bits (float) for alpha
  PF_FLOAT32_RGBA = 25,
  // 32-bit, 2-channel s10e5 floating point pixel format, 16-bit green, 16-bit red
  PF_FLOAT16_GR = 35,
  // 64-bit, 2-channel floating point pixel format, 32-bit green, 32-bit red
  PF_FLOAT32_GR = 36,
  // Depth texture format
  PF_DEPTH = 29,
  // 64-bit pixel format, 16 bits for red, green, blue and alpha
  PF_SHORT_RGBA = 30,
  // 32-bit pixel format, 16-bit green, 16-bit red
  PF_SHORT_GR = 34,
  // 48-bit pixel format, 16 bits for red, green and blue
  PF_SHORT_RGB = 37,
  /// PVRTC (PowerVR) RGB 2 bpp
  PF_PVRTC_RGB2 = 38,
  /// PVRTC (PowerVR) RGBA 2 bpp
  PF_PVRTC_RGBA2 = 39,
  /// PVRTC (PowerVR) RGB 4 bpp
  PF_PVRTC_RGB4 = 40,
  /// PVRTC (PowerVR) RGBA 4 bpp
  PF_PVRTC_RGBA4 = 41,
  // Number of pixel formats currently defined
  PF_COUNT = 42
  };
  typedef vector<PixelFormat>::type PixelFormatList;

  /**
  * Flags defining some on/off properties of pixel formats
  */
  enum PixelFormatFlags {
  // This format has an alpha channel
  PFF_HASALPHA        = 0x00000001,
  // This format is compressed. This invalidates the values in elemBytes,
  // elemBits and the bit counts as these might not be fixed in a compressed format.
  PFF_COMPRESSED    = 0x00000002,
  // This is a floating point format
  PFF_FLOAT           = 0x00000004,
  // This is a depth format (for depth textures)
  PFF_DEPTH           = 0x00000008,
  // Format is in native endian. Generally true for the 16, 24 and 32 bits
  // formats which can be represented as machine integers.
  PFF_NATIVEENDIAN    = 0x00000010,
  // This is an intensity format instead of a RGB one. The luminance
  // replaces R,G and B. (but not A)
  PFF_LUMINANCE       = 0x00000020
  };

  /** Pixel component format */
  enum PixelComponentType
  {
  PCT_BYTE = 0,    /// Byte per component (8 bit fixed 0.0..1.0)
  PCT_SHORT = 1,   /// Short per component (16 bit fixed 0.0..1.0))
  PCT_FLOAT16 = 2, /// 16 bit float per component
  PCT_FLOAT32 = 3, /// 32 bit float per component
  PCT_COUNT = 4    /// Number of pixel types
  };

  enum FogMode
  {
      FOG_NONE,
      FOG_EXP,
      FOG_EXP2,
      FOG_LINEAR
  };

  enum CullingMode
  {
      /// Hardware never culls triangles and renders everything it receives.
      CULL_NONE = 1,
      /// Hardware culls triangles whose vertices are listed clockwise in the view (default).
      CULL_CLOCKWISE = 2,
      /// Hardware culls triangles whose vertices are listed anticlockwise in the view.
      CULL_ANTICLOCKWISE = 3
  };

  enum ManualCullingMode
  {
      /// No culling so everything is sent to the hardware.
      MANUAL_CULL_NONE = 1,
      /// Cull triangles whose normal is pointing away from the camera (default).
      MANUAL_CULL_BACK = 2,
      /// Cull triangles whose normal is pointing towards the camera.
      MANUAL_CULL_FRONT = 3
  };

  enum ShadowTechnique
  {
    SHADOWTYPE_NONE = 0x00,
		SHADOWDETAILTYPE_ADDITIVE = 0x01,
		SHADOWDETAILTYPE_MODULATIVE = 0x02,
		SHADOWDETAILTYPE_INTEGRATED = 0x04,
		SHADOWDETAILTYPE_STENCIL = 0x10,
		SHADOWDETAILTYPE_TEXTURE = 0x20,
    SHADOWTYPE_STENCIL_MODULATIVE = 0x12,
    SHADOWTYPE_STENCIL_ADDITIVE = 0x11,
    SHADOWTYPE_TEXTURE_MODULATIVE = 0x22,
    SHADOWTYPE_TEXTURE_ADDITIVE = 0x21,
		SHADOWTYPE_TEXTURE_ADDITIVE_INTEGRATED = 0x25,
		SHADOWTYPE_TEXTURE_MODULATIVE_INTEGRATED = 0x26
  };

  enum PolygonMode
  {
    /// Only points are rendered.
    PM_POINTS = 1,
    /// Wireframe models are rendered.
    PM_WIREFRAME = 2,
    /// Solid polygons are rendered.
    PM_SOLID = 3
  };


  enum RenderQueueGroupID
  {
    /// Use this queue for objects which must be rendered first e.g. backgrounds
    RENDER_QUEUE_BACKGROUND = 0,
    /// First queue (after backgrounds), used for skyboxes if rendered first
    RENDER_QUEUE_SKIES_EARLY = 5,
    RENDER_QUEUE_1 = 10,
    RENDER_QUEUE_2 = 20,
    RENDER_QUEUE_WORLD_GEOMETRY_1 = 25,
    RENDER_QUEUE_3 = 30,
    RENDER_QUEUE_4 = 40,
    /// The default render queue
    RENDER_QUEUE_MAIN = 50,
    RENDER_QUEUE_6 = 60,
    RENDER_QUEUE_7 = 70,
    RENDER_QUEUE_WORLD_GEOMETRY_2 = 75,
    RENDER_QUEUE_8 = 80,
    RENDER_QUEUE_9 = 90,
    /// Penultimate queue(before overlays), used for skyboxes if rendered last
    RENDER_QUEUE_SKIES_LATE = 95,
    /// Use this queue for objects which must be rendered last e.g. overlays
    RENDER_QUEUE_OVERLAY = 100,
    /// Final possible render queue, don't exceed this
    RENDER_QUEUE_MAX = 105
  };

	class Any
  {
    public: // constructors

    Any();
    Any(const Any & other);
    virtual ~Any();
    bool isEmpty() const;
    const std::type_info& getType() const;
		void destroy();

  };

  class Vector2 {
    public:
    Real x,y;

    Vector2( const Real fX, const Real fY );
    Vector2( const Real scalar );
  };

  class Vector3 {
    public:

    Vector3( const Real fX, const Real fY, const Real fZ );
    Vector3( const Real scalar );

    Real x, y, z;
    static const Vector3 ZERO;
    static const Vector3 UNIT_X;
    static const Vector3 UNIT_Y;
    static const Vector3 UNIT_Z;
    static const Vector3 NEGATIVE_UNIT_X;
    static const Vector3 NEGATIVE_UNIT_Y;
    static const Vector3 NEGATIVE_UNIT_Z;
    static const Vector3 UNIT_SCALE;
  };

  // put the static constants of Vector3 in its own table
  /*%luacode {
    if not Ogre then Ogre = {} end
    if not Ogre.Vector3 then Ogre.Vector3 = {} end

    Ogre.Vector3.ZERO = Ogre.Vector3_ZERO
    Ogre.Vector3.UNIT_X = Ogre.Vector3_UNIT_X
    Ogre.Vector3.UNIT_Y = Ogre.Vector3_UNIT_Y
    Ogre.Vector3.UNIT_Z = Ogre.Vector3_UNIT_Z
    Ogre.Vector3.NEGATIVE_UNIT_X = Ogre.Vector3_NEGATIVE_UNIT_X
    Ogre.Vector3.NEGATIVE_UNIT_Y = Ogre.Vector3_NEGATIVE_UNIT_Y
    Ogre.Vector3.NEGATIVE_UNIT_Z = Ogre.Vector3_NEGATIVE_UNIT_Z
    Ogre.Vector3.UNIT_SCALE = Ogre.Vector3_UNIT_SCALE
  %}*/

  class Degree {
    public:

    Degree(float f);

		Real valueDegrees() const;
		Real valueRadians() const;
		Real valueAngleUnits() const;
  };

  class Radian
	{
    public:

		Radian ( Real r=0 );
		Radian ( const Degree& d );

		Real valueDegrees() const;
		Real valueRadians() const;
		Real valueAngleUnits() const;
	};

	class Angle
	{
    public:

		Angle ( Real angle );
	};

  class Quaternion {
    public:

		inline Quaternion();
		inline Quaternion(Real fW,	Real fX, Real fY, Real fZ);
    inline Quaternion(const Radian& rfAngle, const Vector3& rkAxis);
    inline Quaternion(const Vector3& xaxis, const Vector3& yaxis, const Vector3& zaxis);
    inline Quaternion(const Vector3* akAxis);
  };

  class ColourValue
  {
    public:

    ColourValue( float red = 1.0f,
      float green = 1.0f,
      float blue = 1.0f,
      float alpha = 1.0f );
  };

  class Plane {
    public:

    Plane (const Vector3& rkNormal, Real fConstant);
    Plane (Real a, Real b, Real c, Real d);
  };

  class AxisAlignedBox {
    public:

		enum Extent
		{
			EXTENT_NULL,
			EXTENT_FINITE,
			EXTENT_INFINITE
		};

		typedef enum {
			FAR_LEFT_BOTTOM = 0,
			FAR_LEFT_TOP = 1,
			FAR_RIGHT_TOP = 2,
			FAR_RIGHT_BOTTOM = 3,
			NEAR_RIGHT_BOTTOM = 7,
			NEAR_LEFT_BOTTOM = 6,
			NEAR_LEFT_TOP = 5,
			NEAR_RIGHT_TOP = 4
		} CornerEnum;

    AxisAlignedBox();
    Vector3 getSize() const;

    Vector3& getMaximum(void) const;
    Vector3& getMinimum(void) const;
    Vector3 getCenter(void) const;
  };

  /*%luacode {
    if not Ogre then Ogre = {} end
    if not Ogre.AxisAlignedBox then Ogre.AxisAlignedBox = {} end

    Ogre.AxisAlignedBox.EXTENT_NULL = Ogre.AxisAlignedBox_EXTENT_NULL
    Ogre.AxisAlignedBox.EXTENT_FINITE = Ogre.AxisAlignedBox_EXTENT_FINITE
    Ogre.AxisAlignedBox.EXTENT_INFINITE = Ogre.AxisAlignedBox_EXTENT_INFINITE

    Ogre.AxisAlignedBox.FAR_LEFT_BOTTOM = Ogre.AxisAlignedBox_FAR_LEFT_BOTTOM
    Ogre.AxisAlignedBox.FAR_LEFT_TOP = Ogre.AxisAlignedBox_FAR_LEFT_TOP
    Ogre.AxisAlignedBox.FAR_RIGHT_TOP = Ogre.AxisAlignedBox_FAR_RIGHT_TOP
    Ogre.AxisAlignedBox.FAR_RIGHT_BOTTOM = Ogre.AxisAlignedBox_FAR_RIGHT_BOTTOM
    Ogre.AxisAlignedBox.NEAR_RIGHT_BOTTOM = Ogre.AxisAlignedBox_NEAR_RIGHT_BOTTOM
    Ogre.AxisAlignedBox.NEAR_LEFT_BOTTOM = Ogre.AxisAlignedBox_NEAR_LEFT_BOTTOM
    Ogre.AxisAlignedBox.NEAR_LEFT_TOP = Ogre.AxisAlignedBox_NEAR_LEFT_TOP
    Ogre.AxisAlignedBox.NEAR_RIGHT_TOP = Ogre.AxisAlignedBox_NEAR_RIGHT_TOP
  %}*/

  class MovableObject {
    public:
    void setRenderQueueGroup(uint8 queueID);
    void setRenderQueueGroupAndPriority(uint8 queueID, ushort priority);
    AxisAlignedBox& getBoundingBox(void) const;
    AxisAlignedBox getWorldBoundingBox(bool derive = false) const;

    const String& getMovableType(void) const;

    virtual void setQueryFlags(int flags);
    virtual void setVisibilityFlags(int flags);
    virtual void setUserAny(const Any& anything);
    virtual const Any& getUserAny(void) const;

    void setCastShadows(bool enabled);
    bool getCastShadows(void);
  };

  %nodefaultdtor SubEntity;
  class SubEntity {

  };

  class Node
  {
    public:
    enum TransformSpace
    {
      TS_LOCAL,
      TS_PARENT,
      TS_WORLD
    };

    /** Returns the name of the node. */
    const String& getName(void) const;

    /** Gets this node's parent (NULL if this is the root).
    */
    virtual Node* getParent(void) const;

    virtual void setPosition(const Vector3& pos);
    Vector3& getPosition() const;

    virtual void setScale(const Vector3& scale);
    virtual void setScale(Real x, Real y, Real z);
    virtual const Vector3 & getScale(void) const;

    virtual Node* createChild(
    const Vector3& translate = Vector3::ZERO,
    const Quaternion& rotate = Quaternion::IDENTITY );

    virtual Node* createChild(const String& name, const Vector3& translate = Vector3::ZERO, const Quaternion& rotate = Quaternion::IDENTITY);

    virtual void addChild(Node* child);

    virtual Node* getChild(int index) const;
    virtual int numChildren(void) const;

    virtual Node* getChild(const String& name) const;
    virtual Node* removeChild(unsigned short index);
    virtual Node* removeChild(Node* child);

    virtual Node* removeChild(const String& name);

    virtual void removeAllChildren(void);
  };

  /*%luacode {
    if not Ogre then Ogre = {} end
    if not Ogre.Node then Ogre.Node = {} end
    Ogre.Node.TS_LOCAL = Ogre.Node_TS_LOCAL
    Ogre.Node.TS_PARENT = Ogre.Node_TS_PARENT
    Ogre.Node.TS_WORLD = Ogre.Node_TS_WORLD
  %}*/


  class Entity : public MovableObject {
    public:

		SubEntity* getSubEntity(unsigned int index) const;
		SubEntity* getSubEntity( const String& name ) const;
		unsigned int getNumSubEntities(void) const;
    void setDisplaySkeleton(bool display);
    void setMaterialName( const String& name, const String& groupName = ResourceGroupManager::AUTODETECT_RESOURCE_GROUP_NAME );
  };

  class SceneNode : public Node {
    public:

    void yaw(const Degree&);
    void pitch(const Degree&);
    void roll(const Degree&);

    virtual void attachObject(MovableObject* obj);
    virtual unsigned short numAttachedObjects(void) const;
    virtual MovableObject* getAttachedObject(unsigned short index);
    virtual MovableObject* getAttachedObject(const String& name);
    virtual MovableObject* detachObject(unsigned short index);
    virtual void detachObject(MovableObject* obj);
    virtual MovableObject* detachObject(const String& name);
    virtual void detachAllObjects(void);

    SceneManager* getCreator(void) const;

    virtual SceneNode* createChildSceneNode(
        const Vector3& translate = Vector3::ZERO,
        const Quaternion& rotate = Quaternion::IDENTITY );
    virtual SceneNode* createChildSceneNode(const String& name, const Vector3& translate = Vector3::ZERO, const Quaternion& rotate = Quaternion::IDENTITY);

    virtual void removeAndDestroyChild(const String& name);

    virtual void removeAndDestroyChild(unsigned short index);
    virtual void removeAndDestroyAllChildren(void);

    virtual void showBoundingBox(bool bShow);
    virtual void hideBoundingBox(bool bHide);

    virtual void setDirection(
      Real x, Real y, Real z,
      TransformSpace relativeTo = TS_LOCAL,
      const Vector3& localDirectionVector = Vector3::NEGATIVE_UNIT_Z);

    virtual void setDirection(
      const Vector3& vec,
      TransformSpace relativeTo = TS_LOCAL,
      const Vector3& localDirectionVector = Vector3::NEGATIVE_UNIT_Z);
    virtual void lookAt(
      const Vector3& targetPoint,
      TransformSpace relativeTo,
      const Vector3& localDirectionVector = Vector3::NEGATIVE_UNIT_Z);

    virtual void setAutoTracking(
      bool enabled, SceneNode* target = 0,
      const Vector3& localDirectionVector = Vector3::NEGATIVE_UNIT_Z,
      const Vector3& offset = Vector3::ZERO);
    virtual SceneNode* getAutoTrackTarget(void);
		virtual const Vector3& getAutoTrackOffset(void);
		virtual const Vector3& getAutoTrackLocalDirection(void);

    SceneNode* getParentSceneNode(void) const;
    virtual void setVisible(bool visible, bool cascade = true);
    virtual void flipVisibility(bool cascade = true);

    virtual void setOrientation( const Quaternion& q );
    virtual void setOrientation( Real w, Real x, Real y, Real z);
  };

  class Light : public MovableObject {
    public:
    /// Defines the type of light
    enum LightTypes
    {
        /// Point light sources give off light equally in all directions, so require only position not direction
        LT_POINT = 0,
        /// Directional lights simulate parallel light beams from a distant source, hence have direction but no position
        LT_DIRECTIONAL = 1,
        /// Spotlights simulate a cone of light from a source so require position and direction, plus extra values for falloff
        LT_SPOTLIGHT = 2
    };

    Light();
    Light(const String& name);
    ~Light();

    void setType(LightTypes type);
    LightTypes getType(void) const;

    void setDiffuseColour(Real red, Real green, Real blue);
    void setDiffuseColour(const ColourValue& colour);
    const ColourValue& getDiffuseColour(void) const;

    void setSpecularColour(Real red, Real green, Real blue);
    void setSpecularColour(const ColourValue& colour);
    const ColourValue& getSpecularColour(void) const;

    void setAttenuation(Real range, Real constant, Real linear, Real quadratic);
    Real getAttenuationRange(void) const;
    Real getAttenuationConstant(void) const;
    Real getAttenuationLinear(void) const;
    Real getAttenuationQuadric(void) const;

    void setPosition(Real x, Real y, Real z);
    void setPosition(const Vector3& vec);
    const Vector3& getPosition(void) const;

    void setDirection(Real x, Real y, Real z);
    void setDirection(const Vector3& vec);
    const Vector3& getDirection(void) const;

    void setSpotlightRange(const Radian& innerAngle, const Radian& outerAngle, Real falloff = 1.0);
    const Radian& getSpotlightInnerAngle(void) const;
    const Radian& getSpotlightOuterAngle(void) const;
    Real getSpotlightFalloff(void) const;
    void setSpotlightInnerAngle(const Radian& val);
    void setSpotlightOuterAngle(const Radian& val);
    void setSpotlightFalloff(Real val);

		//void setSpotlightNearClipDistance(Real nearClip);
		//Real getSpotlightNearClipDistance() const;

		void setPowerScale(Real power);
		Real getPowerScale(void) const;

    const AxisAlignedBox& getBoundingBox(void) const;
    const String& getMovableType(void) const;
    const Vector3& getDerivedPosition(bool cameraRelativeIfSet = false) const;
    const Vector3& getDerivedDirection(void) const;

    void setVisible(bool visible);
  };

  /*%luacode {
    if not Ogre then Ogre = {} end
    if not Ogre.Node then Ogre.Node = {} end
    Ogre.Light.LT_POINT = Ogre.Light_LT_POINT
    Ogre.Light.LT_DIRECTIONAL = Ogre.Light_LT_DIRECTIONAL
    Ogre.Light.LT_SPOTLIGHT = Ogre.Light_LT_SPOTLIGHT
  %}*/

  class Camera {
    public:

    Camera( const Ogre::String& name, Ogre::SceneManager* sm);
    virtual ~Camera();

    SceneManager* getSceneManager(void) const;

    virtual void setAspectRatio(Real ratio);

    virtual void setNearClipDistance(Real nearDist);
    virtual Real getNearClipDistance(void) const;
    virtual void setFarClipDistance(Real farDist);
    virtual Real getFarClipDistance(void) const;

    void setPolygonMode(PolygonMode sd);
    PolygonMode getPolygonMode(void) const;

    void setPosition(Real x, Real y, Real z);
    void setPosition(const Vector3& vec);
    const Vector3& getPosition(void) const;

    void move(const Vector3& vec);
    void moveRelative(const Vector3& vec);

    void setDirection(Real x, Real y, Real z);
    void setDirection(const Vector3& vec);
    Vector3 getDirection(void) const;

    Vector3 getUp(void) const;
    Vector3 getRight(void) const;

    void lookAt( const Vector3& targetPoint );
    void lookAt(Real x, Real y, Real z);

    void roll(const Radian& angle);
    void yaw(const Radian& angle);
    void pitch(const Radian& angle);

    void rotate(const Vector3& axis, const Radian& angle);
    void rotate(const Quaternion& q);

    void setFixedYawAxis( bool useFixed, const Vector3& fixedAxis = Vector3::UNIT_Y );

    const Quaternion& getOrientation(void) const;
    void setOrientation(const Quaternion& q);

    Viewport* getViewport(void) const;
  };

  class StaticGeometry {

  };

  class InstancedGeometry {

  };

  class Renderable {
  };

  class RibbonTrail {

  };
  class RenderTarget
  {


    /// Retrieve target's name.
    virtual const String& getName(void) const;

    /// Retrieve information about the render target.
    virtual void getMetrics(unsigned int& width, unsigned int& height, unsigned int& colourDepth);

    virtual unsigned int getWidth(void) const;
    virtual unsigned int getHeight(void) const;
    virtual unsigned int getColourDepth(void) const;
    /** Writes the current contents of the render target to the named file. */
    void writeContentsToFile(const String& filename);

    /** Writes the current contents of the render target to the (PREFIX)(time-stamp)(SUFFIX) file.
    @returns the name of the file used.*/
    virtual String writeContentsToTimestampedFile(const String& filenamePrefix, const String& filenameSuffix);
    virtual Viewport* addViewport(Camera* cam, int ZOrder = 0, float left = 0.0f, float top = 0.0f ,
          float width = 1.0f, float height = 1.0f);

    /** Returns the number of viewports attached to this target.*/
    virtual unsigned short getNumViewports(void) const;

    /** Retrieves a pointer to the viewport with the given index. */
    virtual Viewport* getViewport(unsigned short index);

		/** Retrieves a pointer to the viewport with the given zorder.
			@remarks throws if not found.
		*/
    virtual Viewport* getViewportByZOrder(int ZOrder);

		/** Returns true if and only if a viewport exists at the given ZOrder. */
		virtual bool hasViewportWithZOrder(int ZOrder);

    /** Removes a viewport at a given ZOrder.
    */
    virtual void removeViewport(int ZOrder);

    /** Removes all viewports on this target.
    */
    virtual void removeAllViewports(void);

    virtual void getStatistics(float& lastFPS, float& avgFPS,
        float& bestFPS, float& worstFPS) const;  // Access to stats

    /** Individual stats access - gets the number of frames per second (FPS) based on the last frame rendered.
    */
    virtual float getLastFPS() const;

    /** Individual stats access - gets the average frames per second (FPS) since call to Root::startRendering.
    */
    virtual float getAverageFPS() const;

    /** Individual stats access - gets the best frames per second (FPS) since call to Root::startRendering.
    */
    virtual float getBestFPS() const;

    /** Individual stats access - gets the worst frames per second (FPS) since call to Root::startRendering.
    */
    virtual float getWorstFPS() const;

    /** Individual stats access - gets the best frame time
    */
    virtual float getBestFrameTime() const;

    /** Individual stats access - gets the worst frame time
    */
    virtual float getWorstFrameTime() const;

    /** Resets saved frame-rate statistices.
    */
    virtual void resetStatistics(void);
  };

  %nodefaultctor RenderWindow;
  %nodefaultdtor RenderWindow;

  class RenderWindow : public RenderTarget
  {
    public:


    virtual void setFullscreen(bool fullScreen, unsigned int width, unsigned int height);
    virtual void destroy(void) = 0;
    virtual void resize(unsigned int width, unsigned int height);
    virtual void windowMovedOrResized();
    virtual void reposition(int left, int top) = 0;

    virtual bool isVisible(void) const { return true; }
    virtual void setVisible(bool visible);
    virtual bool isHidden(void) const;
    virtual void setHidden(bool hidden);
    virtual void setVSyncEnabled(bool vsync);
    virtual bool isVSyncEnabled() const;
    virtual void setVSyncInterval(unsigned int interval);
    virtual unsigned int getVSyncInterval() const;

    virtual bool isActive(void) const;
    virtual bool isClosed(void) const;

    virtual bool isPrimary(void) const;
    virtual bool isFullScreen(void) const;
    virtual void getMetrics(unsigned int& width, unsigned int& height, unsigned int& colourDepth, int& left, int& top);

    /// Override since windows don't usually have alpha
    PixelFormat suggestPixelFormat() const;
    bool isDeactivatedOnFocusChange() const;
    void setDeactivateOnFocusChange(bool deactivate);

  };


  enum BillboardOrigin
  {
      BBO_TOP_LEFT,
      BBO_TOP_CENTER,
      BBO_TOP_RIGHT,
      BBO_CENTER_LEFT,
      BBO_CENTER,
      BBO_CENTER_RIGHT,
      BBO_BOTTOM_LEFT,
      BBO_BOTTOM_CENTER,
      BBO_BOTTOM_RIGHT
  };
  /** The rotation type of billboard. */
  enum BillboardRotationType
  {
      /// Rotate the billboard's vertices around their facing direction
      BBR_VERTEX,
      /// Rotate the billboard's texture coordinates
      BBR_TEXCOORD
  };
  /** The type of billboard to use. */
  enum BillboardType
  {
      /// Standard point billboard (default), always faces the camera completely and is always upright
      BBT_POINT,
      /// Billboards are oriented around a shared direction vector (used as Y axis) and only rotate around this to face the camera
      BBT_ORIENTED_COMMON,
      /// Billboards are oriented around their own direction vector (their own Y axis) and only rotate around this to face the camera
      BBT_ORIENTED_SELF,
      /// Billboards are perpendicular to a shared direction vector (used as Z axis, the facing direction) and X, Y axis are determined by a shared up-vertor
      BBT_PERPENDICULAR_COMMON,
      /// Billboards are perpendicular to their own direction vector (their own Z axis, the facing direction) and X, Y axis are determined by a shared up-vertor
      BBT_PERPENDICULAR_SELF
  };


  class Billboard  {
    public:
    // Note the intentional public access to main internal variables used at runtime
    // Forcing access via get/set would be too costly for 000's of billboards
    Vector3 mPosition;
    // Normalised direction vector
    Vector3 mDirection;
    BillboardSet* mParentSet;
    ColourValue mColour;
    Radian mRotation;

    Billboard();

    ~Billboard();

    Billboard(const Vector3& position, BillboardSet* owner, const ColourValue& colour = ColourValue::White);

    const Radian& getRotation(void) const;

    void setRotation(const Radian& rotation);

    void setPosition(const Vector3& position);

    void setPosition(Real x, Real y, Real z);

    const Vector3& getPosition(void) const;

    void setDimensions(Real width, Real height);

    void resetDimensions(void);
    void setColour(const ColourValue& colour);

    const ColourValue& getColour(void) const;

    bool hasOwnDimensions(void) const;

    Real getOwnWidth(void) const;

    Real getOwnHeight(void) const;

    void _notifyOwner(BillboardSet* owner);


    bool isUseTexcoordRect(void) const;


    void setTexcoordIndex(Ogre::uint16 texcoordIndex);

    Ogre::uint16 getTexcoordIndex(void) const;

    //void setTexcoordRect(const FloatRect& texcoordRect);

    void setTexcoordRect(Real u0, Real v0, Real u1, Real v1);

    //const FloatRect& getTexcoordRect(void) const;
  };

  class BillboardSet : public MovableObject, public Renderable {
    public:
    BillboardSet( const String& name, unsigned int poolSize = 20,
    bool externalDataSource = false);
    virtual ~BillboardSet();

    Billboard* createBillboard(
    const Vector3& position,
    const ColourValue& colour = ColourValue::White );

    Billboard* createBillboard(
    Real x, Real y, Real z,
    const ColourValue& colour = ColourValue::White );

    virtual int getNumBillboards(void) const;


    virtual void setAutoextend(bool autoextend);

    virtual bool getAutoextend(void) const;


		virtual void setSortingEnabled(bool sortenable);
		virtual bool getSortingEnabled(void) const;

    virtual void setPoolSize(size_t size);
    virtual unsigned int getPoolSize(void) const;

    virtual void clear();

    virtual Billboard* getBillboard(unsigned int index) const;

    virtual void removeBillboard(unsigned int index);
    virtual void removeBillboard(Billboard* pBill);

    virtual void setBillboardOrigin(BillboardOrigin origin);
    virtual BillboardOrigin getBillboardOrigin(void) const;

    virtual void setBillboardRotationType(BillboardRotationType rotationType);
    virtual BillboardRotationType getBillboardRotationType(void) const;

    virtual void setDefaultDimensions(Real width, Real height);
    virtual void setDefaultWidth(Real width);
    virtual Real getDefaultWidth(void) const;
    virtual void setDefaultHeight(Real height);
    virtual Real getDefaultHeight(void) const;

    virtual void setMaterialName( const String& name, const String& groupName = ResourceGroupManager::AUTODETECT_RESOURCE_GROUP_NAME );
    virtual const String& getMaterialName(void) const;

    virtual bool getCullIndividually(void) const;
    virtual void setCullIndividually(bool cullIndividual);

    virtual void setBillboardType(BillboardType bbt);
    virtual BillboardType getBillboardType(void) const;
    virtual void setCommonDirection(const Vector3& vec);

    virtual const Vector3& getCommonDirection(void) const;
    virtual void setCommonUpVector(const Vector3& vec);
    virtual const Vector3& getCommonUpVector(void) const;
    //virtual void setTextureCoords( Ogre::FloatRect const * coords, Ogre::uint16 numCoords );
  };


  %nodefaultctor SceneManager;
  %nodefaultdtor SceneManager;

  class SceneManager {
    public:

    virtual Camera* createCamera(const String& name);
    virtual Camera* getCamera(const String& name) const;
    virtual bool hasCamera(const String& name) const;
    virtual void destroyAllCameras(void);
    virtual void destroyCamera(Camera*);

    virtual Light* createLight(const String& name);
		virtual Light* createLight();
    virtual Light* getLight(const String& name) const;
		virtual bool hasLight(const String& name) const;
    virtual void destroyLight(const String& name);
    virtual void destroyLight(Light*);
    virtual void destroyAllLights(void);


    void setAmbientLight(const ColourValue& colour);
    const ColourValue& getAmbientLight(void) const;

    virtual void setWorldGeometry(const String& filename);

    virtual void clearScene(void);

    virtual SceneNode* createSceneNode(void);
    virtual SceneNode* createSceneNode(const String& name);

    virtual void destroySceneNode(const String& name);
    virtual void destroySceneNode(SceneNode* sn);

    virtual SceneNode* getRootSceneNode(void);
    virtual SceneNode* getSceneNode(const String& name) const;
		virtual bool hasSceneNode(const String& name) const;

    virtual Entity* createEntity(
      const String& entityName,
      const String& meshName,
      const String& groupName = ResourceGroupManager::AUTODETECT_RESOURCE_GROUP_NAME );
    virtual Entity* createEntity(const String& meshName);

    virtual Entity* getEntity(const String& name) const;
		virtual bool hasEntity(const String& name) const;
    virtual void destroyEntity(Entity* ent);
    virtual void destroyEntity(const String& name);
    virtual void destroyAllEntities(void);

    virtual void setSkyPlane(
        bool enable,
        const Plane& plane, const String& materialName, Real scale = 1000,
        Real tiling = 10, bool drawFirst = true, Real bow = 0,
        int xsegments = 1, int ysegments = 1,
        const String& groupName = ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME);
		virtual void setSkyPlaneEnabled(bool enable);
		virtual bool isSkyPlaneEnabled(void) const;
		virtual SceneNode* getSkyPlaneNode(void) const;

    virtual void setSkyBox(
      bool enable, const String& materialName, Real distance = 5000,
      bool drawFirst = true, const Quaternion& orientation = Quaternion::IDENTITY,
      const String& groupName = ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME);

		virtual void setSkyBoxEnabled(bool enable);
		virtual bool isSkyBoxEnabled(void) const;
		virtual SceneNode* getSkyBoxNode(void) const;

    virtual void setSkyDome(
      bool enable, const String& materialName, Real curvature = 10,
      Real tiling = 8, Real distance = 4000, bool drawFirst = true,
      const Quaternion& orientation = Quaternion::IDENTITY,
      int xsegments = 16, int ysegments = 16, int ysegments_keep = -1,
      const String& groupName = ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME);

    void setFog(
      FogMode mode = FOG_NONE, const ColourValue& colour = ColourValue::White,
      Real expDensity = 0.001, Real linearStart = 0.0, Real linearEnd = 1.0);

    virtual FogMode getFogMode(void) const;
    virtual const ColourValue& getFogColour(void) const;
    virtual Real getFogStart(void) const;
    virtual Real getFogEnd(void) const;
    virtual Real getFogDensity(void) const;

    // shadows
    virtual void setShadowTechnique(ShadowTechnique technique);
    virtual ShadowTechnique getShadowTechnique(void) const;
    virtual void setShadowColour(const ColourValue& colour);
    virtual const ColourValue& getShadowColour(void) const;

    // static geometry
		virtual StaticGeometry* createStaticGeometry(const String& name);
		virtual StaticGeometry* getStaticGeometry(const String& name) const;
		virtual bool hasStaticGeometry(const String& name) const;
		virtual void destroyStaticGeometry(StaticGeometry* geom);
		virtual void destroyStaticGeometry(const String& name);
		virtual void destroyAllStaticGeometry(void);

    // instanced geometry
		virtual InstancedGeometry* createInstancedGeometry(const String& name);
		virtual InstancedGeometry* getInstancedGeometry(const String& name) const;
		virtual void destroyInstancedGeometry(InstancedGeometry* geom);
		virtual void destroyInstancedGeometry(const String& name);
		virtual void destroyAllInstancedGeometry(void);

    // billboard chains & ribbon trails
    /*virtual BillboardChain* createBillboardChain(const String& name);
		virtual BillboardChain* createBillboardChain();
    virtual BillboardChain* getBillboardChain(const String& name) const;
		virtual bool hasBillboardChain(const String& name) const;

    virtual void destroyBillboardChain(BillboardChain* obj);
		virtual void destroyBillboardChain(const String& name);
		virtual void destroyAllBillboardChains(void);*/

    virtual RibbonTrail* createRibbonTrail(const String& name);
		virtual RibbonTrail* createRibbonTrail();
    virtual RibbonTrail* getRibbonTrail(const String& name) const;
		virtual bool hasRibbonTrail(const String& name) const;

    virtual void destroyRibbonTrail(RibbonTrail* obj);
		virtual void destroyRibbonTrail(const String& name);
		virtual void destroyAllRibbonTrails(void);

    // billboard sets
    virtual BillboardSet* createBillboardSet(const String& name, unsigned int poolSize = 20);

    virtual BillboardSet* createBillboardSet(unsigned int poolSize = 20);
    virtual BillboardSet* getBillboardSet(const String& name) const;
		virtual bool hasBillboardSet(const String& name) const;
    virtual void destroyBillboardSet(BillboardSet* set);
    virtual void destroyBillboardSet(const String& name);
    virtual void destroyAllBillboardSets(void);
  };


  %nodefaultctor Viewport;
  %nodefaultdtor Viewport;

  class Viewport {
    public:

    void getActualDimensions( int &left, int &top, int &width, int &height ) const;
    Camera* getCamera(void) const;
    void setCamera(Camera* cam);

    Real getLeft(void) const;
    Real getTop(void) const;
    Real getWidth(void) const;
    Real getHeight(void) const;
    int getActualLeft(void) const;
    int getActualTop(void) const;
    int getActualWidth(void) const;
    int getActualHeight(void) const;

    void setBackgroundColour(const ColourValue& colour);
    const ColourValue& getBackgroundColour(void) const;
  };

  class MeshPtr {

  };

  %nodefaultctor MeshManager;
  %nodefaultdtor MeshManager;

  class MeshManager {
    public:

    static MeshManager& getSingleton(void);

    MeshPtr createPlane(
      const String& name, const String& groupName, const Plane& plane,
      Real width, Real height,
      int xsegments = 1, int ysegments = 1,
      bool normals = true, unsigned short numTexCoordSets = 1,
      Real uTile = 1.0f, Real vTile = 1.0f, const Vector3& upVector = Vector3::UNIT_Y);
  };


  %nodefaultctor ResourceGroupManager;
  %nodefaultdtor ResourceGroupManager;

  class ResourceGroupManager {
    public:

    static ResourceGroupManager& getSingleton(void);
		static String DEFAULT_RESOURCE_GROUP_NAME;
    static String INTERNAL_RESOURCE_GROUP_NAME;
		static String AUTODETECT_RESOURCE_GROUP_NAME;
		static size_t RESOURCE_SYSTEM_NUM_REFERENCE_COUNTS;

  };

  %nodefaultctor ManualResourceLoader;
  %nodefaultdtor ManualResourceLoader;

  class ManualResourceLoader {
  };


  %nodefaultctor Resource;
  %nodefaultdtor Resource;

  class Resource {

  };
  typedef Ogre::SharedPtr<Resource> ResourcePtr;

  class ResourceManager {

    virtual void remove(const String& name);
    bool resourceExists(const String& name);

    virtual
    ResourcePtr prepare(
      const String& name,
      const String& group);

    virtual
    ResourcePtr load(
      const String& name,
      const String& group);
  };


  %nodefaultctor CompositorInstance;
  %nodefaultdtor CompositorInstance;

  class CompositorInstance
  {
  };

  %nodefaultctor CompositorLogic;
  %nodefaultdtor CompositorLogic;

  class CompositorLogic
  {
  };


  %nodefaultctor CompositorManager;
  %nodefaultdtor CompositorManager;

  class CompositorManager
  {
    public:

    void initialise(void);

		CompositorInstance *addCompositor(Viewport *vp, const String &compositor, int addPosition=-1);

		void removeCompositor(Viewport *vp, const String &compositor);
		void setCompositorEnabled(Viewport *vp, const String &compositor, bool value);

		void freePooledTextures(bool onlyIfUnreferenced = true);

		void registerCompositorLogic(const String& name, CompositorLogic* logic);

		void unregisterCompositorLogic(const String& name);

		CompositorLogic* getCompositorLogic(const String& name);

		static CompositorManager& getSingleton(void);
		static CompositorManager* getSingletonPtr(void);
  };

}


namespace OgreBites
{
	enum CameraStyle   // enumerator values for different styles of camera movement
	{
		CS_FREELOOK,
		CS_ORBIT,
		CS_MANUAL
	};

	/*=============================================================================
	| Utility class for controlling the camera in samples.
	=============================================================================*/
	class SdkCameraMan
    {
    public:
    SdkCameraMan(Ogre::Camera* cam);

		/*-----------------------------------------------------------------------------
		| Swaps the camera on our camera man for another camera.
		-----------------------------------------------------------------------------*/
		virtual void setCamera(Ogre::Camera* cam);
		virtual Ogre::Camera* getCamera();

		/*-----------------------------------------------------------------------------
		| Sets the target we will revolve around. Only applies for orbit style.
		-----------------------------------------------------------------------------*/
		virtual void setTarget(Ogre::SceneNode* target);
		virtual Ogre::SceneNode* getTarget();

		/*-----------------------------------------------------------------------------
		| Sets the camera's top speed. Only applies for free-look style.
		-----------------------------------------------------------------------------*/
		virtual void setTopSpeed(Ogre::Real topSpeed);
		virtual Ogre::Real getTopSpeed();
		/*-----------------------------------------------------------------------------
		| Sets the movement style of our camera man.
		-----------------------------------------------------------------------------*/
		virtual void setStyle(CameraStyle style);
		virtual CameraStyle getStyle();

		/*-----------------------------------------------------------------------------
		| Manually stops the camera when in free-look mode.
		-----------------------------------------------------------------------------*/
		virtual void manualStop();

    };
}
