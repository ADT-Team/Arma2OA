private ["_takeTime","_started","_finished","_animState","_isMedic","_useTime"];

_takeTime = 10;
_useTime = time;

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false; 
_finished = false;
while {r_doLoop} do {
	_animState = animationState player; 
	_isMedic = ["medic",_animState] call fnc_inString;
	if (_isMedic) then {
		_started = true; // this is a check to make sure everything is still ok
	};
	if(!_isMedic && !r_interrupt && (time - _useTime) < _takeTime) then {
		player playActionNow "Medic"; //play bloodbag animation
		_isMedic = true;
	};
	if (_started && !_isMedic && (time - _useTime) > _takeTime) then {
		r_doLoop = false; // turns off the loop
		_finished = true;
	};
	if (r_interrupt) then {
		r_doLoop = false; // if interuppted turns loop off early so _finished is never true
	};
	sleep 0.1;
};
r_doLoop = false; // make sure loop is off on successful self bloodbag

if (_finished) then {

	if (['ItemZombieParts'] call player_checkAndRemoveItems) then {

		player_zombieCheck = {};
		player_zombieAttack = {};
		
		cutText ["Вы покрыли себя кишками", "PLAIN DOWN"];
		
		sleep (60 + (random 480));

		player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
		player_zombieAttack = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
	
	} else {
		cutText ["Ошибка", "PLAIN DOWN"];
	};

} else {
	// this is for handling if interrupted
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
	cutText ["Прервана", "PLAIN DOWN"];
};