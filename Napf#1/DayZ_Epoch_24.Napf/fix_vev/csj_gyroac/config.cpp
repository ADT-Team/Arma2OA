//fix by GROM
#define _ARMA_

class CfgVehicleClasses
{
	class CSJ_Air
	{
		displayName = "CSJ Air";
	};
};
class CfgPatches
{
	class CSJ_GyroAC
	{
		units[] = {"CSJ_GyroP","CSJ_GyroC","CSJ_GyroCover"};
		weapons[] = {};
	};
};
class CfgAmmo
{
	class RocketCore;
	class GyroGrenade: RocketCore
	{
		model = "\ca\Weapons\M67";
		hit = 20;
		indirectHit = 18;
		indirectHitRange = 7;
		soundHit[] = {"Ca\sounds\Weapons\explosions\grenade_new1",15.848933,1,1000};
		soundFly[] = {"Ca\sounds\Weapons\explosions\noise",0.0001,1,20};
		CraterEffects = "GrenadeCrater";
		explosionEffects = "GrenadeExplosion";
		visibleFire = 18;
		audibleFire = 18;
		visibleFireTime = 3;
		explosive = 1;
		cost = 10;
		initTime = 0;
		thrustTime = 0;
		thrust = 0;
		whistleDist = 0;
	};
};
class CfgMagazines
{
	class Default;
	class CA_Magazine: Default{};
	class VehicleMagazine: CA_Magazine{};
	class 3Rnd_GyroGrenade: VehicleMagazine
	{
		scope = 2;
		displayName = "Grenade";
		ammo = "GyroGrenade";
		count = 3;
		initSpeed = 3;
		maxLeadSpeed = 200;
		nameSound = "grenade";
	};
};
class cfgWeapons
{
	class RocketPods;
	class GyroGrenadeLauncher: RocketPods
	{
		scope = 1;
		displayName = "Grenades";
		cursorAim = "\ca\Weapons\Data\clear_empty";
		cursor = "\ca\Weapons\Data\clear_empty";
		autoFire = 0;
		sound[] = {"",1.258925,0.2}; //10.0,1
		magazines[] = {"3Rnd_GyroGrenade"};
		reloadTime = 3;
		magazineReloadTime = 5;
		dispersion = 0;
		minRange = 1;
		minRangeProbab = 0.8;
		midRange = 50;
		midRangeProbab = 0.7;
		maxRange = 150;
		maxRangeProbab = 0.1;
		autoReload = 1;
		canLock = 0;
	};
};
class CfgVehicles
{
	class All{};
	class AllVehicles: All{};
	class Air: AllVehicles
	{
		class ViewPilot;
	};
	class Plane: Air
	{
		class AnimationSources;
	};
	class CSJ_GyroP: Plane
	{
		scope = 2;
		faction = "CIV";
		crew = "Pilot";
		cabinOpening = 0;
		driverAction = "UH60_Pilot";
		vehicleClass = "CSJ_Air";
		model = "\CSJ_GyroAC\CSJ_GyroP";
		displayName = "AutoGyro";
		getInAction = "GetInLow";
		transportSoldier = 0;
		picture = "\z\addons\CSJ_GyroAC\data\gyropic.paa";
		Icon = "\z\addons\CSJ_GyroAC\data\gyroIcon.paa";
		gearRetracting = 0;
		nameSound = "plane";
		mapSize = 8;
		fov = 0.5;
		side = 3;
		soundEngine[] = {"\z\addons\CSJ_GyroAC\camel1.wss",0.039999999,0.34999999,500};
		insideSoundCoef = 1;
		airBrake = 0;
		flaps = 0;
		wheelSteeringSensitivity = 0.25;
		nightVision = 0;
		preferRoads = 0;
		showWeaponCargo = 0;
		camouflage = 8;
		audible = 5;
		driverCanSee = "2+8";
		maxSpeed = 150;
		landingSpeed = 80;
		landingAoa = "rad 2";
		armor = 20;
		ejectSpeed[] = {0,0,0};
		ejectDamageLimit = 0.8;
		cost = 1000;
		formationX = 8;
		formationZ = 8;
		castCargoShadow = 0;
		castCommanderShadow = 0;
		castDriverShadow = 1;
		castGunnerShadow = 0;
		hideWeaponsDriver = 1;
		hideWeaponsCargo = 1;
		threat[] = {0,0,0};
		aileronSensitivity = 0.1;
		elevatorSensitivity = 0.12;
		noseDownCoef = 0;
		brakeDistance = 10;
		dammageHalf[] = {};
		dammageFull[] = {};
		extCameraPosition[] = {0,0,-5};
		class Library
		{
			libTextDesc = "Auto_Gyro (CSJ)";
		};
		class ViewPilot: ViewPilot
		{
			initFov = 1;
			minFov = 0.3;
			maxFov = 1.2;
			initAngleX = 25;
			minAngleX = -65;
			maxAngleX = 80;
			initAngleY = 0;
			minAngleY = -155;
			maxAngleY = 155;
		};
		class AnimationSources: AnimationSources{};
		class Reflectors{};
		weapons[] = {"GyroGrenadeLauncher"};
		magazines[] = {"3Rnd_GyroGrenade"};
		class UserActions
		{
			class rotateLeft
			{
				displayName = "rotate aircraft left";
				position = "osa leve smerovky";
				onlyforplayer = 0;
				radius = 2;
				condition = "(Count (Crew this)==0) and ((getpos this select 2) <1) and (!isengineon this)";
				statement = "this exec ""\z\addons\CSJ_GyroAC\scripts\CSJ_rotateGyroLeft.sqs"" ";
			};
			class rotateRight
			{
				displayName = "rotate aircraft right";
				position = "osa leve smerovky";
				onlyforplayer = 0;
				radius = 2;
				condition = "(Count (Crew this)==0) and ((getpos this select 2) <1) and (!isengineon this)";
				statement = "this exec ""\z\addons\CSJ_GyroAC\scripts\CSJ_rotateGyroRight.sqs"" ";
			};
			class push
			{
				displayName = "push aircraft";
				position = "osa leve smerovky";
				onlyforplayer = 0;
				radius = 2;
				condition = "(Count (Crew this)==0) and ((getpos this select 2) <1) and (!isengineon this)";
				statement = "this exec ""\z\addons\CSJ_GyroAC\scripts\CSJ_moveGyro.sqs"" ";
			};
		};
		class EventHandlers{};
	};
	class CSJ_GyroCover: CSJ_GyroP
	{
		model = "\z\addons\CSJ_GyroAC\CSJ_GyroCover";
		displayName = "AutoGyro enclosed";
		class Library
		{
			libTextDesc = "Auto_Gyro  Enclosed(CSJ)";
		};
	};
	class Helicopter: Air
	{
		class AnimationSources;
		class Turrets;
	};
	class CSJ_GyroC: Helicopter
	{
		scope = 2;
		model = "\z\addons\CSJ_GyroAC\CSJ_GyroC.p3d";
		displayName = "Mozzie";
		mapSize = 8;
		side = 3;
		cabinOpening = 0;
		hiddenSelections[] = {"0","1","2","3","4","5"};
		vehicleClass = "CSJ_Air";
		picture = "\z\addons\CSJ_GyroAC\data\MozPic.paa";
		maxSpeed = 120;
		Icon = "\z\addons\CSJ_GyroAC\data\Cicon.paa";
		nameSound = "chopper";
		faction = "CIV";
		crew = "Pilot";
		accuracy = 0.3;
		armor = 30;
		damageResistance = 0.003;
		cost = 100000;
		mainRotorSpeed = 1;
		backRotorSpeed = 1;
		transportSoldier = 0;
		cargoAction[] = {};
		transportAmmo = 0;
		supplyRadius = 2.5;
		type = "VAir";
		fov = 0.5;
		driverAction = "UH60_Pilot";
		hasGunner = 0;
		class Turrets{};
		insideSoundCoef = 1;
		formationX = 8;
		formationZ = 8;
		threat[] = {0,0,0};
		extCameraPosition[] = {0,0,-5};
		soundGetIn[] = {"",0.1,1};
		soundGetOut[] = {"",0.0,1}; //0.0,1
		soundEngine[] = {"\z\addons\CSJ_GyroAC\UH1_v1.wss",1,0.2,500}; //10.1189,2
		typicalCargo[] = {};
		weapons[] = {"GyroGrenadeLauncher"};
		magazines[] = {"3Rnd_GyroGrenade"};//3Rnd_GyroGrenade
		transportMaxMagazines = 0;
		transportMaxWeapons = 0;
		commanderCanSee = 2+16+32;
		gunnerCanSee = 2+16+32;
		driverCanSee = 2+16+32;
		forceHideDriver = 1;
		castDriverShadow = 1;
		class ViewPilot: ViewPilot
		{
			initFov = 1;
			minFov = 0.3;
			maxFov = 1.2;
			initAngleX = 35;
			minAngleX = -45;
			maxAngleX = 80;
			initAngleY = 0;
			minAngleY = -155;
			maxAngleY = 155;
		};
		class Library
		{
			libTextDesc = "CSJ_Mozzie";
		};
		dammageHalf[] = {};
		dammageFull[] = {};
		class Reflectors{};
		class AnimationSources: AnimationSources{};
		class UserActions{};
		class EventHandlers{};
	};
};
//};
