/*
put together for DayZ Epoch
Credits to Shogun338 from Insurrection gaming
modified for separate "gather weed" script
*/
 
private ["_gearmenu","_playerPos","_nearWeed","_weed","_objectID","_objectUID"];
_playerPos = getPosATL player;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_nearWeed = count nearestObjects [_playerPos, ["fiberplant"], 4] > 0;
_weed = nearestObject [player, "fiberplant"];
 
if !(_nearWeed) exitWith {
	cutText [format["Вы должны быть рядом с плантацией растений для того, что бы собрать."], "PLAIN DOWN"];
};
if (_hempqty > 2) exitWith { 
    cutText [format["WARNING: %1, У вас имеется максимальное кол-во сорняков! Вы можете быть арестованы полицией ;)", name player], "PLAIN DOWN"];
};
if (dayz_combat == 1) then { 
    cutText [format["Вы находитесь в бою, подождите."], "PLAIN DOWN"];
} else {
	disableSerialization;
	_gearmenu = FindDisplay 106;
	_gearmenu CloseDisplay 106;
	player playActionNow "Medic";
	r_interrupt = false;
	sleep 6;
	_objectID = _weed getVariable["ObjectID","0"];
	_objectUID = _weed getVariable["ObjectUID","0"];
	deleteVehicle _weed;
	[_objectID,_objectUID] call server_deleteObj;
	_weed setDamage 1;
	player addMagazine "ItemKiloHemp";
	sleep 2;
	cutText [format["Вы собрали конаплю! Курите это дерьмо или продайте ее медиком!"], "PLAIN DOWN"];	
};