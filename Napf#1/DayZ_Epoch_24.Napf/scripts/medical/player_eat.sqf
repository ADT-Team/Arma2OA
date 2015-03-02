private ["_onLadder","_itemorignal","_hasfooditem","_rawfood","_hasoutput","_config","_text","_regen","_dis","_sfx","_itemtodrop","_nearByPile","_item","_display","_rawexceptions","_badfood","_invehicle"];
disableserialization;
call gear_ui_init;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if(dayz_hunger < 100) exitWith {cutText ["Я не голоден, поем позже...","PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText ["я занят...", "PLAIN DOWN"]; };
if (!_hasfooditem) exitWith {cutText [format[(localize "str_player_31"),_text,"consume"] , "PLAIN DOWN"]};
DZE_ActionInProgress = true;

_itemorignal = _this;
_hasfooditem = _itemorignal in magazines player;

_rawfood = _itemorignal in meatraw;
_rawexceptions = _itemorignal in exceptionsraw;
//_cookedfood = _itemorignal in meatcooked;
_hasoutput = _itemorignal in food_with_output;

_badfood = _itemorignal in badfood;

_config =   configFile >> "CfgMagazines" >> _itemorignal;
_text = 	getText (_config >> "displayName");
_regen = 	getNumber (_config >> "bloodRegen");

_invehicle = false;
closeDialog 1;

if (vehicle player != player) then {
_invehicle = true;
};

if !(_invehicle) then {
player playMove "AinvPknlMstpSlayWrflDnon_healed";
};

[player,"eat",0,false,6] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isDrink = ["AinvPknlMstpSlayWrflDnon_healed", _animState] call fnc_inString;
        if (_isDrink) then {
            _started = true;
        };
        if (_started and !_isDrink) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
		if (_invehicle) then {
		sleep 6;
		r_doLoop = false;
		_finished = true;
		};
        sleep 0.1;
    };
    r_doLoop = false;
 

 if (_finished) then {
 player removeMagazine _itemorignal;

if (_hasoutput and !_invehicle) then {
    // Selecting output
    _itemtodrop = food_output select (food_with_output find _itemorignal);
    _nearByPile= nearestObjects [(getposATL player), ["WeaponHolder","WeaponHolderBase"],2];
    if (count _nearByPile ==0) then { 
        _iPos = getPosATL player;
		_item = createVehicle ["WeaponHolder", _iPos, [], 0, "CAN_COLLIDE"];
		_item setposATL _iPos;
    } else {
        _item = _nearByPile select 0;
    };
    _item addMagazineCargoGlobal [_itemtodrop,1];
} else {
//trash in a car
};

if (_rawfood and !_rawexceptions and (random 15 < 1)) then {
	r_player_infected = true;
	player setVariable["USEC_infected",true,true];
};

if (_badfood and (random 2 < 1)) then {
	r_player_infected = true;
	player setVariable["USEC_infected",true,true];
};

_rBlood = random 500;
r_player_blood = r_player_blood + _regen + _rBlood;
if (r_player_blood > r_player_bloodTotal) then {
	r_player_blood = r_player_bloodTotal;
};

dayz_hunger = 0;
player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
player setVariable["USEC_BloodQty",r_player_blood,true];
player setVariable["medForceUpdate",true];
//["PVDZE_plr_Save",[player,[],true]] call callRpcProcedure;
PVDZE_plr_Save = [player,[],true,true];
publicVariableServer "PVDZE_plr_Save";

//Ensure Control is visible
_display = uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1301) ctrlShow true;
//
if (r_player_blood / r_player_bloodTotal >= 0.2) then {
	(_display displayCtrl 1300) ctrlShow true;
};
//
cutText [format[(localize  "str_player_consumed"),_text], "PLAIN DOWN"];
DZE_ActionInProgress = false;

} else {
	r_interrupt = false;
	DZE_ActionInProgress = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["Я еще не доел!", "PLAIN DOWN"];
	};
	
};