
private ["_isNear"];

_isNear = {inflamed _x} count (getPosATL player nearObjects 3);
if(_isNear == 0) exitWith  {cutText [format["Нужен огонь в пределах 3-х метров."], "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"]};
if (dayz_combat == 1) exitwith { cutText [format["В бою нельзя крафтить!"], "PLAIN DOWN"]};

if !("AKS_GOLD" in weapons player) exitWith {cutText [format["Нужен золотой калаш"], "PLAIN DOWN"]};
if !("ItemToolbox" in weapons player) exitWith {cutText [format["Нужны инструменты"], "PLAIN DOWN"]};
if !("ItemCrowbar" in weapons player) exitWith {cutText [format["Нужен ломик"], "PLAIN DOWN"]};
if !("TrashTinCan" in magazines player) exitWith {cutText [format["Нужна консервная банка"], "PLAIN DOWN"]};

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

		player removeWeapon "AKS_GOLD";
		player playActionNow "Medic";
		[player,"repair",0,false,10] call dayz_zombieSpeak;
	    [player,10,true,(getPosATL player)] spawn player_alertZombies;
		sleep 7;
		player addmagazine "ItemGoldBar10oz";
		titleText ["Переплавил АКС... эх жалко...","PLAIN DOWN"];
		
DZE_ActionInProgress = false;
