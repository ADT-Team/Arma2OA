private ["_EpiLastUsedTime","_overdose","_EpiTime","_heartbeat_2","_heartbeat_1","_rBlood","_hndl","_onLadder"];
disableserialization;
_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if !("ItemEpinephrine" in magazines player) exitWith {cutText [format["Нужен Адреналин!"], "PLAIN DOWN"]};
closeDialog 1;

if (vehicle player == player) then {player playActionNow "PutDown"; };
player removeMagazine "ItemEpinephrine";
//playsound "epipans";
sleep 3;


_EpiLastUsedTime = 60;
_overdose = false;
_EpiTime = time - lastEpi;
if (_EpiTime < _EpiLastUsedTime) then { _overdose = true;};
_heartbeat_2 = 60;

if (_overdose) then {
_heartbeat_1 = 5;
_rBlood = random 2500;

cutText ["У меня передозировка, я принял слишком много лекарства!", "PLAIN DOWN"];
[player,"panic",0,false,7] call dayz_zombieSpeak; 
addCamShake [10, 1, 25];
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 0.9, 1, 0, [-2.32, 0.17, 0.71, 0],[1.09, 0.91, 1.1, 0.27],[-1.24, 3.03, 0.37, -1.69]];
_hndl ppEffectCommit 0;
//
r_player_blood = r_player_blood - _rBlood;
//
while {_heartbeat_1 > 0} do {
//playSound "heartbeat_1";
_heartbeat_1 = _heartbeat_1 - 1;
sleep 1;
};
};



lastEpi = time; 

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
	player setVariable ["NORRN_unconscious", false, true];
	player setVariable ["USEC_isCardiac",false,true];
//
while {_heartbeat_2 > 0} do {
//playSound "heartbeat_1";
_heartbeat_2 = _heartbeat_2 - 1;
sleep 1;
};
//			
R3F_TIRED_FNCT_Voile_Noir = oR3F_TIRED_FNCT_Voile_Noir;
R3F_TIRED_FNCT_DoBlackVanish = oR3F_TIRED_FNCT_DoBlackVanish;
ppEffectDestroy _hndl;
