disableSerialization;



private ["_txt1","_weapon","_toolitem","_magitem","_tooloutput","_weapoutput","_string"];

if (DZE_ActionInProgress) exitWith {cutText ["Выполняется другое действие", "PLAIN DOWN"];};
_weapon = _this select 0;

_toolitem = _this select 1;

_magitem = _this select 2;

_tooloutput = _this select 3;

_weapoutput = _this select 4;

_string = _this select 5;

DZE_ActionInProgress = true;

if(_toolitem !="" and !(player hasWeapon _toolitem))exitwith{

        _txt1 = (gettext (configFile >> 'cfgweapons' >> _toolitem >> 'displayName'));

        titleText [format["Необходимо иметь %1",_txt1], "PLAIN DOWN"]; titleFadeOut 5;
DZE_ActionInProgress = false;
};

 



 

closeDialog 0;
player setVariable ["p_weapons", [_weapoutput], true];
player playActionNow "Medic";

[player,"repair",0,false,10] call dayz_zombieSpeak;

[player,10,true,(getPosATL player)] spawn player_alertZombies;

sleep 2;

_toolweapon = _weapon in weapons player;
 if (_toolweapon) then {
 player removeWeapon _weapon;} else {_chek = false;};

   if (!_chek) exitWith {DZE_ActionInProgress = false;};



sleep 2;

 

 



 

player addWeapon _weapoutput;

sleep 1;

player selectWeapon _weapoutput;

titleText [format["%1",_string], "PLAIN DOWN"]; titleFadeOut 5;
call dayz_forcesave;
DZE_ActionInProgress = false;
sleep 10;
player setVariable ["p_weapons", [""], true];
