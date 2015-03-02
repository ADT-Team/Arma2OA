waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};
if (count units group player > 1) then {[player] join grpNull;};

acceptGroupInvite = compile preprocessFileLineNumbers "hpp\dzgm\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "hpp\dzgm\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "hpp\dzgm\disbandGroup.sqf";
inviteToGroup = compile preprocessFileLineNumbers "hpp\dzgm\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "hpp\dzgm\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "hpp\dzgm\leaveGroup.sqf";
mapLoop = compile preprocessFileLineNumbers "hpp\dzgm\mapLoop.sqf";
playerSelectChange = compile preprocessFileLineNumbers "hpp\dzgm\playerSelectChange.sqf";
Updateplayerlist = compile preprocessFileLineNumbers "hpp\dzgm\Updateplayerlist.sqf";
tagname = true;
	
if (isNil "dzgm_init") then {call compile preprocessFileLineNumbers "hpp\dzgm\icons.sqf";};
uiSleep 1;
[] spawn dzgm_init;
[] spawn mapLoop;
systemChat "[ADT-Team]Щелкните правой кнопкой мыши на радио, чтобы открыть управление группой";