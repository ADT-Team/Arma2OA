// bleed.sqf

private ["_id","_unit","_num_removed"];

disableserialization;

_unit = (_this select 3) select 0;

call fnc_usec_medic_removeActions;
r_action = false;
/*
if (vehicle player == player) then {player playActionNow "PutDown"; playsound "paink_use";};
sleep 3; 
*/

_num_removed = ([player,"ItemPainkiller"] call BIS_fnc_invRemove);
if(_num_removed == 1) then {
	
		_display = findDisplay 106;
		_display closeDisplay 0;

	_unit setVariable ["USEC_inPain", false, true];

	if ((_unit == player) or (vehicle player != player)) then {
		//Self Healing
		_id = [player,player] execVM "scripts\medical\medPainkiller.sqf";
	} else {
		[player,20] call player_humanityChange;
		sleep 1;
		PVDZE_send = [_unit,"Painkiller",[_unit,player]];
		publicVariableServer "PVDZE_send";
	};
};
