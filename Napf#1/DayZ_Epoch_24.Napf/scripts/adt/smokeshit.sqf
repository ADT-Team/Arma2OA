
private ["_started","_finished","_animState","_isRead","_myArray","_myArray2","_myDance","_myfall","_itemfordel","_Document","_Newspaper","_obj","heartbeat_1"];
disableserialization;
call gear_ui_init;
_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"]};
if !("ItemKiloHemp" in magazines player) exitWith {cutText [format["Нужна наркота!"], "PLAIN DOWN"]};
if !(("ItemNewspaper" in magazines player) or ("ItemDocument" in magazines player)) exitWith {cutText [format["Нужны документы или газета!"], "PLAIN DOWN"]};
if !("ItemMatchbox_DZE" in items player) exitWith {cutText [format["Необходимы Спички."], "PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText ["Я занят...", "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
closeDialog 1;

player playActionNow "Medic";


//[player,SOUND,0,false,7] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isRead = ["Medic", _animState] call fnc_inString;
        if (_isRead) then {
            _started = true;
        };
        if (_started and !_isRead) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
		if (vehicle player != player) then { {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"]};};
        sleep 0.1;
    };
    r_doLoop = false;
 

if (_finished) then {
_myArray = ["ActsPercMstpSnonWnonDnon_DancingDuoIvan","ActsPercMstpSnonWnonDnon_DancingStefan","ActsPercMstpSnonWnonDnon_DancingDuoStefan"];
_myArray2 = ["AdthPercMstpSnonWnonDnon_A5","AdthPercMstpSnonWnonDnon_A4","AdthPercMstpSnonWnonDnon_A3","AdthPercMstpSnonWnonDnon_A2","AdthPercMstpSnonWnonDnon_A1","AdthPercMstpSnonWnonDnon_3","AdthPercMstpSnonWnonDnon_2","AdthPercMstpSnonWnonDnon_1"];
_myDance = _myArray call BIS_fnc_selectRandom;
_myfall = _myArray2 call BIS_fnc_selectRandom;

_Newspaper = false;
_Document = false;

if ("ItemNewspaper" in magazines player) then  {_Newspaper = true;};
if ("ItemDocument" in magazines player) then {_Document = true;};
if ((_Newspaper) and (_Document)) then { 
_itemfordel = ["ItemNewspaper","ItemDocument"] call BIS_fnc_selectRandom;
player removeMagazine _itemfordel;
} else {
player removeMagazine "ItemNewspaper";
player removeMagazine "ItemDocument";
};

player removeMagazine "ItemKiloHemp";

	sleep 1;
	_obj = "SmokeShellGreen" createVehicle (position player);
	_obj attachTo [vehicle player,[0,0,0]];
	player playMoveNow _myDance;
	100 cutText ["Валера! Настало твое время!","PLAIN DOWN"]; titleFadeOut 4;
	dayz_sourceBleeding = objNull;
    r_player_blood = r_player_bloodTotal;
    r_player_inpain = true;
    r_player_infected = false;
    r_player_injured = false;
    dayz_temperatur = 37;
    r_fracture_legs = false;
    r_fracture_arms = false;
    r_player_dead = false;
    r_player_unconscious = false;
    r_player_loaded = false;
    r_player_cardiac = false;
    r_player_lowblood = false;
    r_player_timeout = 0;
    r_handlercount = 0;
    r_interrupt = false;
    r_doLoop = false;
    r_drag_sqf = false;
    r_self = false;
    r_action = false;
    r_action_unload = false;
    r_player_handler = false;
    r_player_handler1 = false;
    disableUserInput false;
    R3F_TIRED_Accumulator = 0;
    _selection = 'legs';
    _damage = 0;
    resetCamShake;
	R3F_TIRED_Accumulator = 0;
	
	_display = uiNamespace getVariable 'DAYZ_GUI_display';
	(_display displayCtrl 1300) ctrlShow true;
	(_display displayCtrl 1303) ctrlShow false;
	(_display displayCtrl 1306) ctrlShow true;
	(_display displayCtrl 1203) ctrlShow false;
	
					_hndl = ppEffectCreate ["colorCorrections", 1501]; 
					_hndl ppEffectEnable true;
					_hndl ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					_hndl ppEffectCommit 1;
					sleep 20;
					_hndl = ppEffectCreate ["colorCorrections", 1501];
					_hndl ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
					_hndl ppEffectEnable true;
					_hndl ppEffectCommit 0;
					_hndl = ppEffectCreate ["colorCorrections", 1501]; 
					_hndl ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
					_hndl ppEffectCommit 1;
					_hndl ppEffectEnable true; 
					_hndl = ppEffectCreate ["colorCorrections", 1501]; 
					_hndl ppEffectAdjust [0.01,0.01,true];
					_hndl ppEffectCommit 1;
					_hndl ppEffectEnable true;
					_hndl = ppEffectCreate ["colorCorrections", 1501]; 
					_hndl ppEffectEnable true;
					_hndl ppEffectAdjust [0.02,0.02,0.15,0.15]; 
					_hndl ppEffectCommit 1;
					sleep 20;
					_hndl = ppEffectCreate ["colorCorrections", 1501];
					_hndl ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
					_hndl ppEffectEnable true;
					_hndl ppEffectCommit 0;
					sleep 2;
					deletevehicle _obj;
					_hndl = ppEffectCreate ["colorCorrections", 1501]; 
					_hndl ppEffectEnable true;
					_hndl ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
					_hndl ppEffectCommit 1;
					
					dayz_hunger = dayz_hunger + 1000;
					dayz_thirst = dayz_thirst + 1000;
					player setHit[_selection,_damage];
					player setVariable['NORRN_unconscious',false,true];
					player setVariable['USEC_infected',false,true];
					player setVariable['USEC_injured',false,true];
					player setVariable['USEC_inPain',true,true];
					player setVariable['USEC_isCardiac',false,true];
					player setVariable['USEC_lowBlood',false,true];
					player setVariable['USEC_BloodQty',12000,true];
					player setVariable['unconsciousTime',0,true];
					player setVariable ['hit_legs',0,true];
					player setVariable ['hit_hands',0,true];
					player setVariable['medForceUpdate',true,true];
					player setdamage 0;
					
					player playMoveNow _myfall;
					sleep 3;
					[objNull, player, rSwitchMove,""] call RE;
					player playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
					sleep 10;
					
					ppEffectDestroy _hndl;
	[player,"panic",0,false,7] call dayz_zombieSpeak; 
	cutText [format["Что со мной сейчас было??!... голова раскалывается, кушать хочу..."], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
//
_heartbeat_1 = 60;
while {_heartbeat_1 > 0} do {
playSound "heartbeat_1";
_heartbeat_1 = _heartbeat_1 - 1;
sleep 1;
};
//
	} else {
	r_interrupt = false;
	DZE_ActionInProgress = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["Я еще не закончил!", "PLAIN DOWN"];
	};
	};