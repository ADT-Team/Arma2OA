private ["_MorfLastUsedTime","_overdose","_MorfTime","_overdose","_heartbeat_1","_rBlood","_hndl","_heartbeat2"];
_MorfLastUsedTime = 60;
_overdose = false;
_MorfTime = time - lastMorf;
if (_MorfTime < _MorfLastUsedTime) then { _overdose = true;};

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

lastMorf = time; 

_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1,1,0,[0,0,0,0],[2,0,0,1.25],[2.5,-2.5,0,0]];
_hndl ppEffectCommit 0;

_heartbeat2 = 30;
while {_heartbeat2 > 0} do {
//playSound "heartbeat_1";
_heartbeat2 = _heartbeat2 - 1;
sleep 1;
};

ppEffectDestroy _hndl;

