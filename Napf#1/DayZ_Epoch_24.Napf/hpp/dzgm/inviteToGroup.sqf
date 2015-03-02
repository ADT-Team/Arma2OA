if (player != leader group player) exitWith {systemChat "You are not the leader and can't invite people.";};

disableSerialization;

private ["_center","_dialog","_playerListBox","_plist","_target","_index","_playerData","_check","_hasInvite"];

_dialog = findDisplay 55510;
_playerListBox = _dialog displayCtrl 55511;
_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;

_center = getMarkerPos "center";
_plist = _center nearEntities ["AllVehicles",10000];
{
	if ((!isNull _x) && (getPlayerUID _x != "")) then {
		if (str(_x) == _playerData) then {_target = _x;_check = 1;};
	};
} count _plist;

if (_check == 0) exitWith {systemChat "[ADT-Team]Вы должны выбрать кого пригласить в свою группу!";};
if (_target == player) exitWith {systemChat "[ADT-Team]Вы не можете пригласить себя!";};
if (count units group _target > 1) exitWith {systemChat "[ADT-Team]Этот игрок уже в группе!";};

{if (_x select 1 == getPlayerUID _target) then {_hasInvite = true;};} forEach currentInvites;
if (_hasInvite) exitWith {systemChat "[ADT-Team]Этому игроку уже отправлено приглашение!";};
currentInvites set [count currentInvites,[getPlayerUID player,getPlayerUID _target]];
publicVariableServer "currentInvites"; 

[nil,_target,"loc", rTITLETEXT, format["Вы получили приглашение в группу. Щелкните правой кнопкой мыши на радио, чтобы посмотреть."], "PLAIN", 0] call RE;

systemChat format["[ADT-Team]Вы пригласили %1 присоединиться к группе",name _target];