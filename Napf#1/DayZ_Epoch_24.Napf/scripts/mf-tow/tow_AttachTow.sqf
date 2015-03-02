/**
 * mf-tow/tow_AttachTow.sqf
 * The action for attaching the tow to another vehicle. 
 *
 * Created by Matt Fairbrass (matt_d_rat)
 * Version: 1.1.2
 * MIT Licence
 **/

private ["_vehicle","_started","_finished","_animState","_isMedic","_abort","_vehicleNameText","_towTruckNameText","_findNearestVehicles","_findNearestVehicle","_IsNearVehicle","_towTruck","_towableVehicles","_towableVehiclesTotal","_vehicleOffsetY","_towTruckOffsetY","_offsetZ","_hasToolbox"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_96") , "PLAIN DOWN"] };
DZE_ActionInProgress = true;

player removeAction s_player_towing;
s_player_towing = 1;

// Tow Truck
_towTruck = _this select 3;
_towableVehicles = [_towTruck] call MF_Tow_Towable_Array;
_towableVehiclesTotal = count (_towableVehicles);
_towTruckNameText = [_towTruck] call MF_Tow_Get_Vehicle_Name;

// Get all nearby vehicles that can be towed by the towTruck within the minimum tow distance
_findNearestVehicles = nearestObjects [_towTruck, _towableVehicles, MF_Tow_Distance];
_findNearestVehicle = [];
{
	if (alive _x && _towTruck != _x) then {
		_findNearestVehicle set [(count _findNearestVehicle),_x];
	};
} foreach _findNearestVehicles;
		
_IsNearVehicle = count (_findNearestVehicle);

if(_IsNearVehicle > 0) then {
	// select the nearest one
	_vehicle = _findNearestVehicle select 0;
	_vehicleNameText = [_vehicle] call MF_Tow_Get_Vehicle_Name;
	_hasToolbox = "ItemToolbox" in (items player);
	
	// Check the player has a toolbox
	if(!_hasToolbox) exitWith {
		cutText ["Нельзя прицепить без инструментов.", "PLAIN DOWN"];
	};
	
	// Check if the vehicle we want to tow is locked
	if((_vehicle getVariable ["MF_Tow_Cannot_Tow", false])) exitWith {
		cutText [format["Нельзя буксировать %1,так как техника закрыта.", _vehicleNameText], "PLAIN DOWN"];
	};
	
	// Check that the vehicle we want to tow is not already being towed by something else.
	if((_vehicle getVariable ["MFTowInTow", false])) exitWith {
		cutText [format["Нельзя буксировать %1,так как эта техника уже буксируется!.", _vehicleNameText], "PLAIN DOWN"];
	};
	
	// Check that the vehicle we want to tow is not already towing something else
	if(!MF_Tow_Multi_Towing && (_vehicle getVariable ["MFTowIsTowing", false])) exitWith {
		cutText [format["Нельзя буксировать %1,так как эта техника буксирует другую!", _vehicleNameText], "PLAIN DOWN"];
	};
	
	// Check if the vehicle has anyone in it
	if ((count (crew _vehicle)) != 0) exitWith {
		cutText [format["Нельзя буксировать %1,так как там сидят люди!", _vehicleNameText], "PLAIN DOWN"];
	};
	
	_finished = false;
	
	[_towTruck] call MF_Tow_Animate_Player_Tow_Action;
	
	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;

	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		
		// Check if anyone enters the vehicle while we are attaching the tow and stop the action
		if ((count (crew _vehicle)) != 0) then {
			cutText [format["Буксировка %1 прекращена,игрок сел в технику.", _vehicleNameText], "PLAIN DOWN"];
			r_interrupt = true;
		};
		
		if (r_interrupt) then {
			detach player;
			r_doLoop = false;
		};
		
		sleep 0.1;
	};
	r_doLoop = false;

	if(!_finished) then {
		r_interrupt = false;
			
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		_abort = true;
	};

	if (_finished) then {
		if(((vectorUp _vehicle) select 2) > 0.5) then {
			if( _towableVehiclesTotal > 0 ) then {
				_towTruckOffsetY = 0.8;
				_vehicleOffsetY = 0.8;
				_offsetZ = 0.1;
				
				// Calculate the offset positions depending on the kind of tow truck				
				switch(true) do {
					case (_towTruck isKindOf "ArmoredSUV_Base_PMC");
					case (_towTruck isKindOf "SUV_Base_EP1") : {
						_towTruckOffsetY = 0.9;
					};
					case (_towTruck isKindOf "UAZ_Base" && !(_vehicle isKindOf "UAZ_Base")) : {
						_offsetZ = 1.8;
					};
				};
				
				// Calculate the offset positions depending on the kind of vehicle
				switch(true) do {
					case (_vehicle isKindOf "Truck" && !(_towTruck isKindOf "Truck")) : {
						_vehicleOffsetY = 0.9;
					};
					case (_vehicle isKindOf "UAZ_Base" && !(_towTruck isKindOf "UAZ_Base")) : {
						_offsetZ = -1.8;
					};
				};
					
				// Attach the vehicle to the tow truck
				_vehicle attachTo [ _towTruck,
					[
						0,
						(boundingBox _towTruck select 0 select 1) * _towTruckOffsetY + (boundingBox _vehicle select 0 select 1) * _vehicleOffsetY,
						(boundingBox _towTruck select 0 select 2) - (boundingBox _vehicle select 0 select 2) + _offsetZ
					]
				];
				
				detach player;
				_vehicle lock true; // Disable entering the vehicle while it is in tow.
				
				_vehicle setVariable ["MFTowInTow", true, true];
				_towTruck setVariable ["MFTowIsTowing", true, true];
				_towTruck setVariable ["MFTowVehicleInTow", _vehicle, true];
				
				cutText [format["%1 прицеплено к %2.", _vehicleNameText, _towTruckNameText], "PLAIN DOWN"];
			};	
		} else {
			cutText [format["Ошибка прицепа %1 к %2.", _vehicleNameText, _towTruckNameText], "PLAIN DOWN"];
		};
	};
} else {
	cutText [format["Нет техники поблизу.", MF_Tow_Distance], "PLAIN DOWN"];
};
DZE_ActionInProgress = false;
s_player_towing = -1;