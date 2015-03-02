private ["_bloodAmount","_humanityBool","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagUseTime","_bloodbagUsageTime","_HospitalDistance","_AmbulanceDistance","_Bloodmultiplier","_Infectionmultiplier","_Hospital_enable","_Ambulance_enable","_Anywhere_enable","_nearHospital","_playerASL1","_playerASLx","_playerASLy","_playerASLz","_playerASLz2","_playerASL2","_decke","_Hospitalfound","_Ambulancefound","_bloodAmount","_infectionChance"]; 
call gear_ui_init;
closeDialog 1;
_bloodAmount = 4000; // Amount of blood to give to player
_bloodbagUseTime = 10; // Amount of time it takes in second for the player to use the self bloodbag

_infectionChance = 2; // Percent chance of player infection on self bloodbag (10 = 10% | 2 = 50% | 1 = 100%)
_infectedLifeBool = false; // Whether the player can loose life if infected (True = On | False = off)
_infectedLifeLost = 700; // Amount of life to loose in becomes infected

_humanityBool = false; // Whether the player can get humanity from giving self a bloodbag (True = On | False = off)
_humanityAmount = 50; // Amount of humanity to give player if _humanityBool is true (250 is default for normal bloodbags)

_HospitalDistance = 21; //Max distancewithin Hospital
_AmbulanceDistance = 5; // Max. Distance to get Ambulancebonus
_Bloodmultiplier = 1; // Blood amount multiplier (1 if not in Hospital or near Ambulance, 1.5 if near an Ambulance, 2 if near a Hospital, The Multiplier for Ambulance and Hospital get set later)
_Infectionmultiplier = 0.5; // Multiplier for infectionchance if in Hospital 0.5, 0.75 for an Ambulance, 1 if not in a Hospital (The higher the Value the lower the chance to get infected (it must never get 0 because of division by 0)
_Hospital_enable = 1; // 1 enables SelfBloodbag in Hospitals
_Ambulance_enable = 1; // 1 enables SelfBloodbag near Ambulances
_Anywhere_enable = 1; // 1 enables SelfBloodBag anywhere; (Turns automatically on if _Hospital_enable = 0 and _Ambulance_enable = 0;)
 
_nearHospital = false;
if ((_Hospital_enable == 0) && (_Ambulance_enable == 0)) then { // Check if _Hospital_enable & _Ambulance_enable disabled
    _Anywhere_enable = 1;
    };
if (_Anywhere_enable == 1) then {
        _nearHospital = true;
}; 
if (_Hospital_enable == 1)  then { // if Hospital enabled
        _playerASL1 = getPosASL player;
        _playerASLx = _playerASL1  select 0;
        _playerASLy = _playerASL1  select 1;
        _playerASLz = _playerASL1  select 2;
        _playerASLz2 = _playerASLz + 40;
        _playerASL2 = [_playerASLx,_playerASLy,_playerASLz2];
        _decke = lineIntersects[_playerASL1,_playerASL2]; //Ã¼berprÃ¼ft ob sich zwischen dem Player und (Player+40m hÃ¶he) ein Objekt befindet (benÃ¶tigt unbedingt ASL Koordinaten)
        _Hospitalfound = count nearestObjects[player,["Land_A_Hospital"],_HospitalDistance]; // check if near Hospital
        if ((_Hospitalfound > 0) && _decke) then {
                _nearHospital = true;
                _Bloodmultiplier = 2; // multiplier to Bloodamount
                _Infectionmultiplier = 0.5; //multiplier to Infectionchance
            };
    }; 
if (_Ambulance_enable == 1)  then {
        _Ambulancefound = count nearestObjects[player,["GAZ_Vodnik_MedEvac","S1203_ambulance_EP1"],_AmbulanceDistance]; // check if near Vodnik
        if (_Ambulancefound > 0 ) then {
                _nearHospital = true;
                _Bloodmultiplier = 0.75;
            }; 
    };
_bloodAmount = _bloodAmount * _Bloodmultiplier; // Calculate bloodamount & Infectionchance with the multiplier
_infectionChance = _infectionChance / _Infectionmultiplier;
 
if(!_nearHospital) exitWith { // Abort messegas if Conditions not met
        if ((_Hospital_enable == 1) && (_Ambulance_enable == 0)) then {
            cutText [format["Вам нужно находиться в больнице!!!"], "PLAIN DOWN"];
        };
        if ((_Hospital_enable == 0) && (_Ambulance_enable == 1)) then {
            cutText [format["Вам нужно быть рядом с скорой помощью!!!"], "PLAIN DOWN"];
        };
        if ((_Hospital_enable == 1) && (_Ambulance_enable == 1)) then {
            cutText [format["Вам нужно быть рядом с больницей или скорой помощью (Мед.Водник или Мед.Буханка) для этого!!!"], "PLAIN DOWN"];
        };
};

_bloodbagUsageTime = time;

player playActionNow "Medic"; //play bloodbag animation
	
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

if (_finished) then {
	
	if (['ItemBloodbag'] call player_checkAndRemoveItems) then {

		r_player_blood = r_player_blood + _bloodAmount; //set players LOCAL blood to a certain ammount
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; // If players blood is greater then max amount allowed set it to max allowed (this check keeps an error at bay)
		};
		
		// check if infected
		if (random(_infectionChance) < 1) then {
			r_player_infected = true; //set players client to show infection
			player setVariable["USEC_infected",true,true]; //tell the server the player is infected
			cutText ["Вы использовали пакет крови на себя, но пакет крови был заражен!", "PLAIN DOWN"]; //display text at bottom center of screen if infected
			
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
	 
			cutText ["Вы использовали пакет крови на себе.", "PLAIN DOWN"]; //display text at bottom center of screen on succesful self bloodbag
		};
		
		// check if giving player humanity is on
		if(_humanityBool) then {
			[player,_humanityAmount] call player_humanityChange; // Set players humanity based on amount listed in config area
		};
	} else {
		cutText ["SelfBloodBag failed", "PLAIN DOWN"];
	};
} else {
	// this is for handling if interrupted
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
	cutText ["Заливка крови прервана", "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
};