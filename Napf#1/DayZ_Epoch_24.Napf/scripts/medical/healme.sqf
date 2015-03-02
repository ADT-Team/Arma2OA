

private ["_heartbeat_2","_display"];

player removeAction s_player_needhill1;
disableSerialization;
_heartbeat_2 = 60;

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;



cutText [format["Не двигайся, сейчас тебя подлатаю!"], "PLAIN DOWN"];
player playActionNow "Medic";
sleep 5;

	dayz_sourceBleeding = objNull;
    r_player_blood = r_player_bloodTotal;
    r_player_inpain = false;
    r_player_infected = false;
    r_player_injured = false;
    dayz_temperatur = 37;
    r_fracture_legs = false;
    r_fracture_arms = false;
    r_player_dead = false;
    r_player_unconscious = false;
    r_player_loaded = false;
    r_player_cardiac = false;
    r_player_lowblood = false;
    r_player_timeout = 0;
    r_handlercount = 0;
    r_interrupt = false;
    r_doLoop = false;
    r_drag_sqf = false;
    r_self = false;
    r_action = false;
    r_action_unload = false;
    r_player_handler = false;
    r_player_handler1 = false;
    disableUserInput false;
    R3F_TIRED_Accumulator = 0;
    resetCamShake;
	R3F_TIRED_Accumulator = 0;
	
					player setHit['legs',0];
					player setVariable['NORRN_unconscious',false,true];
					player setVariable['USEC_infected',false,true];
					player setVariable['USEC_injured',false,true];
					player setVariable['USEC_inPain',false,true];
					player setVariable["USEC_inPain", false, true];
					player setVariable['USEC_isCardiac',false,true];
					player setVariable['USEC_lowBlood',false,true];
					player setVariable['USEC_BloodQty',12000,true];
					player setVariable['unconsciousTime',0,true];
					player setVariable ['hit_legs',0,true];
					player setVariable ['hit_hands',0,true];
					player setVariable['medForceUpdate',true,true];
					player setdamage 0;

	_display = uiNamespace getVariable 'DAYZ_GUI_display';
	(_display displayCtrl 1300) ctrlShow true;
	(_display displayCtrl 1303) ctrlShow false;
	(_display displayCtrl 1306) ctrlShow true;
	(_display displayCtrl 1203) ctrlShow false;
					
DZE_ActionInProgress = false;


_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust[ 1, 0.57, 0, [0.01, 0.05, 0.08, 0],[0.54, 0.35, 0.3, 1.59],[1.08, 1.09, 1.05, 0.18]];
_hndl ppEffectCommit 5;
//
if (isNil 'oR3F_TIRED_FNCT_Voile_Noir') then {oR3F_TIRED_FNCT_Voile_Noir = R3F_TIRED_FNCT_Voile_Noir;};
if (isNil 'oR3F_TIRED_FNCT_DoBlackVanish') then {oR3F_TIRED_FNCT_DoBlackVanish = R3F_TIRED_FNCT_DoBlackVanish;};
R3F_TIRED_FNCT_Voile_Noir = {};
R3F_TIRED_FNCT_DoBlackVanish = {};
//
cutText [format["Ты здоров!!"], "PLAIN DOWN"];
//
while {_heartbeat_2 > 0} do {
playSound "heartbeat_1";
_heartbeat_2 = _heartbeat_2 - 1;
sleep 1;
};
//			
R3F_TIRED_FNCT_Voile_Noir = oR3F_TIRED_FNCT_Voile_Noir;
R3F_TIRED_FNCT_DoBlackVanish = oR3F_TIRED_FNCT_DoBlackVanish;
ppEffectDestroy _hndl;

