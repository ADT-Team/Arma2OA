/*
Author: TeeTime

Does: Manages the body temperatur of a Player

Possible Problems:
	=>  Balancing

Missing: 
	Save Functions
	
	Should Effects Sum Up?
	
	Math Functions for Water
	
	Player Update GUI Colours need to be checked
	
	Shivering Function need improments
*/


	private ["_looptime","_sun_factor","_building_factor","_vehicle_factor","_fire_factor","_water_factor","_snow_factor","_snowfall_factor","_rain_factor","_night_factor","_wind_factor","_camo_clothes","_height_mod","_difference","_hasfireffect","_isinbuilding","_isinvehicle","_snowfall","_raining","_sunrise","_warming_clothes"];

	_looptime 			= _this;
	
	//Factors are equal to win/loss of factor*basic value
	//All Values can be seen as x of 100: 100 / x = minutes from min temperetaure to max temperature (without other effects)
	_vehicle_factor		=	5;
	_moving_factor 		=	7;
	_fire_factor		=	25; //Should be always:  _rain_factor + _night_factor + _wind_factor OR higher !
	_building_factor 	=	7;  // DayZ: Namalsk, was 7
	_sun_factor			=	4;  //max sunfactor linear over the day. highest value in the middle of the day

////Epoch all skins// TayTay
	_Epoch_clothes	    =   5;  // DayZ: Namalsk
	_warming_clothes    =   23;   // DayZ: Epoch Napf  //Config by: Mavet(ADT-Team)
/////
	_water_factor		=	-35;
	_snow_factor		=	-17; // DayZ: Namalsk
	_rain_factor		=	-12;
	_night_factor		=	-12;  // DayZ: Namalsk, was -1.5
	_wind_factor		=	-6;

	_camo_clothes		=	-2;  // DayZ: Namalsk
	
	_difference 	= 10;
	_hasfireffect	= false;
	_isinbuilding	= false;
	_isinvehicle	= false;
	
	_raining 		= if(rain > 0) then {true} else {false};
	_sunrise		= call world_sunRise;
	
	//POSITIV EFFECTS
	
	//vehicle
	if((vehicle player) != player) then {
		_difference 	= _difference + _vehicle_factor;
		_isinvehicle 	= true;
	} else {
		//speed factor
		private["_vel","_speed"];
		_vel = 		velocity player;
		_speed = 	round((_vel distance [0,0,0]) * 3.5);
		_difference = (_moving_factor * (_speed / 20)) min 7;
	};
	
	//fire
	private ["_fireplaces"];
	_fireplaces = nearestObjects [player, ["Land_Fire","Land_Campfire"], 8];
	if(({inflamed _x} count _fireplaces) > 0 && !_isinvehicle ) then {
		//Math: factor * 1 / (0.5*(distance max 1)^2) 		0.5 = 12.5% of the factor effect in a distance o 4 meters
		_difference 	= _difference + (_fire_factor /(0.5*((player distance (_fireplaces select 0)) max 1)^2));
		_hasfireffect 	= true;
	};
	
	//building
	_building = nearestObject [player, "HouseBase"];
	if(!isNull _building) then {
		if([player,_building] call fnc_isInsideBuilding) then {
			//Make sure thate Fire && Building Effect can only appear single		Not used at the moment
			//if(!_hasfireffect && _fire_factor > _building_factor) then {
				_difference = _difference + _building_factor;
			//};
			_isinbuilding	= true;
			dayz_inside 	= true;
		} else {
			dayz_inside 	= false;
		};
	} else {
		dayz_inside 	= false;
	};
	
	
	//sun
	if(daytime > _sunrise && daytime < (24 - _sunrise) && !_raining && overcast <= 0.6 && !_isinbuilding) then {
		
		/*Mathematic Basic
		
		t = temperature effect
		
		a = calcfactor
		f = sunfactor
		s = sunrise
		d = daytime
		
		I:	a = f / (12 - s)�
		II:	t = -a * (d - 12)� + f
		
		I + II =>
		
		t = -(f / (12 - s)�) * (d - 12)� + f
		
		Parabel with highest Point( greatest Effect == _sun_factor) always at 12.00
		Zero Points are always at sunrise && sunset -> Only Positiv Values Possible
		*/
		
		_difference = _difference + (-((_sun_factor / (12 - _sunrise)^2)) * ((daytime - 12)^2) + _sun_factor);	
	};
	


////Epoch all skins + Add skin class name above to change effects of that skin
	if ((typeOf player) == "AllPlayers") then {
		_difference 	= _difference + _Epoch_clothes;
	};
//TayTay
	//) || ((typeOf player) == "Clothing1") || ((typeOf player) == "Clothing2") || ((typeOf player) == "Clothing3") || ((typeOf player) == "Clothing4") || ((typeOf player) == "Clothing5") || ((typeOf player) == "Clothing6") || ((typeOf player) == "Clothing7") || ((typeOf player) == "Clothing8") || ((typeOf player) == "Clothing9") || ((typeOf player) == "Clothing10") || ((typeOf player) == "Clothing11")
	
		
	
	//NEGATIVE  EFFECTS

	//DayZ Epoch camo clothing
	if (((typeOf player) == "Skin_Sniper1_DZ") || ((typeOf player) == "Skin_CZ_Soldier_Sniper_EP1_DZ") || ((typeOf player) == "Skin_GUE_Soldier_Sniper_DZ") ) then {
		_difference 	= _difference + _camo_clothes;
	};

	//NEGATIVE  EFFECTS
	
	//POSITIVE EFFECTS ON
	
	if (((typeOf player) == "Skin_INS_Soldier_AR_DZ") || (((typeOf player) == "Skin_INS_Soldier_CO_DZ") ) then {
		_difference 	= _difference + _warming_clothes;
	};
	//POSITIVE EFFECTS END
	
	
	//water
	if(surfaceIsWater getPosATL player || dayz_isSwimming) then {
		_difference = _difference + _water_factor;
	};
	
	//rain
	if(_raining && !_isinvehicle && !_isinbuilding) then {
		_difference = _difference + (rain * _rain_factor);
	};
	
	     //snow
        if (!isNil "snow" && !_isinvehicle && !_isinbuilding) then {
                _difference = _difference + _snow_factor;
        };
	
	//night
	private ["_daytime"];
	if((daytime < _sunrise || daytime > (24 - _sunrise)) && !_isinvehicle) then {
		_daytime 	= if(daytime < 12) then {daytime + 24} else {daytime};
		if(_isinbuilding) then {
			_difference = _difference + ((((_night_factor * -1) / (_sunrise^2)) * ((_daytime - 24)^2) + _night_factor)) / 2;
		} else {
		_difference = _difference + (((_night_factor * -1) / (_sunrise^2)) * ((_daytime - 24)^2) + _night_factor);
	};
	};
	
	//wind
	if(((wind select 0) > 4 || (wind select 1) > 4) && !_isinvehicle && !_isinbuilding ) then {
		_difference = _difference + _wind_factor;
	};
	

if(!_isinvehicle) then {
		_height_mod = ((getPosASL player select 2) / 100) * 5;
		_difference = _difference - _height_mod;
	};
	
	//Calculate Change Value			Basic Factor			Looptime Correction			Adjust Value to current used temperatur scala
	_difference = _difference * SleepTemperatur / (60 / _looptime)		* ((dayz_temperaturmax - dayz_temperaturmin) / 100);
	
	//Change Temperatur															 Should be moved in a own Function to allow adding of Items which increase the Temp like "hot tea"
	dayz_temperatur = (((dayz_temperatur + _difference) max dayz_temperaturmin) min dayz_temperaturmax);
	
	//Add Shivering
	//						Percent when the Shivering will start 
	if(dayz_temperatur <= (0.600 * (dayz_temperaturmax - dayz_temperaturmin) + dayz_temperaturmin)) then {
		//CamShake as linear Function Maximum reached when Temp is at temp minimum. First Entry = Max Value
		_temp = 0.6 * (dayz_temperaturmin / dayz_temperatur );
		addCamShake [_temp,(_looptime + 1),30];	//[0.5,looptime,6] -> Maximum is 25% of the Pain Effect	
	} else {
		addCamShake [0,0,0];			//Not needed at the Moment, but will be necesarry for possible Items
	};
