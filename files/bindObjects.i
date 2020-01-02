%{
#include "gameObject.h"
#include "unit.h"
#include "commandAI.h"
#include "projectile.h"
#include "inventory.h"
	%}

enum ObjectType
{
	typeDummy,
	typeUnit,
	typeProjectile,
	typeItem,
	projectileDirect,
	projectileBallistic,
	projectileRay,
	projectileMissile,
	typeMover,
	typeBuilding,
	typeBlock,
	typeTree,
	typeVoid,
	typeMax
};
enum DeviceCmd
{	
	dcmdAction,
	dcmdToggle_on,
	dcmdToggle_off,
	dcmdDir_inc,
	dcmdDir_set,
	dcmdTarget_set,
	dcmdTarget_reset,
	dcmdTarget_update,
};

enum b2BodyType
{
	b2_staticBody = 0,
	b2_kinematicBody,
	b2_dynamicBody,
};

/// A body definition holds all the data needed to construct a rigid body.
/// You can safely re-use body definitions. Shapes are added to a body after construction.
struct b2BodyDef
{
	/// The body type: static, kinematic, or dynamic.
	/// Note: if a dynamic body would have zero mass, the mass is set to one.
	b2BodyType type;

	/// The world position of the body. Avoid creating bodies at the origin
	/// since this can lead to many overlapping shapes.
	b2Vec2 position;

	/// The world angle of the body in radians.
	float32 angle;

	/// The linear velocity of the body's origin in world co-ordinates.
	b2Vec2 linearVelocity;

	/// The angular velocity of the body.
	float32 angularVelocity;

	/// Linear damping is use to reduce the linear velocity. The damping parameter
	/// can be larger than 1.0f but the damping effect becomes sensitive to the
	/// time step when the damping parameter is large.
	float32 linearDamping;

	/// Angular damping is use to reduce the angular velocity. The damping parameter
	/// can be larger than 1.0f but the damping effect becomes sensitive to the
	/// time step when the damping parameter is large.
	float32 angularDamping;

	/// Set this flag to false if this body should never fall asleep. Note that
	/// this increases CPU usage.
	bool allowSleep;

	/// Is this body initially awake or sleeping?
	bool awake;

	/// Should this body be prevented from rotating? Useful for characters.
	bool fixedRotation;

	/// Is this a fast moving body that should be prevented from tunneling through
	/// other moving bodies? Note that all bodies are prevented from tunneling through
	/// kinematic and static bodies. This setting is only considered on dynamic bodies.
	/// @warning You should use this flag sparingly since it increases processing time.
	bool bullet;

	/// Does this body start out active?
	bool active;
};
typedef float Damage;
/*
struct Damage
{
float Value[damageTypesMax];
Unit *Source;
Damage():Source(0){Value[0]=Value[1]=0;}
Damage(float a):Source(0){Value[0]=a;Value[1]=0;}
Damage(float a,float b):Source(0){Value[0]=a;Value[1]=b;}
Damage(float a,float b,Unit *Src):Source(Src){Value[0]=a;Value[1]=b;}
float &operator[](int i){ return Value[i];}
};
*/
/// Polygon description for box2d body. Only maximum of 8 vertices is permitted
struct PolyDesc
{
	std::vector<vec2f> points;
	PolyDesc();
	~PolyDesc();
	void addPoint(float x,float y);
	void addPoint(const vec2f & point);
};

/// description for box2d body
class BodyDesc: public b2BodyDef
{
public:
	bool frozen;

	BodyDesc(ObjectManager * manager);  
	BodyDesc(const BodyDesc & desc);
	~BodyDesc();  
	b2Body * create();

	b2FixtureDef & addBox(float width,float height,float mass);
	b2FixtureDef & addSphere(float size,float mass);
	b2FixtureDef & addPolygon(const PolyDesc &desc,float mass);
protected:
	b2FixtureDef & addFixture();
};

struct GameObject: public LuaObject
{
	virtual ~GameObject();
	virtual Pose getPose();
	virtual vec2f getPosition() const;
	virtual vec2f getDirection() const;
	virtual void setPosition(const vec2f &pos);
	virtual void setDirection(float dir[2]);
	ObjectType getType()const;
	void setPlayer(int player);
	GameObjectDef * getDefinition();

	float getSphereSize() const;

	void attachBody(b2Body * s);
	void detachBody();
	size_t id()const;
	float getHealth() const;
	GameObject * getNext();
};

%extend GameObject 
{
	int player;	

	vec2f position;
	vec2f direction;

	void setPosition(float x,float y)
	{
		$self->setPosition(vec2f(x,y));
	}
	void setDirection(float x,float y)
	{
		$self->setDirection(vec2f(x,y));
	}
};

%{
	/// position property binding
	vec2f * GameObject_position_get(GameObject * object)
	{
		return new vec2f(object->getPosition());
	}
	void GameObject_position_set(GameObject * object, vec2f * pos)
	{
		object->setPosition(*pos);
	}
	/// direction property binding
	vec2f * GameObject_direction_get(GameObject * object)
	{
		return new vec2f(object->getDirection());
	}
	void GameObject_direction_set(GameObject * object, vec2f * pos)
	{
		object->setDirection(*pos);
	}
	/// player property binding
	int GameObject_player_get(GameObject * object)
	{
		return object->getPlayer();
	}
	void GameObject_player_set(GameObject * object, int player)
	{
		object->setPlayer(player);
	}
	%}

struct GameObjectDef: public LuaObject
{
	std::string name;
	FxEffect *fxIdle;	
	FxEffect *fxDie;
	BodyDesc body;
	GameObject * create(IO::StreamIn *context);
	GameObjectDef * clone()const;
	int getPopulation()const;
	int init();
	size_t id() const;
};

struct ProjectileDef: public GameObjectDef
{
	int projectileType;
	float velocity;
	float damage;
	float livingTime;
	float turning;

	PerceptionDef * perception;
	FxEffect * impact;	
	ProjectileDef(ObjectManager *manager);	
	ProjectileDef * copy();
};

struct Projectile: public GameObject
{
	int id();
	ProjectileDef & localDef();
};

struct ItemDef: public GameObjectDef
{
	//const char* itemType;	
	int maxStack;
	int maxHealth;
	float size;

	ItemDef(ObjectManager * m);
	ItemDef * copy();
};

struct Item: public GameObject
{
	enum Place
	{
		placeInventory,
		placeLand,
	}state;	
	int stack;			
	int id();
	Item& localDef();
};

class Inventory
{
public:
	Unit *owner;
	bool drawInventory;
	bool destroyItems;	
public:
	virtual void addItem(Item *item);
	virtual void removeItem(Item *item);
	virtual bool hasItem(Item *item);
};

struct MountDef
{
	//Pose editorPose;				// pose in fitting editor
	//int editorWidth,editorHeight;	// size in fitting editor

	Pose pose;
	DeviceDef *device;
	//bool bExtern;
	//bool locked;
	MountDef();
	~MountDef();
};

/*
class AssemblyDef
{
public:
std::vector<MountDef> mounts;
virtual int addMount(const Pose & pose,bool bExtern);
virtual int addDevice(DeviceDef *def,int mount);
virtual void clearMounts();
};
*/

class UnitDef: public GameObjectDef//, public AssemblyDef
{
public:
	float health;

	FxEffect* fxMove;	

	UnitDef(ObjectManager * manager);
	UnitDef * copy();

	int addMount(const MountDef & def);
	void clearMounts();
};

struct Controller
{
	Controller(Unit *unit);
	~Controller();
	int onControl(int key,bool down,float x,float y,float wheel);

	void clear();
	void cmdStand(float distance);
	void cmdMoveTo(float x,float y,float distance);
	void cmdFollow(Unit * target);
	void cmdPatrol(float x,float y,float distance);
	void cmdAttack(GameObject* target);	
	void cmdGuard(float x,float y,float distance);
};

Controller * createCommandAI(Unit * u);
Controller * createPerceptionAI(Unit * u);
/*
class Assembly
{
public:
void initDevices();	/// rebuild all devices
Device * getDevice(int mount);
int getDeviceCount()const;	
};*/

class Unit: public GameObject//, public Assembly
{
public:
	int player;
	Controller *controller;
	/// ai control methods
	void setController(Controller * controller);
	Controller * getController();
	void enableAI(bool flag);	
	UnitDef & localDef();

	void cmdStop();	// clear all orders
	void cmdStand(float distance);
	void cmdMoveTo(float x,float y,float distance);
	void cmdFollow(Unit * target);
	void cmdPatrol(float x,float y,float distance);
	void cmdAttack(GameObject* target);	
	void cmdGuard(float x,float y,float distance);
};

typedef SharedPtr<GameObject> GameObjectPtr;

struct ObjectManager
{	
	FxManager * getFxManager();
	GameObject * getObject(ObjID id);

	void removeAllObjects();	/// remove all objects from the map
	void setVisionAll();
	void setVisionPlayer(int player);
	void setVisionObject(GameObject * object);
};

%extend ObjectManager
{
	GameObject * objectsBegin()
	{
		return $self->objectsHead;
	}
	GameObject * objectsEnd()
	{
		return NULL;
	}
}

bool equal(const GameObject *a,const GameObject *b);
Unit *toUnit(GameObject *object);

// completely remove object
void DestroyObject(GameObject * object);