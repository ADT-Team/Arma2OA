private ["_escMenu","_typf","_mxBckpcks"];
 
disableSerialization;
waitUntil {!isNull findDisplay 49};
_escMenu = findDisplay 49;
{
   _typf = typeOf cursortarget;
   _mxBckpcks = getNumber (configFile >> "CfgVehicles" >> _typf >> "transportmaxbackpacks");
   if (!(isNull _x) && (canbuild) && !(_x == player || typeOf _x in ["WeaponHolder","DebugBoxPlayer_DZ"]) && (_mxBckpcks > 0)) exitWith
   {
      titleText ["<ADT-TEAM>: Ты не можешь выйти возле хранилища!", "PLAIN DOWN", 3];
      systemchat "<ADT-TEAM>: Ты не можешь выйти возле хранилища!";
      _escMenu closedisplay 0;
   };
} foreach (nearestObjects [player, ["All"], 7.5]);