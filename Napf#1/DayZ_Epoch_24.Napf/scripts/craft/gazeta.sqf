 //               F507DMT //***// GoldKey 					//
//http://goldkey-dz.ru/  //***// https://vk.com/goldkey_dz //
private ["_map_coord","_location","_gun_list","_med_list","_ammo_list","_name_veh","_messages","_object_bot","_finish_box","_metalBarCount","_chance","_finish_veh","_finish_veh_f","_x","_Objects","_this","_invehicl","_started","_finished","_isRead","_animState"];
disableserialization;
call gear_ui_init;
_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (r_player_unconscious) exitWith {titleText ["Действие отменено.", "PLAIN DOWN", 0.5];};
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};
if !("ItemNewspaper" in magazines player) exitWith {cutText [format["Нужна газета!"], "PLAIN DOWN"]};
if(DZE_ActionInProgress) exitWith { cutText ["я занят...", "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_invehicle = false;
closeDialog 1;


if (vehicle player != player) then {
	_invehicle = true;
};

if !(_invehicle) then {
player playActionNow "Medic";
};

[player,"document",0,false,20] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
 
    while {r_doLoop} do {
        _animState = animationState player;
        _isRead = ["Medic", _animState] call fnc_inString;
        if (_isRead) then {
            _started = true;
        };
        if (_started and !_isRead) then {
            r_doLoop = false;
            _finished = true;
        };
        if (r_interrupt) then {
            r_doLoop = false;
        };
		if (_invehicle) then {
		sleep 6;
		r_doLoop = false;
		_finished = true;
		};
        sleep 0.1;
    };
    r_doLoop = false;
 

if (_finished) then {
if !("ItemNewspaper" in magazines player) exitWith {DZE_ActionInProgress = false;cutText [format["Нужна газета!"], "PLAIN DOWN"]};
player removeMagazine "ItemNewspaper";

_location = [
////////////////////////////////////////////////////////////////
[9677.93,2918.84,-0.048],
[7399.68,3522.07,0.064],
[12472.1,3772.62,0.199],
[9061.39,3876.74,0.001],
[11148,6029.32,0.341],
[7866.56,2164.33,0.108],
[5147.22,12986.3,0.011],
[5484.56,2565.81,0.113],
[4778.94,13310.4,-0.02],
[4023.55,4028.47,0.009],
[6224.23,4848.73,0.003],
[14453.8,5645,0.356],
[3834.11,12851.1,0.015],
[7260.67,6307.76,0.066],
[18088.7,4087.64,0.004],
[5111.85,6506.37,0.047],
[2920.63,6179.21,0.029],
[15799.8,8718.9,0.001],
[14353.8,11619,0.049],
[3155.86,8089.42,-0.007],
[3821.69,7387.08,-0.006],
[5294.55,11838.4,-0.027],
[11127.5,12898.5,0.081],
[2467.96,9401.25,0.033],
[12979,8417.05,0.014],
[4965.47,9281.25,0.025],
[15409.7,3473.24,0.742],
[6548.17,12861.7,0.074],
[3728.68,10234.9,0.026],
[8375.32,5316.66,-0.003],
[18791.5,5930.44,-0.139],
[6781.93,11997.2,0.041],
[16787.3,6976.41,0.137],
[1946.57,9820.17,0.004],
[7607.79,12356.9,0.029],
[2560.89,11734.1,0.027],
[16976.8,10986.5,0.426],
[8430.21,10789.1,0.11],
[19619.4,11625.6,0.13],
[9704.31,13227.8,0.038],
[11294.2,10533.4,0.167],
[7855.71,8828.51,0.015],
[1380.6,11149.2,0.198],
[3655.05,11363,-1.64e-04],
[9829.97,7908.04,0.87],
[14805,14036.4,9.069e-04],
[13215.9,13630.2,0.034],
[9094.26,15045.7,-9],
[11705.4,15168.6,0.031],
[8474.23,14235.6,0.029],
[6469.77,15286.8,0.031],
[17118.1,14762.2,0.018],
[9082.79,16272.1,0.005],
[10678.9,14201.5,0.094],
[14239.8,9999.87,0.078],
[12760.9,12499.7,0.052],
[18599.1,9031.21,0.047],
[15525.3,15694.3,-9],
[16645.6,18319.1,0.03],
[10425.7,18428.7,0.002],
[11521,16786.6,0.022],
[1194.69,3205.72,0.02],
[18693.9,4767.87,0.482],
[882.12,6747.43,0.085],
[14049.4,17083.6,0.012],
[18154.8,2414.71,0.089],
[13101.6,19397.9,0.028],
[18822.4,1955.21,0.326],
[12679.4,18463.1,0.002],
[11843.1,7827.52,0.215],
[18588.2,17751.1,-0.006],
[15865,10874.7,0.066],
[18425.3,10762.9,0.098],
[6764.87,7179.87,0.198],
[6216.51,8523.9,0.013],
[9778.29,6550.1,0.078],
[14708,7680.74,-0.038],
[11500.4,10316,-0.048],
[12925.4,11665.9,0.002],
[15459.6,11925.1,0.088],
[14345.6,13627.4,0],
[12940.6,9954.3,0.02],
[10093.7,16385.3,0.013],
[6119.75,10201.2,-0.001],
[4964.48,7847.57,0],
[17241.6,3506.52,0.127],
[8769.2,7588.63,0.047],
[8591.18,13354.3,0.002],
[10585.4,13103,-0.003],
[10834.6,12720.6,0.017],
[7391.25,14405.7,0.01],
[7402.03,16222,0.004],
[10072.4,10462.4,0.002],
[7616.35,11726,0.002],
[15943.4,10384.3,-0.02],
[10064.8,10932,0.232],
[9075.92,4620.9,0.047],
[9352.32,4078.48,0.353],
[11778.2,6078.92,-0.208],
[7695.23,4748.27,0.025]
////////////////////////////////////////////////////////////////
] call BIS_fnc_selectRandom;

_gun_list = [
"M4A1",
"M4A1_Aim",
"M4A1_Aim_camo",
"M4A1_HWS_GL",
"M4A1_HWS_GL_camo",
"M4A1_RCO_GL",
"M4A3_CCO_EP1",
"M4A3_RCO_GL_EP1",
"M16A2",
"M16A2GL",
"M16a4",
"M16a4_acg",
"M16A4_GL",
"M16A4_ACG_GL",
"G36C",
"G36a",
"G36K",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"BAF_L85A2_RIS_Holo",
"BAF_L85A2_UGL_Holo",
"BAF_L85A2_RIS_ACOG",
"BAF_L85A2_UGL_ACOG",
"BAF_L85A2_RIS_SUSAT",
"BAF_L85A2_UGL_SUSAT",
"BAF_L86A2_ACOG",
"m8_carbine",
"m8_carbine_pmc",
"m8_carbineGL",
"m8_compact",
"m8_compact_pmc",
"m8_sharpshooter",
"m8_SAW",
"AKS_74_U",
"AKS_74_UN_kobra",
"AK_74",
"AK_74_GL",
"AK_74_GL_kobra",
"AKS_74",
"AKS_74_kobra",
"AKS_74_pso",
"AK_107_kobra",
"AK_107_GL_kobra",
"AK_107_pso",
"AK_107_GL_pso",
"AK_47_M",
"AK_47_S",
"Sa58V_EP1",
"Sa58P_EP1",
"Sa58V_RCO_EP1",
"Sa58V_CCO_EP1",
"SVD",
"M40A3",
"M24_des_EP1",
"M24",
"M4SPR",
"M14_EP1",
"huntingrifle",
"M240_DZ",
"Mk_48_DZ",
"M249_EP1_DZ",
"M249_DZ",
"MG36",
"MG36_camo",
"RPK_74",
"bizon_silenced",
"bizon",
"MP5SD",
"MP5A5",
"UZI_EP1",
"Sa61_EP1",
"Saiga12K",
"M1014",
"Remington870_lamp",
"LeeEnfield",
"Winchester1866",
"MR43",
"Crossbow_DZ",
"KSVK_DZE",
"BAF_LRR_scoped_W",
"M110_NVG_EP1",
"DMR",
"SVD_CAMO",
"SVD_des_EP1",
"m240_scoped_EP1_DZE",
"M249_m145_EP1_DZE",
"Mk_48_DZ",
"M60A4_EP1_DZE",
"PK_DZ",
"M32_EP1",
"AA12_PMC",
"M79_EP1",
"SCAR_H_CQC_CCO_SD",
"SCAR_L_CQC_CCO_SD",
"G36_C_SD_camo",
"G36_C_SD_eotech",
"M4A1_HWS_GL_SD_Camo",
"M4A1_AIM_SD_camo",
"m8_holo_sd",
"bizon_silenced",
"MP5SD",
"SCAR_H_LNG_Sniper"
];

//список тачек
_name_veh = [
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"Lada1_TK_CIV_EP1",
"LandRover_CZ_EP1",
"UAZ_CDF",
"UAZ_RU",
"VWGolf",
"VolhaLimo_TK_CIV_EP1",
"Pickup_PK_GUE_DZE",
"HMMWV_M1035_DES_EP1",
"HMMWV_DZ",
"SUV_Green",	
"SUV_Blue",
"SUV_White",
"V3S_TK_EP1_DZE",
"UralOpen_CDF",
"Offroad_DSHKM_Gue_DZE",
"LadaLM",
"GNT_C185U",
"Tractor",
"HMMWV_DZ",
"hilux1_civil_2_covered",
"LandRover_CZ_EP1",
"SkodaRed",
"SUV_Yellow",
"UAZ_INS",
"UralCivil2_DZE"
			] call BIS_fnc_selectRandom;
	
	
	//Сообщения
	_messages = [
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

"Потерялся бензовоз. Течный. На правом крыле – родинка от ДТП.",
"Утерян брифкейс с золотом, верните хотя бы золото.",
"Продам автомобиль Москвич-412 или обменяю на телефон Нокия. ",
"Продаю фирменую тележку Одуванчик, в нее помещается 50 чекушек, 2 батона или 1 Бомж. Макс скорость 5 шагов в секунду, нету багажника, не тормозят мусора)! Летняя резина и спойлер в придачу!",
"Жить становится просто, когда купил Т90!",
"Ничто так не обесценивает вашу машину, как новая машина соседа!",
"Вы молоды, здоровы, энергичны? ГИБДД г. Москвы приглашает вас получить перспективную специальность оператора машинного доения! ",
"Трактор - единственное всегда актуальное транспортное средство в России!",
"Автомобилю Газель требуется автомобиль Бычок для создания счастливого семейства. ",
"Белоснежный ЗАЗ-965 для ваших торжеств (свадьба 2-3 человека, небольшие похороны). ",
"Кто видел 27 сентября красную Тойота CLK госномер е210ре177. Нормально низкопрофильная резина смотрится? ",
"Кто нашел ключи от тёщиной машины, прошу не возвращать... ",
"Меняю ВАЗ 2109 (в угоне с марта 1996 г.) на автомобиль более позднего срока угона. ",
"Меняю задние крылья ВАЗ 2106 - на верхние АH-2.",
"Обменяю пачку листов А4 на ауди той же модели.",
"Срочно продаю БМВ. Недорого, 2010 г.в. Не битый, всё есть. Себе бы оставил… но жена сегодня на права сдала, с 7-го раза! ",
"Продается автомобиль БМВ, срочно, за 400 у.е. Цвет черный, литые диски, вроде бы кожаный салон, плохо видно, стекла сильно затемненные.",
"Продается ВАЗ-2101, цветомузыка, все навороты. Не ездит.",
"Продам автомобиль Nissan-Patrol после аварии. До аварии просьба не звонить!"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				  ] call BIS_fnc_selectRandom;

	//спавним бота
	_object_bot = createAgent ["Worker3", _location, [], 0, "NONE"];	
	
	//сообщение игроку
	_map_coord = mapGridPosition getPos _object_bot;
	titleText [_messages + "\n Запомни координату: " + _map_coord, "PLAIN DOWN", 5];
	systemChat ("Запомни координату: " + _map_coord);
	playSound "pda";
	
		if (floor(random(100)+1) <= 40) then {
		//Коробка
		_finish_box = createVehicle ["WoodCrate_DZ", _object_bot, [], 0, "NONE"];
		sleep 3;
		DZE_ActionInProgress = false;
				if (floor(random(100)+1) <= 30) then {
				//Стволы
				for "_i" from 0 to 5 do {
				_itemBar=  _gun_list  call BIS_fnc_selectRandom;
				_finish_box addWeaponCargoGlobal [_itemBar, 1];
					};
						} else {
						if (floor(random(100)+1) <= 50) then {
						//Медецина
						_med_list = [["ItemAntibiotic",0.8],["ItemBandage",1],["ItemBloodbag",0.8],["ItemEpinephrine",0.8],["ItemHeatPack",1],["ItemMorphine",0.8],["ItemPainkiller",1],["ItemTrashToiletpaper",0.5],["ItemTrashRazor",0.5]];
						_metalBarCount = (count _med_list);
						for "_i" from 0 to 50 do {
						_index = floor (random _metalBarCount);
						_chance = ((_med_list select _index) select 1);
						if ((random 1) < _chance) then {
						_itemBar = ((_med_list select _index) select 0);
						_finish_box addMagazineCargoGlobal [_itemBar, 1];
						};};
								} else {
								//Патроны
								_ammo_list = [["30Rnd_556x45_StanagSD",0.5],["20Rnd_762x51_DMR",0.8],["10Rnd_762x54_SVD",0.8],["30Rnd_556x45_Stanag",1],["20Rnd_762x51_FNFAL",1],["30Rnd_545x39_AK",1],["30Rnd_762x39_AK47",1],["30Rnd_762x39_SA58",1],["30Rnd_545x39_AKSD",0.30]];
								_metalBarCount = (count _ammo_list);
								for "_i" from 0 to 50 do {
								_index = floor (random _metalBarCount);
								_chance = ((_ammo_list select _index) select 1);
								if ((random 1) < _chance) then {
								_itemBar = ((_ammo_list select _index) select 0);
								_finish_box addMagazineCargoGlobal [_itemBar, 1];
								};};};
	};
	} else {	
	//Временная тачка
	_uniqueid = str(round(random 999999));
	_finish_veh = createVehicle [_name_veh, _object_bot,[], 0, "NONE"];
	_finish_veh setVariable ["ObjectID", _uniqueid, true];
	_finish_veh setVariable ["ObjectUID", _uniqueid, true];
	_finish_veh setHit ["wheel_1_1_steering",(random 0.6)];
	_finish_veh setHit ["wheel_1_2_steering",(random 0.6)];
	_finish_veh setHit ["wheel_2_1_steering",(random 0.6)];
	_finish_veh setHit ["wheel_2_2_steering",(random 0.6)];
	_finish_veh setHit ["palivo",(random 0.6)];
	_finish_veh setHit ["motor",(random 0.6)];
	_finish_veh setHit ["glass1",(random 0.6)];
	_finish_veh setHit ["glass2",(random 0.6)];
	_finish_veh setHit ["glass4",(random 0.6)];
	_finish_veh setHit ["karoserie",(random 0.6)];
	_finish_veh setFuel (random 0.3); 
	_finish_veh call fnc_veh_ResetEH;
	clearWeaponCargoGlobal _finish_veh;
	clearMagazineCargoGlobal _finish_veh;

	
	DZE_ActionInProgress = false;
	};
	
	sleep 1;
	deletevehicle _object_bot;
	} else {
	r_interrupt = false;
	DZE_ActionInProgress = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["Я еще не дочитал!", "PLAIN DOWN"];
	};
	};

 //               F507DMT //***// GoldKey 					//
//http://goldkey-dz.ru/  //***// https://vk.com/goldkey_dz //