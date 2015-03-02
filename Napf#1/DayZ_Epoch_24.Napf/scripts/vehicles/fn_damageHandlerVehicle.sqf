scriptName "Functions\misc\fn_damageHandler.sqf";
/***********************************************************
	PROCESS DAMAGE TO A UNIT
	- Function
	- [unit, selectionName, damage, source, projectile] call fnc_usec_damageHandler;
************************************************************/
private ["_unit","_hit","_damage","_total"];
_unit = _this select 0;
_hit = _this select 1;
_damage = _this select 2;
//_source = _this select 3;
//_ammo = _this select 4;
_total = _damage;
_state = true;

//***Zupa Config ****//

_godmodeVechilesEverywhere = false; // Godmode on all locked vehicles
_onlyLockedVehicles = false; //Plotarea: Godmode for Only locked vehicles (true) or locked and unlocked(false)
_onlyVehicleWithoutGear = false; // Only godmode on vehicles that hold no gear.
_safeZoneGodVehicle = true; // Godmode vehicles in safezones. (or specific zone's)

// donator plotpole only works with PLOT FOR LIFE, set FALSE if you dont have it.
_donatorsPlots = false; // True = only godmode vehicles for donaters in the list, False = godmode for every guy.
_plotDonators = ["76561198101253426","505"]; // PUID's of poeple who donated for plotpole

// Chernarus safezone area's - change these to other coordinates for other maps. ( You can also add specific locations on the map.
_safezones = [ 
[[8249.09,15482.8],500,"Trade1"],
	[[15520.4,13226.0],300,"Trade2"],
	[[12405.5,5064.79],300,"Trade3"],
	[[15128.2,16421.6],150,"Trade4"],
	[[10394.1,8269.807],150,"Trade5"],
	[[5151.65,4855.2],150,"Trade6"],
	//[[8842.6816,4783.3745],150,"Trade7"],//Ashot
	//[[14414.688,2860.0845],150,"Trade8"],//Stepan
	[[9650.042, 0, 1130.0769],150,"Private1"], //SADAT
	[[4630.8467, 0, 5806.3262],100,"Private3"], //IVAN
	[[11711.057, 0, 13287.964],100,"Private4"], // Yury
	[[18726.24, 0, 9412.8242],150,"Private5"], //DALAS
	[[6582.1631, 0, 1981.2272],150,"Private6"], //A3a3a
	[[846.85547, 0, 6934.9829],100,"Private7"], //Dima
	[[9956.9453, 0 , 9429.804],150,"Private8"] //HITMAN
];

//***END Config ****//


systemChat "checks";
if((locked _unit && _godmodeVechilesEverywhere  && (count (crew _unit)) < 1))then{_state = false;
};

if(_state)then{
if(_safeZoneGodVehicle )then{
{if ((_unit distance (_x select 0)) <  (_x select 1)) then {_state = false;

};} forEach _safezones;
};
};


if(_state)then{
_gearCount = 0;
if(_onlyVehicleWithoutGear)then{
//_weaps = count(getWeaponCargo _unit);
//_mags = count(getMagazineCargo _unit);
//_backs = count(getBackpackCargo _unit);
//_gearCount = _gearCount + _weaps + _mags + _backs;
};
_plots = nearestObjects [_unit, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];	
if((count(_plots) > 0))then{		
	_thePlot = _plots select 0;
	_plotOwner = _thePlot getVariable ["ownerPUID",0];
if ( (_gearCount == 0) &&(locked _unit || !(_onlyLockedVehicles) ) && (count (crew _unit)) < 1 && (  !(_donatorsPlots) || (_plotOwner in _plotDonators))) then {_state = false;

};
};
};



//diag_log ("DAMAGE VEH: " + typeof(_unit) + " / " + str(_hit) + " / " + str(_damage) + " / " + str(getDammage _unit));

if (local _unit && _state) then {
	_total = [_unit,_hit,_damage] call object_setHitServer;
};
_total