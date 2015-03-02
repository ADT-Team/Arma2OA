

private ["_finished","_finishedTime","_WorkBenchFound"];

objCraft = 1;

while {objCraft > 0} do {
_WorkBenchFound = count nearestObjects[player,["WorkBench_DZ"],3];
if !("Skin_Survivor2_DZ" in magazines player) exitWith {cutText [format["Для создания необходим скин Civilian clothing"], "PLAIN DOWN"]};
if !(("ItemToolbox" in items player) && ("ItemKnife" in items player)) exitWith {cutText [format["Необходимы Инструменты и Охотничий нож"], "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [format["Нельзя крафтить в технике!"], "PLAIN DOWN"]};
if (dayz_combat == 1) exitwith { cutText [format["В бою нельзя крафтить!"], "PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
	//
	DZE_ActionInProgress = true;
	player removeMagazine "Skin_Survivor2_DZ";
	player playActionNow "Medic";
	//
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,15,true,(getPosATL player)] spawn player_alertZombies;
	//
	r_interrupt = false;
	r_doLoop = true;
	_finished = false;
	_finishedTime = diag_tickTime+7;
	//
	while {r_doLoop} do {
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	if (_finished) then {
	//
	player addMagazine "ItemCanvas";
	cutText [format["Создал 1 Canvas"], "PLAIN DOWN"];
	objCraft = 1;
	//
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
	//	
	player addMagazine "Skin_Survivor2_DZ";
	//
	cutText ["\n\n Крафт отменен", "PLAIN DOWN"];
	objCraft = 0;
	//
	};

sleep 3;
DZE_ActionInProgress = false;
};
