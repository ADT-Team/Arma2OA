// bleed.sqf

private ["_started","_finished","_animState","_isMedic","_id","_num_removed","_unit"];

disableserialization;

_unit = (_this select 3) select 0;

call fnc_usec_medic_removeActions;
r_action = false;
/*
if (vehicle player == player) then {player playActionNow "PutDown"; playsound "epipans";};

sleep 3;*/ 


	_num_removed = ([player,"ItemMorphine"] call BIS_fnc_invRemove);
	if(_num_removed == 1) then {
			_unit setVariable ["hit_legs",0];
			_unit setVariable ["hit_hands",0];
		
			_display = findDisplay 106;
			_display closeDisplay 0;
		

		if ((_unit == player) or (vehicle player != player)) then {
			//Self Healing
			_id = [player,player] execVM "scripts\medical\medMorphine.sqf";
		} else {
			[player,50] call player_humanityChange;
			sleep 1;
			PVDZE_send = [_unit,"Morphine",[_unit,player]];
			publicVariableServer "PVDZE_send";
		};
	};
