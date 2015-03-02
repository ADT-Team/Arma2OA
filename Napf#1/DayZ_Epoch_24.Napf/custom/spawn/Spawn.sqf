//F507DMT
//GoldKey https://vk.com/goldkey_dz

private ["_position","_findSpot","_isNear","_isZero","_counter","_locArray","_ok","_seldLoc"];
_locArray = [
[17374.205,5239.541,0], //Petrovka
[9381.77,16248.9,0], //Bolota
[8063.9019,573.8855,0], //Cherno
[13964.799,14555.711,0], //Elektro
[1558.5248,10891.594,0], //Solnichny
[5819.2979,5843.9404,0]]; //Berezino



_ok = createDialog "DRN_DIALOG";
spawnSelect = -1;
waitUntil {spawnSelect != -1};
if (spawnSelect == 6) then {spawnSelect = floor (random 5)};
_seldLoc = _locArray select spawnSelect;
_findSpot = true;
_counter = 0;
while {_findSpot and _counter < 20} do {
	_position = ([(_seldLoc),0,300,10,0,20,0] call BIS_fnc_findSafePos);
	_isNear = count (_position nearEntities ["Man",100]) == 0;
	_isZero = ((_position select 0) == 0) and ((_position select 1) == 0);
	_counter = _counter + 1;
	if (_isNear and !_isZero) then {_findSpot = false};
};

_position = [_position select 0,_position select 1,0];
//diag_log("DEBUG: spawning player at" + str(_position));
player setPosATL _position;




//music
playSound "introsong";

//camera
_camDistance = 100;
showCinemaBorder false;
camUseNVG false;
 
_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
 
_camera camSetFOV 1.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 12;
 
waitUntil {camCommitted _camera};
 
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

//rules
[] execVM "custom\spawn\rules.sqf";

systemChat ("Удачной игры!");

//F507DMT
//GoldKey https://vk.com/goldkey_dz