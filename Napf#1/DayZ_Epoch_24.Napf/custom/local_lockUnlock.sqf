private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
		_vehicle setVariable ["MF_Tow_Cannot_Tow",true,true];
		_vehicle setVariable ["BTC_Cannot_Lift",true,true];
	 player action ["lightOn", _vehicle];
        _nul = [objNull, _vehicle, rSAY, "carLock", _sounddist] call RE;
        sleep 0.5;
        player action ["lightOff", _vehicle];
    } else {
        _vehicle setVehicleLock "UNLOCKED";
		_vehicle setVariable ["MF_Tow_Cannot_Tow",false,true];
		_vehicle setVariable ["BTC_Cannot_Lift",false,true];
        player action ["lightOn", _vehicle];
        _nul = [objNull, _vehicle, rSAY, "carLock", _sounddist] call RE;
        sleep 0.5;
        player action ["lightOff", _vehicle];
	};
};