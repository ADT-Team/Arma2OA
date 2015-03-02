private ["_megastrong","_hndl","_drunkenness","_onLadder","_itemorignal","_hasdrinkitem","_hasoutput","_config","_text","_sfx","_dis","_itemtodrop","_nearByPile","_item","_display","_invehicle","_started","_finished","_isDrink","_rBlood","_iPos","_myDrink"];
disableserialization;
call gear_ui_init;
_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if (!_hasdrinkitem) exitWith {cutText [format[(localize "str_player_31"),_text,"drink"] , "PLAIN DOWN"]};
if(dayz_thirst < 100) exitWith {cutText ["Я не хочу пить сейчас...","PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText ["я занят...", "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_itemorignal = _this;
_hasdrinkitem = _itemorignal in magazines player;
_hasoutput = _itemorignal in drink_with_output;
_invehicle = false;
_drunkenness = false;
_megastrong = false;


_config = configFile >> "CfgMagazines" >> _itemorignal;
_text = getText (_config >> "displayName");

//getting type of sfx (now just drink od soda open and drink)
_sfx =  getText (_config >> "sfx");
closeDialog 1;

if (vehicle player != player) then {
	_invehicle = true;
};

if !(_invehicle) then {
player playMove "AinvPknlMstpSlayWrflDnon_healed";
};

[player,_sfx,0,false,7] call dayz_zombieSpeak;
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
//action
player removeMagazine _itemorignal;
//drink and heal
if (["ItemWaterbottle",_itemorignal] call fnc_inString) then {
    //low alert and sound radius
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
    player addMagazine "ItemWaterbottleUnfilled";
	_rBlood = random 200;
	r_player_blood = r_player_blood + 200 + _rBlood;
	
};
if (["ItemSoda",_itemorignal] call fnc_inString) then {
    //higher alert and sound radius
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	_rBlood = random 200;
	r_player_blood = r_player_blood + 200 + _rBlood;
};  

if (["ItemSodaRabbit",_itemorignal] call fnc_inString) then {
_drunkenness = true;
};

if (["ItemSodaRbull",_itemorignal] call fnc_inString) then {
_megastrong = true;
};

if (["ItemSodaR",_itemorignal] call fnc_inString) then {
	_rBlood = random 300;
	r_player_blood = r_player_blood + 500 + _rBlood;
};  

if (["ItemSodaO",_itemorignal] call fnc_inString) then {
	_rBlood = random 300;
	r_player_blood = r_player_blood + 500 + _rBlood;
};  

if (["ItemSodaM",_itemorignal] call fnc_inString) then {
	_rBlood = random 300;
	r_player_blood = r_player_blood + 500 + _rBlood;
};  



//drop trash
if (_hasoutput and !_invehicle) then {
    // Selecting output
    _itemtodrop = drink_output select (drink_with_output find _itemorignal);
    _nearByPile= nearestObjects [(getPosATL player), ["WeaponHolder","WeaponHolderBase"],2];
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
//
//add infection chance for "ItemWaterbottle", 
if ((random 15 < 1) and (_itemorignal == "ItemWaterbottle")) then {
    r_player_infected = true;
    player setVariable["USEC_infected",true,true];
};
//blood save
dayz_thirst = 0;

if (r_player_blood > r_player_bloodTotal) then {
	r_player_blood = r_player_bloodTotal;
};
player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
player setVariable["USEC_BloodQty",r_player_blood,true];
player setVariable["medForceUpdate",true];
//
//Ensure Control is visible
_display = uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1302) ctrlShow true;
//
if (r_player_blood / r_player_bloodTotal >= 0.2) then {
	(_display displayCtrl 1300) ctrlShow true;
};
//
cutText [format[(localize  "str_player_consumed"),_text], "PLAIN DOWN"];
//
DZE_ActionInProgress = false;

if (_drunkenness) then {
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]];
_hndl ppEffectCommit 0;
sleep 60;
ppEffectDestroy _hndl;
};

if(_megastrong) then {
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 0.57, 0, [0.01, 0.05, 0.08, 0],[0.54, 0.35, 0.3, 1.59],[1.08, 1.09, 1.05, 0.18]];
_hndl ppEffectCommit 0;
//
if (isNil 'oR3F_TIRED_FNCT_Voile_Noir') then {oR3F_TIRED_FNCT_Voile_Noir = R3F_TIRED_FNCT_Voile_Noir;};
if (isNil 'oR3F_TIRED_FNCT_DoBlackVanish') then {oR3F_TIRED_FNCT_DoBlackVanish = R3F_TIRED_FNCT_DoBlackVanish;};
R3F_TIRED_FNCT_Voile_Noir = {};
R3F_TIRED_FNCT_DoBlackVanish = {};
//
ObjEnject = 120;
while {ObjEnject > 0} do {
//playSound "heartbeat_1";
ObjEnject = ObjEnject - 1;
sleep 1;
};
//			
R3F_TIRED_FNCT_Voile_Noir = oR3F_TIRED_FNCT_Voile_Noir;
R3F_TIRED_FNCT_DoBlackVanish = oR3F_TIRED_FNCT_DoBlackVanish;
ppEffectDestroy _hndl;
};
//action
} else {
	r_interrupt = false;
	DZE_ActionInProgress = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["Я еще не допил!", "PLAIN DOWN"];
	};
	
};