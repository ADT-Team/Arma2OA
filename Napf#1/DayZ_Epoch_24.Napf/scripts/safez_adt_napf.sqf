/*
   by: GROM http://gromx.ru/
   *updated on 10.08.2014
*/
if (isServer) exitWith {};
USE_CANBUILD = true;            // if you don't want to define your own positions
USE_POSITIONS = false;  // to use own positions and radius
USE_AI_REMOVER = false; // use this to remove Missionbots (AI) within 100m of a player if the player is in a SafeZone
USE_AntiSteal = true;   // use this to block opening gear if another player is within 3m!
LOG_EnterLeave = true;  // This will log to your .rpt when a player enters or leaves a SafeZone! (only works with infiSTAR.de Admintools / AntiHack)
/* You can use USE_CANBUILD or/and (works together) the custom positions below (USE_POSITIONS) [position or zone,radius] */
_infiSZ =
[
        [[6325.6772,7807.7412],200],
        [[4063.4226,11664.19],200],
        [[11447.472,11364.504],200],
        [[1606.6443,7803.5156],150],
        [[12944.227,12766.889],150],
        [[5068.6636,9723.4248],100],
		[[9650.042,1130.0769],150], //SADAT
		[[18726.24,9412.8242],150], //DALAS
		[[846.85547,6934.9829],100], //DIMA
		[[4630.8467,5806.3262],150], //IVAN
		[[11711.057,13287.964],100], // Yury
		[[6582.1631,1981.2272],150], //A3a3a
		[[9956.9453,9429.804],150] //HITMAN
		
];
waitUntil { !isNil 'dayz_animalCheck' };
if (isNil 'inSafezone') then {inSafezone = false;};
[_infiSZ] spawn {
        _infiSZ = _this select 0;
        _startSafeZone =
        {
                if (isNil 'outNow') then
                {
                        _msg = 'Вы в безопасной зоне!';
                        hint _msg;
                        taskHint [_msg, [0,1,0,1], 'taskDone'];
                        inNow = nil;
                        outNow = true;
                       
                        if (LOG_EnterLeave) then
                        {
                                _obj = vehicle player;
                                _pos = getPosATL _obj;
                                PVDZE_send = [player,'SafeZoneState',[1]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = { deleteVehicle (nearestObject [_this select 0,_this select 4]); };
                player_zombieCheck = {};
                fnc_usec_damageHandler = {};
                fnc_usec_unconscious = {};
                object_monitorGear = {};
                player removeAllEventHandlers 'handleDamage';
                player addEventHandler ['handleDamage', {false}];
                player allowDamage false;
                _vehObj = vehicle player;
                if (_vehObj != player) then
                {
                        _vehObj removeAllEventHandlers 'Fired';
                        _vehObj addEventHandler ['Fired', {_this call player_fired;}];
                };
                {
                        if (!isNull _x) then
                        {
                                _in = _x getVariable ['inSafeZone',0];
                                if (_in == 0) then
                                {
                                        _x setVariable ['inSafeZone', 1, true];
                                        _x removeAllEventHandlers 'HandleDamage';
                                        _x addEventHandler ['HandleDamage', {false}];
                                        _x allowDamage false;
                                };
                        };
                } forEach (_vehObj nearEntities [['LandVehicle','Air','Ship'], 50]);
               
                _cwep = currentWeapon player;
                if (_cwep in ['MAAWS']) then
                {
                        _swep = '';
                        {
                                if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
                                {
                                        _swep = _x;
                                };
                        } forEach (weapons player);
                        if (_swep == '') then
                        {
                                player playActionNow 'PutDown';
                                _iPos = getPosATL player;
                                _radius = 1;
                                _removed = ([player,_cwep,1] call BIS_fnc_invRemove);
                                if (_removed == 1) then
                                {
                                        _item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
                                        _item addWeaponCargoGlobal [_cwep,1];
                                };
                        }
                        else
                        {
                                player selectweapon _swep;
                        };
                };
        };
        _endSafeZone =
        {
                if (isNil 'inNow') then
                {
                        if (str fnc_usec_damageHandler == '{}') then
                        {
                                _msg = 'Вы покинули безопасную зону!';
                                hint _msg;
                                taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
                        };
                        inNow = true;
                        outNow = nil;
                       
                        if (LOG_EnterLeave) then
                        {
                                _obj = vehicle player;
                                _pos = getPosATL _obj;
                                PVDZE_send = [player,'SafeZoneState',[0]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
                fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
                object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
                if (gmdadmin == 1) exitWith {};
                player allowDamage true;
                fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
                player removeAllEventHandlers 'HandleDamage';
                player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
               
                _vehObj = vehicle player;
                {
                        if (!isNull _x) then
                        {
                                _in = _x getVariable ['inSafeZone',0];
                                if (_in == 1) then
                                {
                                        _x setVariable ['inSafeZone', 0, true];
                                        _x removeAllEventHandlers 'HandleDamage';
                                        _x addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                        _x allowDamage true;
                                };
                        };
                } forEach (_vehObj nearEntities [['LandVehicle','Air','Ship'], 50]);
        };
        while {1 == 1} do
        {
                _state = false;
                _obj = vehicle player;
               
                if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
                if (isNil 'canbuild') then { canbuild = true; } else { if (typename canbuild != 'BOOL') then { canbuild = true; }; };
                if (isNil 'USE_POSITIONS') then { USE_POSITIONS = false; } else { if (typename USE_POSITIONS != 'BOOL') then { USE_POSITIONS = false; }; };
                if (isNil 'USE_CANBUILD') then { USE_CANBUILD = true; } else { if (typename USE_CANBUILD != 'BOOL') then { USE_CANBUILD = true; }; };
                if (USE_POSITIONS) then
                {
                        {
                                _z = _x select 0;
                                _r = _x select 1;
                                if (_obj distance _z < _r) exitWith {_state = true;};
                        } forEach _infiSZ;
                };
                if (USE_CANBUILD) then
                {
                        if (!canbuild) then {_state = true;};
                };
                if (_state) then
                {
                        inSafeZone = true;
                        call _startSafeZone;
                        {
                                if (!isNull _x) then
                                {
                                        if !(isPlayer _x) then
                                        {
                                                deletevehicle _x;
                                        };
                                };
                        } forEach (_obj nearEntities ['zZombie_Base',15]);
                       
                        if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else { if (typename USE_AI_REMOVER != 'BOOL') then { USE_AI_REMOVER = false; }; };
                        if (USE_AI_REMOVER) then
                        {
                                {
                                        if ((!isNull group _x) && (getPlayerUID _x == '')) then
                                        {
                                                deleteVehicle _x;
                                        };
                                } forEach (player nearEntities ['Man',100]);
                        };
                }
                else
                {
                        inSafeZone = false;
                };
                sleep 2;
                if (!inSafeZone) then
                {
                        call _endSafeZone;
                };
        };
};
if (USE_AntiSteal) then
{
        [] spawn {
                while {1 == 1} do
                {
                        if (inSafezone) then
                        {
                                _cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'], 3]);
                                if ((_cnt > 0) && (!isNull (findDisplay 106))) then
                                {
                                        (findDisplay 106) closedisplay 0;
                                        closeDialog 0;
                                        _log = format['%1 Вы не можете открыть рюкзак другой игрока!',name player];
                                        cutText [_log,'PLAIN'];
                                        hint _log;
                                };
                        }
                        else
                        {
                                sleep 2;
                        };
                        sleep 0.1;
                };
        };
};