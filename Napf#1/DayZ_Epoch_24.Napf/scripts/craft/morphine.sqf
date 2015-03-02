
if (!CanGiveMorphine) exitWith {
    cutText ["Извините,вы можете получить бесплатный морфий только раз", "PLAIN DOWN"]; // Если байк уже есть, либо прошло 5 минут от вашего появления.
};
CanGiveMorphine = false;

player removeAction s_player_deploygyro;

if (vehicle player != player) exitWith {cutText [format["Нельзя получить морфий в технике!"], "PLAIN DOWN"]};

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

		player playActionNow "Medic";
		[player,"repair",0,false,10] call dayz_zombieSpeak;
	    [player,10,true,(getPosATL player)] spawn player_alertZombies;
		sleep 7;
		player addmagazine "ItemMorphine";
		titleText ["Морфий получен.","PLAIN DOWN"];
		
DZE_ActionInProgress = false;

};
 