private ["_veh","_reduc","_strongheli"];

heli_attach = true;
_veh   = vehicle player;

//strong heli
_strongheli = [
"CH_47F_EP1_DZE",
"CH_47F_BAF",
"CH53_DZE",
"BAF_Merlin_HC3_D",
"BAF_Merlin_DZE",
"Mi17_CDF",
"Mi17_medevac_Ins",
"Mi17_medevac_CDF",
"Mi17_medevac_RU",
"Mi17_Ins",
"Mi17_CDF",
"Mi17_UN_CDF_EP1",
"Mi171Sh_rockets_CZ_EP1",
"Mi17_rockets_RU",
"Mi17_TK_EP1",
"Mi24_D",
"Mi24_P",
"Mi24_V",
"Mi17_DZE",
"Mi171Sh_CZ_EP1",
"Mi17_Civilian_DZ",
"Mi24_D_TK_EP1"
];
if (typeOf _veh	in _strongheli) then {_reduc = 1.0015;};
//strong heli

//other heli
_reduc = 1.0025;

while {heli_attach} do
{
_veh setvelocity [((velocity _veh) select 0)/_reduc, ((velocity _veh) select 1)/_reduc, ((velocity _veh) select 2)];
sleep 0.05;

};