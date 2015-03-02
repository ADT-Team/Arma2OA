

private ["_ambulanceFound","_ambulanceEnable","_heliFound","_hospitleFound","_MEDFound","_lowBlood","_sound","_bloodAmount","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagLastUsedTime","_bloodbagTime","_bloodbagUseTime","_bloodbagUsageTime","_timeout"];
if !("ItemBloodbag" in magazines player) exitWith {cutText [format["Необходим пакет крови"], "PLAIN DOWN"]};
if (dayz_combat == 1) exitwith { cutText [format["В бою нельзя переливать кровь!"], "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [format["Не могу переливать себе кровь в технике"], "PLAIN DOWN"]};
if (r_player_blood == r_player_bloodTotal) exitwith {cutText ["Я не нуждаюсь в переливании крови","PLAIN DOWN"]};
//общие настройки
//_disallowinVehicle = true;
_infectedLifeBool = true; // Whether the player can loose life if infected (True = On | False = off)
_ambulanceEnable = 1; 
_infectedLifeLost = 2000; // Amount of life to loose in becomes infected
_bloodbagLastUsedTime = 180;
_bloodbagTime = time - lastBloodbag;
//общие настройки
if(_bloodbagTime < _bloodbagLastUsedTime) exitWith { // If cooldown is not done then exit script
	cutText [format["Нужно подождать %1 секунд. До тех пор не могу перелить кровь!",(_bloodbagTime - _bloodbagLastUsedTime)], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done
};
if(DZE_ActionInProgress) exitWith { cutText ["I am busy for now...", "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

if (_ambulanceEnable == 1)  then {
    _ambulanceFound = count nearestObjects[player,["M113Ambul_TK_EP1_DZ","GAZ_Vodnik_MedEvac","BMP2_Ambul_INS","BMP2_Ambul_CDF","HMMWV_Ambulance","HMMWV_Ambulance_DES_EP1","HMMWV_Ambulance_CZ_DES_EP1","S1203_ambulance_EP1"],5]; 
	_heliFound = count nearestObjects[player,["Mi17_medevac_Ins","Mi17_medevac_CDF","Mi17_medevac_RU","UH60M_MEV_EP1"],10];
	_hospitleFound = count nearestObjects[player,["Land_A_Hospital","MASH_EP1"],25];
	_MEDFound = _ambulanceFound + _hospitleFound + _heliFound;
    if (_MEDFound > 0 ) then {
	
//Настройки: переливание рядом с медициной
_bloodAmount = 8000; // Amount of blood to give to player
_bloodbagUseTime = 15; // Amount of time it takes in second for the player to use the self bloodbag
_infectionChance = 30; // 30%


///////////////////////////////////////////////////////////////////////////////
// Everything below need not be modified unless you know what you are doing! //
///////////////////////////////////////////////////////////////////////////////


_bloodbagUsageTime = time;
_timeout = player getVariable["combattimeout", 0];

	player removeAction s_player_selfBloodbag; //remove the action from users scroll menu
	
	cutText [format["Начинаю переливать себе кровь вблизи медицинской техники/больницы, шансы хороши!"], "PLAIN DOWN"];
	
	[player,"bandage",0,false] call dayz_zombieSpeak;
	player playActionNow "Medic"; //play bloodbag animation
	
	
	////////////////////////////////////////////////
	// Fancy cancel if interrupted addition start //
	////////////////////////////////////////////////
	r_interrupt = false; // public interuppt variable
	_animState = animationState player; // get the animation state of the player
	r_doLoop = true; // while true sets whether to continue self bloodbagging
	_started = false; // this starts as false as a check
	_finished = false; // this starts as false and when true later sets players blood
	while {r_doLoop} do {
		_animState = animationState player; // keep checking to make sure player is in correct animation
		_isMedic = ["medic",_animState] call fnc_inString; // checking to make sure the animstate is the medic animation still
		if (_isMedic) then {
			_started = true; // this is a check to make sure everything is still ok
		};
		if(!_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then {
			player playActionNow "Medic"; //play bloodbag animation
			_isMedic = true;
		};
		if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then {
			r_doLoop = false; // turns off the loop
			_finished = true; // set finished to true to finish the self bloodbag and give player health/humanity
			lastBloodbag = time; // the last self bloodbag time
		};
		if (r_interrupt) then {
			r_doLoop = false; // if interuppted turns loop off early so _finished is never true
		};
		sleep 0.1;
	};
	r_doLoop = false; // make sure loop is off on successful self bloodbag
	///////////////////////////////////////////////
	// Fancy cancel if interrupted addition end //
	//////////////////////////////////////////////

	if (_finished) then {
		player removeMagazine "ItemBloodbag"; //remove the used bloodbag from inventory

		r_player_blood = r_player_blood + _bloodAmount; //set players LOCAL blood to a certain ammount
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; // If players blood is greater then max amount allowed set it to max allowed (this check keeps an error at bay)
		};
		
		// check if infected
			if (floor(random(100)+1) <= _infectionChance) then {
			r_player_infected = true; //set players client to show infection
			player setVariable["USEC_infected",true,true]; //tell the server the player is infected
				
		if (random 2 < 1) then {
					addCamShake [10, 1, 25];
					r_player_timeout = 15;
					r_player_unconscious = true;
					player setVariable ["medForceUpdate",true,true];
					player setVariable ["unconsciousTime", r_player_timeout, true];
					player setVariable["USEC_lowBlood",false,true];
					
					_lowBlood = player getVariable["USEC_lowBlood",false];
					if (!_lowBlood) then {
					player setVariable["USEC_lowBlood",true,true];
					};
					r_player_injured = true;
					
					_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;
					[nil,player,rSAY,[_sound,250]] call RE;
					[player,100,true,(getPosATL player)] spawn player_alertZombies;
					
		};				
				
			cutText [format["Перелил себе кровь, но пакет с кровью был заражен!!!"], "PLAIN DOWN"]; //display text at bottom center of screen if infected
			
			// check for if loosing life on infection is turned on
			if(_infectedLifeBool) then {
				r_player_blood = r_player_blood - _infectedLifeLost; //set players LOCAL blood to a certain ammount
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			} else { // if loosing life is turned off
				r_player_lowblood = false; //set lowblood setting to false
				10 fadeSound 1; //slowly fade their volume back to maximum
				"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
				r_player_lowblood = false; //just double checking their blood isnt low
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			};
		} else { // if not infected
			r_player_lowblood = false; //set lowblood setting to false
			10 fadeSound 1; //slowly fade their volume back to maximum
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
			r_player_lowblood = false; //just double checking their blood isnt low
			player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
	 
			cutText [format["Удачно перелил себе кровь!"], "PLAIN DOWN"]; //display text at bottom center of screen on succesful self bloodbag
		};
		
	} else {
		// this is for handling if interrupted
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["Прервал переливание крови"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
	};

} else { 

//Настройки: переливание в полевых условиях

_bloodAmount = 5000; // Amount of blood to give to player
_bloodbagUseTime = 20; // Amount of time it takes in second for the player to use the self bloodbag
_infectionChance = 50; // 50%



///////////////////////////////////////////////////////////////////////////////
// Everything below need not be modified unless you know what you are doing! //
///////////////////////////////////////////////////////////////////////////////


_bloodbagUsageTime = time;
_timeout = player getVariable["combattimeout", 0];

	player removeAction s_player_selfBloodbag; //remove the action from users scroll menu
	cutText [format["Начинаю переливать себе кровь в полевых условиях, эх... была бы рядом больница или медицинская техника..."], "PLAIN DOWN"];
	[player,"bandage",0,false] call dayz_zombieSpeak;
	player playActionNow "Medic"; //play bloodbag animation
	
	////////////////////////////////////////////////
	// Fancy cancel if interrupted addition start //
	////////////////////////////////////////////////
	r_interrupt = false; // public interuppt variable
	_animState = animationState player; // get the animation state of the player
	r_doLoop = true; // while true sets whether to continue self bloodbagging
	_started = false; // this starts as false as a check
	_finished = false; // this starts as false and when true later sets players blood
	while {r_doLoop} do {
		_animState = animationState player; // keep checking to make sure player is in correct animation
		_isMedic = ["medic",_animState] call fnc_inString; // checking to make sure the animstate is the medic animation still
		if (_isMedic) then {
			_started = true; // this is a check to make sure everything is still ok
		};
		if(!_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then {
			player playActionNow "Medic"; //play bloodbag animation
			_isMedic = true;
		};
		if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then {
			r_doLoop = false; // turns off the loop
			_finished = true; // set finished to true to finish the self bloodbag and give player health/humanity
			lastBloodbag = time; // the last self bloodbag time
		};
		if (r_interrupt) then {
			r_doLoop = false; // if interuppted turns loop off early so _finished is never true
		};
		sleep 0.1;
	};
	r_doLoop = false; // make sure loop is off on successful self bloodbag
	///////////////////////////////////////////////
	// Fancy cancel if interrupted addition end //
	//////////////////////////////////////////////

	if (_finished) then {
		player removeMagazine "ItemBloodbag"; //remove the used bloodbag from inventory

		r_player_blood = r_player_blood + _bloodAmount; //set players LOCAL blood to a certain ammount
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; // If players blood is greater then max amount allowed set it to max allowed (this check keeps an error at bay)
		};
		
		// check if infected
			if (floor(random(100)+1) <= _infectionChance) then {
			r_player_infected = true; //set players client to show infection
			player setVariable["USEC_infected",true,true]; //tell the server the player is infected
				
		if (random 2 < 1) then {
				addCamShake [10, 1, 25];
					r_player_timeout = 15;
					r_player_unconscious = true;
					player setVariable ["medForceUpdate",true,true];
					player setVariable ["unconsciousTime", r_player_timeout, true];
					player setVariable["USEC_lowBlood",false,true];
					
					_lowBlood = player getVariable["USEC_lowBlood",false];
					if (!_lowBlood) then {
					player setVariable["USEC_lowBlood",true,true];
					};
					r_player_injured = true;
					
					_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;
					[nil,player,rSAY,[_sound,250]] call RE;
					[player,100,true,(getPosATL player)] spawn player_alertZombies;
					
		};				
				
			cutText [format["Перелил себе кровь, но пакет с кровью был заражен!!!"], "PLAIN DOWN"]; //display text at bottom center of screen if infected
			
			// check for if loosing life on infection is turned on
			if(_infectedLifeBool) then {
				r_player_blood = r_player_blood - _infectedLifeLost; //set players LOCAL blood to a certain ammount
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			} else { // if loosing life is turned off
				r_player_lowblood = false; //set lowblood setting to false
				10 fadeSound 1; //slowly fade their volume back to maximum
				"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
				r_player_lowblood = false; //just double checking their blood isnt low
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			};
		} else { // if not infected
			r_player_lowblood = false; //set lowblood setting to false
			10 fadeSound 1; //slowly fade their volume back to maximum
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
			r_player_lowblood = false; //just double checking their blood isnt low
			player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
	 
			cutText [format["Удачно перелил себе кровь!"], "PLAIN DOWN"]; //display text at bottom center of screen on succesful self bloodbag
		};
		
	} else {
		// this is for handling if interrupted
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["Прервал переливание крови"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
	};

}; 
};
DZE_ActionInProgress = false;
player setVariable["combattimeout", time + 30, true];
player setVariable["startcombattimer", 0, true];
dayz_combat = 1;
player setVariable["incombat", 1, true];