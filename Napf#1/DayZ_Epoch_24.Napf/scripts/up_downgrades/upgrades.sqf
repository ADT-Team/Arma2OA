disableSerialization;
private ["_chek","_missing","_toolweapon","_item","_count","_qty","_weapon","_weapoutput","_string","_toolitem","_magitem","_toolitem2","_countitem","_loot_listsSaw","_mags","_magsoutput","_tremoveitem","_tremoveweapon","_removeitem","_removeweapon"];



if (DZE_ActionInProgress) exitWith {cutText ["Выполняется другое действие", "PLAIN DOWN"];};

_loot_listsSaw = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"];
_weapon = _this select 0;
_weapoutput = _this select 4;
_string = _this select 5;
_chek = true;
_toolitem = _this select 1;
_tremoveitem = 0;
_magitem = _this select 2;
_toolitem2 = _this select 3;
_countitem = count _toolitem2;
_tremoveweapon = 0;
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
 titleText [format["Необходимо иметь %1",_missing], "PLAIN DOWN"]; titleFadeOut 5;};
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

_mags = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines"); 

_magsoutput = getArray (configFile >> "cfgWeapons" >> _weapoutput >> "magazines"); 

_mags = _mags select 0;

_magsoutput = _magsoutput select 0;


closeDialog 0;
player setVariable ["p_weapons", [_weapoutput] + [_magsoutput], true];
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


_toolweapon = _weapon in weapons player;
 if (_toolweapon) then {
 player removeWeapon _weapon;} else {_chek = false;};

   if (!_chek) exitWith {DZE_ActionInProgress = false;};

   


_qty = {_x == _mags} count magazines player;
if (_qty>0) then {
for "_i" from 1 to _qty do {
			 player removeMagazine _mags;
			 };
 };
 

sleep 2;
if (_weapoutput == "ChainSaw" ) then {
_weapoutput = _loot_listsSaw call BIS_fnc_selectRandom; } else {
if (_qty>0) then {
for "_i" from 1 to _qty do {
			 player addMagazine _magsoutput;
			 };
};
 };


player addWeapon _weapoutput;

sleep 1;

player selectWeapon _weapoutput;

titleText [format["%1",_string], "PLAIN DOWN"]; titleFadeOut 5;
call dayz_forcesave;
DZE_ActionInProgress = false;
sleep 10;
player setVariable ["p_weapons", [""], true];
