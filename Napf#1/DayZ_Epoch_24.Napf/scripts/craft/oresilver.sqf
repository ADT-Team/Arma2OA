

private ["_finished","_finishedTime","_animState","_ore","_isNear","_started","_objCraft"];

_objCraft = 1;

while {_objCraft > 0} do {
_isNear = {inflamed _x} count (getPosATL player nearObjects 3);
if !("PartOreSilver" in magazines player) exitWith {cutText [format["Нужно 5 серебренной руды"], "PLAIN DOWN"]};
if (dayz_combat == 1) exitwith { cutText [format["В бою нельзя крафтить!"], "PLAIN DOWN"]};
if(_isNear == 0) exitWith  {cutText [format["Нужен огонь в пределах 3-х метров"], "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"]};
if !("ItemToolbox" in items player) exitWith {cutText [format["Необходимы Инструменты"], "PLAIN DOWN"]};
if !(("ItemSledge" in items player) or ("MeleeSledge" in weapons player)) exitWith {cutText [format["Необходима Кувалда"], "PLAIN DOWN"]};
if !("TrashTinCan" in magazines player) exitWith {cutText [format["Нужна консервная банка"], "PLAIN DOWN"]};
if !( ("ItemWaterbottle" in magazines player) or ("ItemWaterbottleBoiled" in magazines player) or ("ItemWaterbottle1oz" in magazines player) or ("ItemWaterbottle2oz" in magazines player) or ("ItemWaterbottle3oz" in magazines player) or ("ItemWaterbottle4oz" in magazines player) or ("ItemWaterbottle5oz" in magazines player) or ("ItemWaterbottle6oz" in magazines player) or ("ItemWaterbottle7oz" in magazines player) or ("ItemWaterbottle8oz" in magazines player) or ("ItemWaterbottle9oz" in magazines player)) exitWith {cutText [format["Необходима Фляжка с водой"], "PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

[player,"repair",0,false,10] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

player playActionNow "Medic";

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isCraft = ["Medic", _animState] call fnc_inString;
        if (_isCraft) then {
            _started = true;
        };
        if (_started and !_isCraft) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
		if (vehicle player != player) exitWith {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"];DZE_ActionInProgress = false;};
        sleep 0.1;
    };
    r_doLoop = false;

if (_finished) then {	
	//check agen
	if !( ("ItemWaterbottle" in magazines player) or ("ItemWaterbottleBoiled" in magazines player) or ("ItemWaterbottle1oz" in magazines player) or ("ItemWaterbottle2oz" in magazines player) or ("ItemWaterbottle3oz" in magazines player) or ("ItemWaterbottle4oz" in magazines player) or ("ItemWaterbottle5oz" in magazines player) or ("ItemWaterbottle6oz" in magazines player) or ("ItemWaterbottle7oz" in magazines player) or ("ItemWaterbottle8oz" in magazines player) or ("ItemWaterbottle9oz" in magazines player)) exitWith {cutText [format["Необходима Фляжка с водой"], "PLAIN DOWN"]; DZE_ActionInProgress = false;};
	if ([["PartOreSilver", 5]] call player_checkAndRemoveItems) then {
	
	//Bed Waterbottle del
		
	if ("ItemWaterbottle2oz" in magazines player) then {player removeMagazine "ItemWaterbottle2oz"; player addMagazine "ItemWaterbottle1oz";};
	if ("ItemWaterbottle3oz" in magazines player) then {player removeMagazine "ItemWaterbottle3oz"; player addMagazine "ItemWaterbottle2oz";};
	if ("ItemWaterbottle4oz" in magazines player) then {player removeMagazine "ItemWaterbottle4oz"; player addMagazine "ItemWaterbottle3oz";};
	if ("ItemWaterbottle5oz" in magazines player) then {player removeMagazine "ItemWaterbottle5oz"; player addMagazine "ItemWaterbottle4oz";};
	if ("ItemWaterbottle6oz" in magazines player) then {player removeMagazine "ItemWaterbottle6oz"; player addMagazine "ItemWaterbottle5oz";};
	if ("ItemWaterbottle7oz" in magazines player) then {player removeMagazine "ItemWaterbottle7oz"; player addMagazine "ItemWaterbottle6oz";};
	if ("ItemWaterbottle8oz" in magazines player) then {player removeMagazine "ItemWaterbottle8oz"; player addMagazine "ItemWaterbottle7oz";};
	if ("ItemWaterbottle9oz" in magazines player) then {player removeMagazine "ItemWaterbottle9oz"; player addMagazine "ItemWaterbottle8oz";};
	if ("ItemWaterbottleBoiled" in magazines player) then {player removeMagazine "ItemWaterbottleBoiled"; player addMagazine "ItemWaterbottle9oz";};
	if ("ItemWaterbottle1oz" in magazines player) then {player removeMagazine "ItemWaterbottle1oz"; player addMagazine "ItemWaterbottleUnfilled";};
	if ("ItemWaterbottle" in magazines player) then {player removeMagazine "ItemWaterbottle"; player addMagazine "ItemWaterbottle9oz";};
	
	//give
	player addMagazine "ItemSilverBar10oz";
	
	_objCraft = 1;
	DZE_ActionInProgress = false;
	} else {cutText [format["Нужно 5 серебренной руды"], "PLAIN DOWN"];_objCraft = 0; DZE_ActionInProgress = false;};
	} else {
		DZE_ActionInProgress = false;
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		
		cutText ["\n\n Крафт отменен", "PLAIN DOWN"];
		_objCraft = 0;
	};

sleep 3;
};