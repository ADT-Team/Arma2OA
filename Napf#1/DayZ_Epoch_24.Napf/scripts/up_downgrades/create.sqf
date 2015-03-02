
	
disableSerialization;
private ["_chek","_missing","_toolweapon","_item","_count","_qty","_random","_tool","_schansW","_gr","_itemutput","_string","_plusrandom","_itemtip","_toolitem","_magitem","_toolitem2","_countitem","_spawnRoll","_tremoveitem","_tremoveweapon","_removeitem","_removeweapon"];
if (DZE_ActionInProgress) exitWith {cutText ["Выполняется другое действие", "PLAIN DOWN"];};
_itemutput = _this select 3;

_string = _this select 4;

_chek = true;
 _plusrandom = _this select 5;
 _itemtip = _this select 6;
_toolitem = _this select 0;
_toolitem2 = _this select 2;
_countitem = count _toolitem2;
_tremoveweapon = 0;
_tremoveitem = 0;
_magitem = _this select 1;
DZE_ActionInProgress = true;


_inf =[];
_inform = {

    sleep 0.5;
	_inf = _this;
	_memberFunction = "Для создания необходимо,";
	_finalText = format ["<t size='0.60' color='#f2cb0b' align='right'>%1<br/></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br/>", _x]} forEach _inf;
	_finalText = _finalText + "</t>";
	_onScreenTime = 6;
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		1
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);

};
{
		_item = _x select 0;
		_count = _x select 1;
		_missing = (gettext (configFile >> 'cfgmagazines' >> _item >> 'displayName'));
		_inf set [count _inf, format["%1 в количестве %2",_missing, _count]]; 
} forEach _magitem;
		
if (_countitem>0) then {

    {		
		_missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
		_inf set [count _inf, format["%1",_missing]]; 
	} forEach _toolitem2;
};


    {		
		_toolweapon = _x in weapons player;
		if(!_toolweapon) exitWith {_chek = false; _missing = (gettext (configFile >> 'cfgweapons' >> _x >> 'displayName'));
		titleText [format["Необходимо иметь %1",_missing], "PLAIN DOWN"]; titleFadeOut 7;};
	} forEach _toolitem;
 
  if (!_chek) exitWith {DZE_ActionInProgress = false;[_inf] spawn _inform;};
  

		{
			_item = _x select 0;
			_count = _x select 1;
			_qty = { (_x == _item) || (configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _item) } count magazines player;
			_tremoveitem = _tremoveitem + _count;
			if(_qty < _count) exitWith { _missing = (gettext (configFile >> 'cfgmagazines' >> _item >> 'displayName')); 
             titleText [format["Необходимо иметь %2 в количестве %1 ",_count, _missing], "PLAIN DOWN"]; titleFadeOut 5;
			_chek = false;};
		} forEach _magitem;
		
		
 if (!_chek) exitWith {DZE_ActionInProgress = false;[_inf] spawn _inform;};

 

if (_countitem>0) then {

    {		
		_toolweapon = _x in weapons player;
		if(!_toolweapon) exitWith {_chek = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
		titleText [format["Необходимо иметь %1",_missing], "PLAIN DOWN"]; titleFadeOut 5;};
		_tremoveweapon = _tremoveweapon + 1;
	} forEach _toolitem2;
};
  
 if (!_chek) exitWith {DZE_ActionInProgress = false;[_inf] spawn _inform;};
 closeDialog 0;
player setVariable ["p_weapons", [_itemutput], true];
player playActionNow "Medic";

[player,"repair",0,false,10] call dayz_zombieSpeak;

[player,10,true,(getPosATL player)] spawn player_alertZombies;

sleep 2;


_removeitem = 0;
{
	_item = _x select 0;
	_count = _x select 1;
    _qty = { (_x == _item) || (configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _item) } count magazines player;
	 if(_qty >= _count) then { _removeitem = _removeitem + _count;};
	 for "_i" from 1 to _count do {  player removeMagazine _item;};
} forEach _magitem;
 
if (_tremoveitem != _removeitem) exitWith {DZE_ActionInProgress = false;};

_removeweapon = 0;
if (_countitem>0) then {

    {		
	_toolweapon = _x in weapons player;
	if(_toolweapon)then {
		player removeWeapon _x;
		_removeweapon = _removeweapon + 1;
		};
	} forEach _toolitem2;
 
 };
 if (_tremoveweapon != _removeweapon) exitWith {DZE_ActionInProgress = false;};

 _schansW = 50;
 _random = 0;
 _spawnRoll = (round(random 99)) + 1;
 
 if (_plusrandom != "") then {
 _tool = _plusrandom in weapons player;
		if(_tool) then {_random = 25};
 };
 
if (_itemtip == "granat") then {
 
 _schansW =_schansW + 20;
_schansW =_schansW + _random;
 };
 
if (_itemtip == "maaws") then {

 _schansW =_schansW + 15;
_schansW =_schansW + _random;
 };
 
if (_itemtip == "c4") then {
 
 _schansW =_schansW - 5;
_schansW =_schansW +_random;
 }; 
 
 if (_itemtip == "GP25") then {
 
 _schansW = 95;
_schansW =_schansW +_random;
 }; 
  if (_itemtip == "M203") then {
 
 _schansW = 95;
_schansW =_schansW +_random;
 }; 
if (_spawnRoll > _schansW) then 
 {
   titleText [format["При работе со взрывчаткой, что то пошло не так и вы подорвались."], "PLAIN DOWN"]; titleFadeOut 10; 
   sleep 1;
  _gr= createVehicle ["M_Stinger_AA", player, [], 0, "CAN_COLLIDE"];_gr setdamage 1;
  sleep 0.5;
  player setDamage 1;
  _chek = false;
 };

 if (!_chek) exitWith {DZE_ActionInProgress = false;};

 if ((_itemtip == "s4") and (_plusrandom != "")) then {
 _toolweapon = _plusrandom in weapons player;

 if (_toolweapon) then {
 player removeWeapon _plusrandom;} else {_chek = false;};
 };
   if (!_chek) exitWith {DZE_ActionInProgress = false;};
  
  
sleep 2;



player addMagazine _itemutput;
 if ((_itemtip == "GP25") or (_itemtip == "M203")) then {
 
player addMagazine _itemutput;
 }; 


titleText [format["%1",_string], "PLAIN DOWN"]; titleFadeOut 7;
call dayz_forcesave;
DZE_ActionInProgress = false;
sleep 10;
player setVariable ["p_weapons", [""], true];

