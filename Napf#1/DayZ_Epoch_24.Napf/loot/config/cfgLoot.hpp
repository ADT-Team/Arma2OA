#include "cfglootsmall.hpp"
//#include "loot_adt/sniper_loot.hpp" //Снайперки & патроны...

class CfgLoot {
//Мусор
	trash[] = {
	{"TrashTinCan", 0.3}, //01
	{"TrashJackDaniels", 0.2}, //00
	{"ItemSodaEmpty", 0.2}, //01
	{"ItemTrashToiletpaper", 0.15},
	{"ItemTrashRazor", 0.2}
	};

//еда - вода - патроны - мусор - гражданские здания
	civilian[] = {
	{"FoodCanUnlabeled", 0.2},
	{"TrashJackDaniels", 0.15},
	{"ItemSodaEmpty", 0.2},
	{"ItemSodaCoke", 0.01},
	{"ItemSodaPepsi", 0.02}, //09
	{"FoodCanBakedBeans", 0.03}, //05 
	{"FoodCanSardines", 0.03}, //05
	{"FoodCanFrankBeans", 0.05}, //
	{"FoodCanPasta", 0.05}, //
	{"8Rnd_9x18_Makarov", 0.07}, //
	{"7Rnd_45ACP_1911", 0.05}, //
	{"2Rnd_shotgun_74Slug", 0.12},
	{"2Rnd_shotgun_74Pellets", 0.15},
	{"ItemBandage", 0.02}, //04
	{"ItemPainkiller", 0.03}, //
	{"FoodBioMeat", 0.01},
	{"8Rnd_9x18_MakarovSD", 0.01}, //01
	{"ItemDocument", 0.02} //03
	};

	office2[] = {
	{"FoodCanUnlabeled", 0.2},
	{"TrashJackDaniels", 0.2},
	{"ItemSodaEmpty", 0.2},
	{"ItemSodaCoke", 0.01},
	{"ItemSodaPepsi", 0.04}, //09
	{"FoodCanBakedBeans", 0.03}, //05
	{"FoodCanSardines", 0.03}, //05
	{"FoodCanFrankBeans", 0.03}, //05
	{"FoodCanPasta", 0.03}, //05
	{"8Rnd_9x18_Makarov", 0.04}, //07
	{"7Rnd_45ACP_1911", 0.03}, //05
	{"2Rnd_shotgun_74Slug", 0.1}, //05
	{"2Rnd_shotgun_74Pellets", 0.1}, //05
	{"ItemBandage", 0.02}, //04
	{"ItemPainkiller", 0.03}, //06
	{"FoodBioMeat", 0.01},
	{"8Rnd_9x18_MakarovSD", 0.01},
	{"ItemBriefcaseEmpty", 0.01},
	{"ItemDocument", 0.02}
	};


	food[] = {
	{"TrashTinCan", 0.15},
	{"TrashJackDaniels", 0.15},
	{"ItemSodaEmpty", 0.15},
	{"ItemSodaCoke", 0.01},
	{"ItemSodaPepsi", 0.3},
	{"FoodCanBakedBeans", 0.04},
	{"FoodCanSardines", 0.04},
	{"FoodCanFrankBeans", 0.07},
	{"FoodCanPasta", 0.07},
	{"FoodCanUnlabeled", 0.01},
	{"FoodPistachio", 0.05},
	{"FoodNutmix", 0.01}
	};


	office[] = {
	{"FoodCanUnlabeled", 0.15},
	{"ItemSodaEmpty", 0.15},
	{"ItemSodaCoke", 0.03},
	{"ItemSodaPepsi", 0.03},
	{"TrashJackDaniels", 0.1},
	{"FoodCanBakedBeans", 0.01},
	{"FoodCanSardines", 0.01},
	{"FoodCanFrankBeans", 0.01},
	{"FoodCanPasta", 0.01},
	{"ItemWaterbottleUnfilled", 0.01},
	{"ItemWaterbottle", 0.01},
	{"ItemBandage", 0.06},
	{"7Rnd_45ACP_1911", 0.03},
	{"5x_22_LR_17_HMR", 0.01},
	{"10x_303", 0.04},
	{"6Rnd_45ACP", 0.04},
	{"2Rnd_shotgun_74Slug", 0.1},
	{"2Rnd_shotgun_74Pellets", 0.1},
	{"8Rnd_9x18_Makarov", 0.08},
	{"15Rnd_W1866_Slug", 0.02},
	{"WoodenArrow", 0.04},
	{"HandRoadFlare", 0.07},
	{"ItemPainkiller", 0.02},
	{"HandChemGreen", 0.07},
	{"HandChemBlue", 0.07},
	{"HandChemRed", 0.07},
	{"ItemHeatPack", 0.03},
	{"ItemLockbox", 0.02},
	{"ItemDocument", 0.02}
	};


	generic[] = {
	{"FoodCanUnlabeled", 0.2},
	{"ItemSodaEmpty", 0.2},
	{"ItemSodaCoke", 0.03},
	{"ItemSodaPepsi", 0.02},
	{"TrashJackDaniels", 0.15},
	{"FoodCanBakedBeans", 0.01},
	{"FoodCanSardines", 0.01},
	{"FoodCanFrankBeans", 0.01},
	{"FoodCanPasta", 0.01},
	{"ItemWaterbottleUnfilled", 0.01},
	{"ItemWaterbottle", 0.01},
	{"ItemBandage", 0.02},
	{"7Rnd_45ACP_1911", 0.03},
	{"5x_22_LR_17_HMR", 0.01},
	{"10x_303", 0.04},
	{"6Rnd_45ACP", 0.04},
	{"2Rnd_shotgun_74Slug", 0.08},
	{"2Rnd_shotgun_74Pellets", 0.08},
	{"8Rnd_9x18_Makarov", 0.09},
	{"15Rnd_W1866_Slug", 0.02},
	{"WoodenArrow", 0.05},
	{"HandRoadFlare", 0.07},
	{"ItemPainkiller", 0.02},
	{"HandChemGreen", 0.09},
	{"HandChemBlue", 0.09},
	{"HandChemRed", 0.09},
	{"ItemHeatPack", 0.04}
	};

//Медицина
	medical[] = {
	{"ItemBandage", 0.04},
	{"ItemPainkiller", 0.10},
	{"ItemMorphine", 0.1},
	{"ItemEpinephrine", 0.1},
	{"ItemAntibiotic", 0.01},
	{"ItemHeatPack", 0.05}
	};


	hospital[] = {
	{"ItemBandage", 0.07},
	{"ItemPainkiller", 0.16},
	{"ItemMorphine", 0.08},
	{"ItemEpinephrine", 0.09},
	{"ItemBloodbag", 0.05},
	{"ItemAntibiotic", 0.01}
	};

//военные здания
	military[] = {
	{"FoodCanUnlabeled", 0.15},
	{"ItemSodaEmpty", 0.2},
	{"ItemSodaCoke", 0.01},
	{"ItemSodaPepsi", 0.01},
	{"ItemBandage", 0.04},
	{"ItemAntibiotic", 0.01},
	{"ItemPainkiller", 0.04},
	{"ItemMorphine", 0.01},
	{"30Rnd_556x45_Stanag", 0.02},
	{"20Rnd_762x51_DMR", 0.01},
	{"17Rnd_9x19_glock17", 0.03},
	{"15Rnd_9x19_M9SD", 0.01},
	{"15Rnd_9x19_M9", 0.03},
	{"30Rnd_762x39_AK47", 0.02},
	{"30Rnd_545x39_AK", 0.01},
	{"5Rnd_762x51_M24", 0.01},
	{"5Rnd_86x70_L115A1", 0.01},
	{"8Rnd_B_Beneli_74Slug", 0.1},
	{"1Rnd_HE_M203", 0.01},
	{"FlareWhite_M203", 0.09},
	{"FlareGreen_M203", 0.09},
	{"1Rnd_Smoke_M203", 0.09},
	{"200Rnd_556x45_M249", 0.01},
	{"HandGrenade_west", 0.01},
	{"HandGrenade_east", 0.01},
	{"SmokeShell", 0.08},
	{"SmokeShellRed", 0.08},
	{"SmokeShellGreen", 0.08},
	{"8Rnd_B_Beneli_Pellets", 0.1},
	{"30Rnd_556x45_StanagSD", 0.01},
	{"30Rnd_9x19_MP5", 0.03},
	{"30Rnd_9x19_MP5SD", 0.01},
	{"100Rnd_762x51_M240", 0.01},
	{"HandChemGreen", 0.08},
	{"HandChemBlue", 0.09},
	{"HandChemRed", 0.09},
	{"ItemHeatPack", 0.04},
	{"FoodMRE", 0.01},
	{"8Rnd_9x18_MakarovSD", 0.01},
	{"20Rnd_B_765x17_Ball", 0.02},
	{"30Rnd_9x19_UZI_SD", 0.01},
	{"ItemDocument", 0.02}
	};
//военно-воздушные здания
	militarypilot[] = {
	{"FoodCanUnlabeled", 0.2},
	{"ItemSodaEmpty", 0.15},
	{"ItemSodaCoke", 0.01},
	{"ItemSodaPepsi", 0.01},
	{"ItemBandage", 0.04},
	{"ItemAntibiotic", 0.02},
	{"ItemPainkiller", 0.04},
	{"ItemMorphine", 0.01},
	{"30Rnd_556x45_Stanag", 0.04},
	{"20Rnd_762x51_DMR", 0.01},
	{"17Rnd_9x19_glock17", 0.06},
	{"15Rnd_9x19_M9SD", 0.01},
	{"15Rnd_9x19_M9", 0.02},
	{"30Rnd_762x39_AK47", 0.04},
	{"30Rnd_545x39_AK", 0.02},
	{"5Rnd_762x51_M24", 0.01},
	{"5Rnd_86x70_L115A1", 0.01},
	{"8Rnd_B_Beneli_74Slug", 0.09},
	{"1Rnd_HE_M203", 0.01},
	{"FlareWhite_M203", 0.09},
	{"FlareGreen_M203", 0.09},
	{"1Rnd_Smoke_M203", 0.09},
	{"200Rnd_556x45_M249", 0.01},
	{"HandGrenade_west", 0.01},
	{"HandGrenade_east", 0.01},
	{"SmokeShell", 0.09},
	{"SmokeShellRed", 0.09},
	{"SmokeShellGreen", 0.09},
	{"8Rnd_B_Beneli_Pellets", 0.1},
	{"30Rnd_556x45_StanagSD", 0.01},
	{"30Rnd_9x19_MP5", 0.03},
	{"30Rnd_9x19_MP5SD", 0.01},
	{"100Rnd_762x51_M240", 0.01},
	{"HandChemGreen", 0.08},
	{"HandChemBlue", 0.08},
	{"HandChemRed", 0.08},
	{"ItemHeatPack", 0.04}, 
	{"FoodMRE", 0.02},
	{"8Rnd_9x18_MakarovSD", 0.01},
	{"20Rnd_B_765x17_Ball", 0.04},
	{"30Rnd_9x19_UZI_SD", 0.01},
	{"ItemHotwireKit", 0.01}
	};

//Лут в полиц. зомби
	policeman[] = {{"ItemBandage", 0.04},
	{"7Rnd_45ACP_1911", 0.08},
	{"6Rnd_45ACP", 0.08},
	{"15Rnd_W1866_Slug", 0.09},
	{"8Rnd_B_Beneli_Pellets", 0.16},
	{"HandRoadFlare", 0.07},
	{"8Rnd_9x18_MakarovSD", 0.01},
	{"ItemComboLock", 0.01},
	{"SmokeShell", 0.08},
	{"FoodMRE", 0.04},
	{"ItemHotwireKit", 0.01},
	{"ItemLockbox", 0.02},
	{"ItemDocument", 0.02}
	};


//Охотничья вышка
	hunter[] = {
	{"ItemBandage", 0.04},
	{"5x_22_LR_17_HMR", 0.10},
	{"7Rnd_45ACP_1911", 0.03},
	{"10x_303", 0.1},
	{"ItemWaterbottleUnfilled", 0.05},
	{"WoodenArrow", 0.2},
	{"ItemHeatPack", 0.02},
	{"FoodMRE", 0.01},
	{"FoodNutmix", 0.02},
	{"ItemDocument", 0.01},
	{"ItemMixOil", 0.01}
	};

//Сараи
	worker[] = {
	{"FoodCanUnlabeled", 0.15},
	{"TrashJackDaniels", 0.14},
	{"ItemSodaEmpty", 0.19},
	{"ItemSodaCoke", 0.02},
	{"ItemSodaPepsi", 0.02},
	{"FoodCanBakedBeans", 0.03},
	{"FoodCanSardines", 0.03},
	{"FoodCanFrankBeans", 0.03},
	{"FoodCanPasta", 0.03},
	{"ItemBandage", 0.1},
	{"ItemPainkiller", 0.06},
	{"ItemWire", 0.01},
	{"ItemTankTrap", 0.03},
	{"ItemComboLock", 0.01},
	{"ItemSledgeHead", 0.01},
	{"ItemDocument", 0.02}
	};

//Скины
	clothes[] = {
	{"Skin_RU_Policeman_DZ", 0.11},
	{"Skin_Pilot_EP1_DZ", 0.1},
	{"Skin_Functionary1_EP1_DZ", 0.1},
	{"Skin_Priest_DZ", 0.1},
	{"Skin_Rocker1_DZ", 0.07},
	{"Skin_Rocker2_DZ", 0.07},
	{"Skin_Rocker3_DZ", 0.08},
	{"Skin_Rocker4_DZ", 0.08},
	{"Skin_SurvivorW3_DZ", 0.09},
	{"Skin_SurvivorWpink_DZ", 0.09},
	{"Skin_SurvivorWurban_DZ", 0.07},
	{"Skin_INS_Bardak_DZ", 0.02},
	{"Skin_INS_Worker2_DZ", 0.02}
	};

//Скины военных
	militaryclothes[] = {
	{"Skin_Camo1_DZ", 0.09},
	{"Skin_Sniper1_DZ", 0.06},
	{"Skin_Rocket_DZ", 0.05},
	{"Skin_Soldier1_DZ", 0.5},
	{"Skin_Drake_Light_DZ", 0.07},
	{"Skin_Soldier_TL_PMC_DZ", 0.07},
	{"Skin_Soldier_Sniper_PMC_DZ", 0.05},
	{"Skin_Soldier_Bodyguard_AA12_PMC_DZ", 0.07},
	{"Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 0.08},
	{"Skin_FR_OHara_DZ", 0.08},
	{"Skin_FR_Rodriguez_DZ", 0.09},
	{"Skin_CZ_Soldier_Sniper_EP1_DZ", 0.04},
	{"Skin_Graves_Light_DZ", 0.09},
	{"Skin_INS_Soldier_AR_DZ", 0.05},
	{"Skin_INS_Soldier_CO_DZ", 0.04}
	};

//Специфицированные скины
	specialclothes[] = {
	{"Skin_Ins_Soldier_GL_DZ", 0.05},
	{"Skin_GUE_Commander_DZ", 0.08},
	{"Skin_Bandit1_DZ", 0.08},
	{"Skin_Bandit2_DZ", 0.06},
	{"Skin_BanditW1_DZ", 0.07},
	{"Skin_BanditW2_DZ", 0.07},
	{"Skin_TK_INS_Soldier_EP1_DZ", 0.05},
	{"Skin_TK_INS_Warlord_EP1_DZ", 0.07},
	{"Skin_SurvivorWcombat_DZ", 0.08},
	{"Skin_SurvivorWdesert_DZ", 0.08},
	{"Skin_GUE_Soldier_MG_DZ", 0.05},
	{"Skin_GUE_Soldier_Sniper_DZ", 0.04},
	{"Skin_GUE_Soldier_Crew_DZ", 0.04},
	{"Skin_GUE_Soldier_CO_DZ", 0.04},
	{"Skin_GUE_Soldier_2_DZ", 0.04},
	{"Skin_TK_Special_Forces_MG_EP1_DZ", 0.02},
	{"Skin_TK_Soldier_Sniper_EP1_DZ", 0.02},
	{"Skin_TK_Commander_EP1_DZ", 0.02},
	{"Skin_RU_Soldier_Crew_DZ", 0.02},
	{"Skin_INS_Lopotev_DZ", 0.02}
	};

//Палатки
	tents[] = {
	{"WeaponHolder_ItemTentOld", 0.03},
	{"WeaponHolder_ItemTentDomed", 0.01},
	{"WeaponHolder_ItemTentDomed2", 0.01}
	};

//Рюкзаки
	backpacks[] = {
	{"DZ_Assault_Pack_EP1", 0.25},
	{"DZ_Czech_Vest_Puch", 0.23},
	{"DZ_TerminalPack_EP1", 0.14},
	{"DZ_ALICE_Pack_EP1", 0.12},
	{"DZ_TK_Assault_Pack_EP1", 0.1},
	{"DZ_CompactPack_EP1", 0.07}
	};

//Военные рюкзаки
	militarybackpacks[] = {
	{"DZ_British_ACU", 0.3},
	{"DZ_GunBag_EP1", 0.25},
	{"DZ_CivilBackpack_EP1", 0.3},
	{"DZ_Backpack_EP1", 0.03},
	{"DZ_LargeGunBag_EP1", 0.01}
	};

//Патроны на пулеметы
	militaryammo[] = {
	{"2000Rnd_762x51_M134", 0.01},
	{"29Rnd_30mm_AGS30", 0.1},
	{"50Rnd_127x107_DSHKM", 0.1},
	{"48Rnd_40mm_MK19", 0.1},
	{"100Rnd_127x99_M2", 0.06}
	};

//Пистолеты
	pistols[] = {
	{"Makarov", 0.5},
	{"Colt1911", 0.2},
	{"revolver_EP1", 0.2},
	{"glock17_EP1", 0.15},
	{"MakarovSD", 0.08},
	{"M9", 0.13},
	{M9SD, 0.03},
	{"revolver_gold_EP1", 0.01}
	};

//Дробовики
	shotgunsingleshot[] = {
	{"Winchester1866", 0.05},
	{"LeeEnfield", 0.12},
	{MR43, 0.2},
	{"Saiga12K", 0.03},
	{"Remington870_lamp", 0.13},
	{"Crossbow_DZ", 0.2},
	{M1014, 0.15}
	};

//Фермы-амбары-коровники
	farmweapons[] = {
	{"Winchester1866", 0.15},
	{"LeeEnfield", 0.1},
	{MR43, 0.2},
	{"Saiga12K", 0.05},
	{"Remington870_lamp", 0.15},
	{"Crossbow_DZ", 0.3},
	{"huntingrifle", 0.02},
	{"Chainsaw", 0.01}
	};

//Снайперские винтовки
	sniperrifles[] = {
	{AK_107_PSO, 0.25},
	{M4SPR, 0.3},
	{M40A3, 0.12},
	{SVD_CAMO, 0.05},
	{"SVD_des_EP1", 0.05},
	{SVD, 0.06},
	{"huntingrifle", 0.27},
	{"M24_des_EP1", 0.06},
	{M24, 0.06},
	{"BAF_LRR_scoped", 0.02},
	{KSVK_DZE, 0.02},
	{"VSS_vintorez", 0.04},
	{"SCAR_H_LNG_Sniper_SD", 0.03},
	{M14_EP1, 0.08},
	{DMR, 0.06},
	{"M107_DZ ", 0.01} //M107_DZ  0.01
	};

//Патроны к снайперским винтовкам
	sniperriflesammo[] = {
	{"30Rnd_545x39_AKSD", 0.18},
	{"5Rnd_127x108_KSVK", 0.01},
	{"5Rnd_86x70_L115A1", 0.01},
	{"10Rnd_762x54_SVD", 0.1},
	{"20Rnd_762x51_DMR", 0.1},
	{"5Rnd_762x51_M24", 0.15},
	{"5x_22_LR_17_HMR", 0.25},
	{"20Rnd_762x51_SB_SCAR", 0.03},
	{"20Rnd_9x39_SP5_VSS", 0.05},
	{"10rnd_127x99_m107", 0.02} //патроны длЯ M107_DZ 
	};

//Пистолеты-пулеметы
	submachinegun[] = {
	{UZI_EP1, 0.25},
	{"bizon", 0.2},
	{"Sa61_EP1", 0.3},
	{MP5A5, 0.25},
	{"bizon_silenced", 0.03},
	{UZI_SD_EP1, 0.25},
	{MP5SD, 0.03}
	};

//Штурмовые винтовки
	assaultrifles[] = {
	{"AKS_74_kobra", 0.5},
	{AKS_74_U, 0.5},
	{AKS_GOLD, 0.01},
	{AK_47_M, 0.5},
	{AK_74, 0.5},
	{FN_FAL, 0.1},
	{FN_FAL_ANPVS4, 0.03},
	{"G36A_camo", 0.5},
	{G36C, 0.4},
	{"G36C_camo", 0.3},
	{"G36K_camo", 0.3},
	{"G36_C_SD_camo", 0.5},
	{M16A2, 0.5},
	{M16A2GL, 0.25},
	{M16A4_ACG, 0.25},
	{M4A1, 0.5},
	{"M4A1_Aim", 0.4},
	{"M4A1_AIM_SD_camo", 0.2},
	{"M4A1_HWS_GL_camo", 0.25}, 
	{M4A3_CCO_EP1, 0.3},
	{"Sa58P_EP1", 0.4},
	{"Sa58V_CCO_EP1", 0.2},
	{"Sa58V_EP1", 0.45},
	{"Sa58V_RCO_EP1", 0.15},
	{"m8_compact", 0.4},
	{"m8_sharpshooter", 0.2},
	{"m8_holo_sd", 0.2},
	{"m8_carbine", 0.25},
	{BAF_L85A2_RIS_SUSAT, 0.2},
	{"SCAR_L_CQC_CCO_SD", 0.05},
	{"SCAR_L_STD_EGLM_RCO", 0.04},
	{"SCAR_H_STD_EGLM_Spect", 0.03},
	{"BAF_L85A2_RIS_Holo", 0.06},
	{"M4A1_HWS_GL_SD_Camo", 0.09}
	};

//Патроны к штурмовым винтовкам
	assaultrifleammo[] = {
	{"30Rnd_762x39_SA58", 0.25},
	{"30Rnd_762x39_AK47", 0.2},
	{"30Rnd_556x45_Stanag", 0.15},
	{"30Rnd_545x39_AK", 0.1},
	{"30Rnd_556x45_StanagSD", 0.06},
	{"20Rnd_762x51_FNFAL", 0.03}
	};

//Тяжелое вооружение
	machineguns[] = {
	{RPK_74, 0.11},
	{M8_SAW, 0.2},
	{"Pecheneg_DZ", 0.05},
	{PK_DZ, 0.02},
	{"MG36_camo", 0.1},
	{M60A4_EP1_DZE, 0.05},
	{MG36, 0.1},
	{"M249_m145_EP1_DZE", 0.01},
	{"m240_scoped_EP1_DZE", 0.01},
	{M240_DZ, 0.07},
	{M249_EP1_DZ, 0.12},
	{"Mk_48_DZ", 0.05}
	};

//патроны к пулеметам в машинах
	machinegunammo[] = {
	{"100Rnd_556x45_BetaCMag", 0.12},
	{"75Rnd_545x39_RPK", 0.1},
	{"100Rnd_556x45_M249", 0.05},
	{"100Rnd_762x51_M240", 0.07},
	{"100Rnd_762x54_PK", 0.07},
	{"200Rnd_556x45_M249", 0.09}
	};


	machinegunammoexpl[] = {
	{"100Rnd_556x45_BetaCMag", 0.15},
	{"75Rnd_545x39_RPK", 0.15},
	{"100Rnd_556x45_M249", 0.06},
	{"100Rnd_762x51_M240", 0.08},
	{"100Rnd_762x54_PK", 0.4},
	{"200Rnd_556x45_M249", 0.8},
	{"PipeBomb", 0.01}
	};

//Слабые дробовики
	militaryshotguns[] = {
	{"Saiga12K", 0.1},
	{"Remington870_lamp", 0.35},
	{M1014, 0.4}
	};

};