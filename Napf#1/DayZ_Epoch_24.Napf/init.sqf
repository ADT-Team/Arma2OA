/*
DayZ Server Napf "ADT-68"
ADT-TEAM: http://adt-team.ru/
WebSite ADT-68: http://dayz-adt.ru/
ADT-68 VK: https://vk.com/adt_68
by GROM: http://gromx.ru/
*/

//BTC           = true;

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	24;				//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

//Start Loot
DefaultMagazines = ["ItemBandage","ItemBandage","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","ItemPainkiller","Skin_INS_Soldier_AR_DZ","ItemHeatPack","ItemWaterbottleBoiled","FoodSteakCooked"];
DefaultWeapons = ["ItemFlashlight","Makarov","ItemMap"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";  
DefaultBackpackItems = "";

// DayZ ADT_Napf Config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
// 
MaxVehicleLimit = 400; // Default = 50
MaxDynamicDebris = 500; // Default = 100
MaxMineVeins = 40;      // какахи
MaxAmmoBoxes = 20;      // гробики на дорогах
dayz_MapArea = 18000; // Default = 10000

dayz_minpos = -1000; 
dayz_maxpos = 26000;

dayz_paraSpawn = false; //fix
DZE_SelfTransfuse = true; //ADT blood bag default "true"
DZE_PlotPole = [45,60]; //Default: [30;45]
DZE_BuildingLimit = 4000;

DZE_DeathMsgGlobal = false;
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;

DZE_ForceNameTags = false;
DZE_ForceNameTagsInTrader = true; //Отображать имена игроков в трейде
DZE_HumanityTargetDistance = 5;
DZE_FriendlySaving = false;

//Custom Currency Config
DZE_ConfigTrader = true;

DZE_vehicleAmmo = 1;
DZE_R3F_WEIGHT = true; //Default: true
dayz_maxLocalZombies = 25; // Default = 30
dayz_zedsAttackVehicles = true;			// Default: true
DZE_PlayerZed =	false;	//	Если игрок умер инфицированным, - возраждать в виде зомби. По умолчанию: да.
dayZ_serverName = "ADT-68"; //ADT-68 

deathMessages=1; //fix*&

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 15; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 40; // Default: 0
DynamicVehicleDamageHigh = 90; // Default: 100

DZE_BuildOnRoads = false; // Default: False
//Vector
DZE_noRotate = ["VaultStorageLocked","ItemComboLock","Plastic_Pole_EP1_DZ "]; //Объекты которые запретим вращать. Пр: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true; //true

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "custom\variables.sqf"; //Fix_ADT_Server_v1.5.0.1|	
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "custom\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\mission.sqf";
	//________________LOOT_______________________
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\aero.sqf";   //aero_loot
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\aero2.sqf";   //military_base
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\zamok.sqf";   //zitadell_loot	    
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\Lenz.sqf";   //Lenz
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\Yury.sqf";   //Yury
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\Dalas.sqf";   //Dalas
	//________________LOOT_______________________

	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
[] execVM "scripts\welcome_adt.sqf";
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	
	//Custom Loadouts
	//[] ExecVM "scripts\vip_loot_napf.sqf"; //donators_napf_&*
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	

	
	if (DZE_R3F_WEIGHT) then {
	_void = [] execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";
};
	execVM "hpp\dzgm\init.sqf";
	
	
	//anti Hack_fix_AH
	//[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	[] execVM "scripts\fixes\effects_adt.sqf"; //Effects_ADT
};
//#include "\z\addons\dayz_code\system\REsec.sqf"
//----------------------------***ADT-TEAM-Scripts***----------------------------//

//*#include "\z\addons\dayz_code\system\REsec.sqf"*//

//Start Dynamic Weather

[] execVM "scripts\DynamicWeatherEffects.sqf";

//AI_sector ADT-68 by GROM 13.06.2014
//if (isServer) then {

  // _nil = [] execVM "\z\addons\dayz_server\WAI\AI_ADT\Init_AI_ADT.sqf"; //fix AI_ADT by "GROM"

//};
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

[] execVM "scripts\safez_adt_napf.sqf"; //Safe_Zone_NAPF

[] execVM "service_point\service_point.sqf"; //Refuel_gold

[] execVM "scripts\monitor.sqf"; //Debag_monitor

[] execVM "service_point\service_point.sqf"; //Refuel_gold

[] execVM "scripts\monitor.sqf"; //Debag_monitor

[] execVM "scripts\weedfarm.sqf"; //hemp farms    preview.sqf

[] execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf"; //Lift

[] execVM "scripts\privat\CheckZombieDelete.sqf";  //Delete zombie from bases

["elevator"] execVM "elevator\elevator_init.sqf";

//[] execVM "scripts\newyear_weather_activate.sqf"; //New Year Effects
	

[] spawn {

 while {1 == 1} do
 {
  _vehicle_list = player nearEntities [["LandVehicle","Air","Ship"], 5];  //m12
  {
   if (locked _x) then {
    closeDialog 0;
    hint "DupingFIX"; //msg
   }
  } forEach _vehicle_list;
  uiSleep 0.1;
 };
};


//watermark
_pic = "gui\watermark.paa"; //images
[
'<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',
safeZoneX+0.027,
safeZoneY+safeZoneH-0.1,
99999,
0,
0,
3090
] spawn bis_fnc_dynamicText;

waitUntil {!isNil ("PVDZE_plr_LoginRecord")}; 
if (dayzPlayerLogin2 select 2) then { 
[] execVM "custom\spawn\Spawn.sqf";}