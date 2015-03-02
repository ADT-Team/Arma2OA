/*
Modified by Torndeco for DayZ Epoch
All credits & rights go to =BTC= Giallustio
Please don't bug original author about bugs that i have introduced.
*/

/*
Created by =BTC= Giallustio
Version: 0.52
Date: 05/02/2012
Visit us at: http://www.blacktemplars.altervista.org/
You are not allowed to modify this file and redistribute it without permission given by me (Giallustio).
*/

//Lift

BTC_lift_pilot   = [];
BTC_lift         = 1;
BTC_lifted       = 0;
BTC_lift_min_h   = 0;
BTC_lift_max_h   = 40;
BTC_lift_radius  = 5;
BTC_Liftable     = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Wheeled_APC","Tracked_APC","Air","Ship","Tank"];
BTC_Hud_Cond     = false;
BTC_HUD_x        = (SafeZoneW+2*SafeZoneX) + 0.045;
BTC_HUD_y        = (SafeZoneH+2*SafeZoneY) + 0.045;
[] execVM "=BTC=_Logistic\=BTC=_Lift\=BTC=_LiftInit.sqf";


//Functions
BTC_get_liftable_array =
{
    private ["_array","_chopper"];
    _chopper = _this select 0;
	_array   = [];
	switch (typeOf _chopper) do
	{
		case "MH6J_DZ"        : {_array = ["Motorcycle"];};
		case "AH6X_DZ"        : {_array = ["Motorcycle"];};
		case "CSJ_GyroC"        : {_array = ["Motorcycle"];};
		case "pook_H13_civ"        : {_array = ["Motorcycle"];};
		case "pook_H13_civ_ru_yellow"        : {_array = ["Motorcycle"];};
		case "pook_H13_civ_ru_black"        : {_array = ["Motorcycle"];};
		case "pook_H13_amphib_CIV_RU"        : {_array = ["Motorcycle"];};
		case "pook_H13_medevac_CIV_RU"        : {_array = ["Motorcycle"];};
		case "UH1H_DZE"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "UH1Y_DZE"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "UH1H_TK_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "AW159_Lynx_BAF"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		
		case "AH64D_EP1"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "AH64D"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "BAF_Apache_AH1_D"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		
		case "Ka60_PMC"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "BAF_Apache_AH1_D"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "MH60S_DZE"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Ship"];};
		case "Mi17_DZE"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi171Sh_CZ_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_Civilian_DZ"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi24_D_TK_EP1"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Wheeled_APC","Ship"];};
		
		case "Mi24_D"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Wheeled_APC","Ship"];};
		case "Mi24_P"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Wheeled_APC","Ship"];};
		case "Mi24_V"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Wheeled_APC","Ship"];};
		
		case "Ka52"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "Ka52Black"      : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		
		case "AH6J_EP1"        : {_array = ["Motorcycle"];};
		case "Ka60_GL_PMC"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "AH1Z"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "UH1Y"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "MH60S"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Ship"];};
		
		
		
		case "UH1H_TK_GUE_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D"];};
		case "pook_H13_gunship"        : {_array = ["Motorcycle"];};
		case "pook_H13_transport"        : {_array = ["Motorcycle"];};
		case "Mi17_Ins"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_CDF"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_UN_CDF_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi171Sh_rockets_CZ_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_rockets_RU"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_TK_EP1"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		
		case "UH60M_EP1_DZE"     : {_array = ["Truck","Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Ship"];};
		case "UH60M_MEV_EP1"     : {_array = ["Truck","Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Ship"];};
		case "UH60M_EP1"     :     {_array = ["Truck","Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Ship"];};

		case "Mi17_CDF"     :         {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_medevac_Ins"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_medevac_CDF"     : {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		case "Mi17_medevac_RU"     :  {_array = ["Motorcycle","TowingTractor","Motorcycle","GLT_M300_ST","GLT_M300_LT","LandRover_Base","UAZ_Base","ArmoredSUV_Base_PMC","SUV_Base_EP1","S1203_TK_CIV_EP1","Volha_TK_CIV_Base_EP1","VWGolf","tractor","SkodaBase","Pickup_PK_base","Offroad_DSHKM_base","Lada_base","HMMWV_Base","hilux1_civil_1_open","BTR40_base_EP1","BTR40_MG_base_EP1","BAF_Jackal2_BASE_D","Truck","M113_TK_EP1","M113Ambul_TK_EP1_DZ","Ship"];};
		
		case "USEC_ch53_E"     : {_array = ["LandVehicle","Ship"];};
		case "CH_47F_EP1_DZE"     : {_array = ["LandVehicle","Ship"];};
		case "CH_47F_BAF"     : {_array = ["LandVehicle","Ship"];};
		case "CH53_DZE"     : {_array = ["LandVehicle","Ship"];};
		case "BAF_Merlin_HC3_D"     : {_array = ["LandVehicle","Ship"];};
		case "BAF_Merlin_DZE"     : {_array = ["LandVehicle","Ship"];};
		
		
	};
	_array
};

BTC_paradrop =
{
	private ["_chopper","_cargo","_chute_type","_height","_smoke","_chute"];

	_chopper          = _this select 0;
	_cargo      = _this select 1;
	_chute_type   = _this select 2;
	_chute = 0;
	
	_height = [_chopper, _cargo] call BTC_getHeight;
	
	diag_log format ["DEBUG BTC LIFT: Paradrop height: %1", _height];
	
	if (_height > 50) then {
		if (typeOf _chopper == "MH6J_DZ") then {
			_chute = createVehicle [_chute_type, [((position _chopper) select 0) - 5,((position _chopper) select 1) - 10,((position _chopper) select 2)- 4], [], 0, "NONE"];
		} else {
			_chute = createVehicle [_chute_type, [((position _chopper) select 0) - 5,((position _chopper) select 1) - 3,((position _chopper) select 2)- 4], [], 0, "NONE"];
		};
		_smoke        = "SmokeshellGreen" createVehicle position _chopper;
		_smoke attachto [_cargo, [0,0,0]]; 
		_cargo attachTo [_chute, [0,0,0]];
		while {_height > 20} do {
			sleep 0.1;
			_height = [_chopper, _cargo] call BTC_getHeight;
		};
		detach _cargo;
		
	};
};

BTC_getHeight = {
    private ["_height","_chopper","_cargo","_cargo_position","_cargo_position_asl","_objects"];
    _chopper = _this select 0;
	_cargo = _this select 1;
	
	_cargo_position = getpos(_cargo);
	_cargo_position_asl = getposASL(_cargo);
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos: %1", _cargo_position];
	//diag_log format ["DEBUG BTC LIFT: Get Cargo Pos ASL: %1", _cargo_position_asl];
	_height = 0;

	//diag_log ("DEBUG BTC LIFT: Getting Objects");
	_objects = lineIntersectsWith [_cargo_position_asl, [(_cargo_position_asl select 0), (_cargo_position_asl select 1), -2000], _chopper, _cargo, true];
	//diag_log format ["DEBUG BTC LIFT: Objects: %1", _objects];
	if ((count _objects) > 0) then {
		//diag_log ("DEBUG BTC LIFT: Object count check true");
		_height = _cargo distance (_objects select 0);
	} else {
		//diag_log ("DEBUG BTC LIFT: Object count check false");
		_height = _cargo_position select 2;
	};
	//diag_log format ["DEBUG BTC LIFT: Pre _height: %1", _height];
	_height
};