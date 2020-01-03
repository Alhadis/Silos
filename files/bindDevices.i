%{
#include "gameObject.h"
#include "device.h"
#include "moverCharacter.h"
#include "moverVehicle.h"
#include "weapon.h"
#include "weaponTurret.h"
#include "perception.h"
#include "shields.h"
#include "thruster.h"
%}

class LuaObject
{
public:
	int lua;
};

struct InvokerContainer
{
	int invokerParam(int port,int kLeft,int kRight);
	int invokerTarget(int port,int kSet,int kUpdate,int kClear);
	int invokerAction(int port,int action);
	void clean();
};

struct DeviceDef: public InvokerContainer, public LuaObject
{
	std::string name;
	Device * create();
};

struct Device : public LuaObject
{
	FxPointer fxIdle;	
	virtual void update(float dt);

	DeviceDef * getDefinition();
};

class PerceptionDef: public DeviceDef
{
public:	
	float distance;		// view distance
	float fov;			// field of view in degrees

	PerceptionDef(ObjectManager &manager);
};

struct MoverDef: public DeviceDef
{
/// pathfinder data
	int adjacency;
	bool bounds;
	bool smooth;	
	bool heuristic;
};

struct Mover: public Device
{
	enum State
	{
		Idle,
		Moving
	};
	virtual void stop();
	virtual State getState() const;

	void clearDriver();
};

struct MoverCharacterDef: public MoverDef
{		
	float speedLinear;
	float speedAngular;
	bool kinematic;
	MoverCharacterDef(ObjectManager & def);
};


struct MoverVehicleDef: public MoverDef
{
	vec2f maxVelocity;
	bool kinematic;			
	bool moveBack;			
	bool staticTurn;		
	vec2f acceleration;	
	vec2f brakeForce;	
	MoverVehicleDef(ObjectManager &manager);
};

struct MoverVehicle: public Mover
{
	//MoverVehicleDef *definition;
	//MoverVehicle(MoverVehicleDef *definition);
	void stop();
	State getState() const;
};

struct ThrusterDef : public DeviceDef
{
	float force;
	ThrusterDef(ObjectManager & manager);
};

struct ThrusterControlDef : public MoverDef
{
	ThrusterControlDef(ObjectManager & manager);
};

struct WeaponData
{
	float timeShootDelay;	// çàäåðæêà ìåæäó âûñòðåëàìè
	float timeShootDuration;// äëèòåëüíîñòü âûñòðåëà, äëÿ ëó÷åâûõ îðóæèé
	float timeReload;		// âðåìÿ ïåðåçàðÿäêè îðóæèÿ
	float muzzleOffset;		// îòêóäà ñîçäà¸òñÿ ñíàðÿä
	int maxAmmo;			
	float maxRange;			// max range
	float spread;			// projectile spread, degrees
	int barrels;			
	float barrelDistance;	// distance between barrels
	int animations;			// number of animations	
	int burstSize;			// êîëè÷åñòâî ñíàðÿäîâ â îäíîì çàëïå
	float burstDelay;		// çàäåðæêà ìåæäó âûñòðåëàìè â çàëïå
};

struct WeaponDef: public DeviceDef
{
	WeaponData weaponData;
	FxEffect * fxShoot;	
	ProjectileDef * projectile;	
	WeaponDef(ObjectManager & manager);
};

struct Weapon: public Device
{	
	WeaponData weaponData;
	float time;				// òåêóùèé ñ÷¸ò÷èê	
	int ammo;
	bool fire;			
	FxEffect * fxShoot;		
	//Weapon(ObjectManager *manager);
};

struct WeaponTurretDef: public WeaponDef
{		
	float velocity;
	float dimensions;
	WeaponTurretDef(ObjectManager& manager);
};

struct WeaponTurret: public Weapon
{
	//WeaponTurretDef *definition;
	WeaponTurret(WeaponTurretDef *def);	
	virtual float getCurrentAngle() const;
	virtual float getAngleTo(const vec2f &v) const;
	bool canReach(const vec2f &v) const;
	bool fullTurn()const;
};

class TargetingSystemDef : public DeviceDef
{
public:
	TargetingSystemDef(ObjectManager &m);
};

class ForceFieldDef : public DeviceDef
{
public:
	ForceFieldDef(ObjectManager & manager);
	FxEffect* impact;	/// when someone hits
	bool hitProjectiles;
	bool hitObjects;
	bool reflectBeams;
	float amount;
	float integrity;
	float energyConsumption;
	float size;			/// dome radius
};

class ForceField : public Device
{
public:
	//GameSolidObject dome;	/// solid sphere for shield dome
	ForceFieldDef * definition;
	ForceField(ForceFieldDef *def);
	void enableField();
	void update(float dt);
	bool enabled;
	bool recharge;
};
