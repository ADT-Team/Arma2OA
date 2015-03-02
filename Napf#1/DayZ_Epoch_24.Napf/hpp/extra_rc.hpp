class ExtraRc {	

    class ItemBloodbag {
        class Use {
            text = "Применить";
            script = "execVM 'scripts\medical\player_selfbloodbag.sqf';";
        };
    }; 
	
	class Binocular {
		class Dis0 {
            text = "Видимость. 500m";
            script = "setViewDistance 500;";
        };
        class Dis1 {
            text = "Видимость. 1000m";
            script = "setViewDistance 1000;";
        };      
		class Dis2 {
            text = "Видимость. 2000m";
            script = "setViewDistance 2000;";
        };
		class Dis3 {
            text = "Видимость. 2500m";
            script = "setViewDistance 2500;";
        };
		class Dis4 {
            text = "Видимость. 3000m";
            script = "setViewDistance 3000;";
        };
		class Dis5 {
            text = "Видимость. 5000m";
            script = "setViewDistance 5000;";
        };
    };	
	class Binocular_Vector {
		class Dis0 {
            text = "Видимость. 500m";
            script = "setViewDistance 500;";
        };
        class Dis1 {
            text = "Видимость. 1000m";
            script = "setViewDistance 1000;";
        };      
		class Dis2 {
            text = "Видимость. 2000m";
            script = "setViewDistance 2000;";
        };
		class Dis3 {
            text = "Видимость. 2500m";
            script = "setViewDistance 2500;";
        };
		class Dis4 {
            text = "Видимость. 3000m";
            script = "setViewDistance 3000;";
        };
		class Dis5 {
            text = "Видимость. 5000m";
            script = "setViewDistance 5000;";
        };
    };
	/*
	class Colt1911 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};
	class glock17_EP1 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};

	class M9 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class M9SD {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};
	class Makarov {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class MakarovSD {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	class revolver_EP1 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};	
	*/
	class ItemZombieParts {
		class cover {
			text = "Обмазаться";
			script = "execVM 'custom\player_zombieCover.sqf';";
		};
	};
	
	class ItemRadio {
    class GroupManagement {
       text = "Управление группой";
       script = "[] execVM 'hpp\dzgm\loadGroupManagement.sqf'";
     };
	 };
	 
    class ItemNewspaper {
	class ItemNewspaper {
		text = "Читать газету";					
		script = "execVM 'scripts\craft\gazeta.sqf'";
		};
	};	
	 
	class ItemKnife {
        class farmhemp {
            text = "Нарезать травки";
            script = "execVM 'scripts\adt\hemp.sqf'";
        };
    };
	
	class ItemKiloHemp {
        class smokeweed {
            text = "Укуриться";
            script = "execVM 'scripts\adt\smokeshit.sqf'";
        };
    };
		
	class PartOreGold {
		class PartOreGold {
			text = "Переплавить";
            script = "execVM 'scripts\craft\oregold.sqf'";
        };
	};		

    class PartOreSilver {
		class PartOreSilver {
			text = "Переплавить";					
			script = "execVM 'scripts\craft\oresilver.sqf'";
		};
	};	

    class PartOre {
		class PartOre {
			text = "Переплавить";					
			script = "execVM 'scripts\craft\oreiron.sqf'";
		};
	};
    /*
	class AKS_GOLD {
		class AKS_GOLD {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\akm_gold.sqf'";
		};
	};
	
	class revolver_gold_EP1 {
		class revolver_gold_EP1 {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\rev_gold.sqf'";
    	};
	};*/
	
	class ItemSandbag {
		class sement {
            text = "Создать: CinderBlocks";
            script = "execVM 'scripts\craft\CinderBlocks.sqf'";
        };
	};
	
    class MortarBucket {
		class pesok {
			text = "Создать: CinderBlocks";
            script = "execVM 'scripts\craft\CinderBlocks.sqf'";
        };
	};
	
    class Skin_Survivor2_DZ {
		class craft_canv {
			text = "Создать: Canvas";
            script = "execVM 'scripts\craft\Canvas.sqf'";
        };
	};
	
	/*
	class pravila {
		text = "Правила сервера";
		script = "execVM 'scripts\rules_adt.sqf'";
		};
	};*/
	
	class ItemEpinephrine{
		class ItemEpinephrine {
			text = "Принять";					
			script = "execVM 'scripts\medical\color_epi_use.sqf'";
		};
    };
	/*
	class Kostey_notebook {
		
		class RULES {
			text = "Правила";
			script = "_SRULED = createdialog ""S_RULES""";
		};
		class FAQ {
			text = "О сервере/FAQ";
			script = "_SFAQD = createdialog ""S_FAQ""";
		};
		class craft {
			text = "О системе крафта";
			script = "_Scraft = createdialog ""S_craft""";
		};
	};
	*/
	
	
   //////////////////////ADT-Team//////////////////////////////	
    class ItemGoldBar {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };    
	class ItemGoldBar2oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar3oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar4oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar5oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar6oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar7oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar8oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar9oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemGoldBar10oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar2oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar3oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar4oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar5oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar6oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar7oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar8oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar9oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemSilverBar10oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseEmpty {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase10oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase20oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase30oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase40oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase50oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase60oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase70oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase80oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase90oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcase100oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS10oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS20oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS30oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS40oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS50oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS60oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS70oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS80oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS90oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	class ItemBriefcaseS100oz {
        class Combine {
            text = "Скомпоновать валюту";
            script = "execVM 'scripts\combineCurrency.sqf'";
        };
    };
	
	 class M9 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
    class M9 {
                        text = "+ Глушитель";
                        script = "[""M9"",[""ItemToolbox""],[[""TrashTinCan"",2]],[],""M9SD"",""Глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
	};
    class M9SD {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
	class M9SD {

                        text = "- Глушитель";

                        script = "[""M9SD"",""ItemToolbox"",""PartGeneric"","""",""M9"",""Глушитель удален""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
    };	
    class Makarov {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
	class Makarov {
                        text = "+ Глушитель";
                        script = "[""Makarov"",[""ItemToolbox""],[[""TrashTinCan"",2]],[],""MakarovSD"",""Глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
    };
	
	
	
    class revolver_EP1 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
		
		
	class revolver_EP1 {
                        text = "Сделать Золотым";
                        script = "[""revolver_EP1"",[""ItemToolbox""],[[""PartOreGold"",8]],[],""revolver_gold_EP1"",""Золотой револьвер добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
    };	
    class UZI_EP1 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
	class UZI_EP1 {
                        text = "+ Глушитель";
                        script = "[""UZI_EP1"",[""ItemToolbox""],[[""TrashTinCan"",2]],[],""UZI_SD_EP1"",""Глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
    };	
    class Sa61_EP1 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
    };	
    class Colt1911 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
    };
	
	class glock17_EP1 {
		class suicide {
			text = "Самоубийство";
			script = "execVM 'custom\player_suicide.sqf';";
		};
	};
	
    class UZI_SD_EP1 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
	class UZI_SD_EP1 {

                        text = "- Глушитель";

                        script = "[""UZI_SD_EP1"",""ItemToolbox"",""PartGeneric"","""",""UZI_EP1"","" Глушитель удален""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
    };
    class revolver_gold_EP1 {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
		
		class ADT_revolver_gold {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\rev_gold.sqf'";
			};
		
	class revolver_gold_EP1 {

                        text = "Убрать позолоту";

                        script = "[""revolver_gold_EP1"",""ItemKeyKit"",""ItemGoldBar"","""",""revolver_EP1"",""Кадыров больше не завидует тебе""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
    };	
    class MakarovSD {
        class CommitSuicide {
            text = "Самоубийство";
            script = "execVM ""custom\player_suicide.sqf"";";
        };
	class MakarovSD {

                        text = "- Глушитель";

                        script = "[""MakarovSD"",""ItemToolbox"",""PartGeneric"","""",""Makarov"",""Глушитель удален""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
    };
	//weapons

//Sa58V
        class Sa58V_EP1 {
                class Sa58V_EP1 {
                        text = "+ ACOG";
                        script = "[""Sa58V_EP1"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular_Vector""],""Sa58V_RCO_EP1"",""ACOG Scope добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class Sa58V_EP12 {
                        text = "+ Каллиматор";
                        script = "[""Sa58V_EP1"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""Sa58V_CCO_EP1"",""Каллиматор добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };	
		class Sa58V_RCO_EP1 {

                class Sa58V_RCO_EP1 {

                        text = "- ACOG";

                        script = "[""Sa58V_RCO_EP1"",""ItemToolbox"",""PartGeneric"","""",""Sa58V_CCO_EP1"",""- ACOG""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
		
//AK-74
        class AK_74 {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class akgl {
                        text = "+ Подствольник";
                        script = "[""AK_74"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""AK_74_GL"",""Подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class aks {
                        text = "Складной Приклад";
                        script = "[""AK_74"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""AKS_74"",""Добавлен складной приклад""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
			
				  class toRPK_74 {
                        text = "Апгрей до RPK 74";
                        script = "[""AK_74"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[],""RPK_74"",""Апгрей до RPK 74""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				
        };
 
 class RPK_74 {
                class topech {
                        text = "Апгрей до ПКМ";
                        script = "[""RPK_74"",[""ItemToolbox""],[[""PartGeneric"",3],[""ItemPole"",2]],[],""PK_DZ"",""Апгрей до ПКМ""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
  };
  
   class PK_DZ {
                class topech {
                        text = "Апгрей до Печенега";
                        script = "[""PK_DZ"",[""ItemToolbox""],[[""PartGeneric"",3],[""ItemPole"",2]],[],""Pecheneg_DZ"",""Апгрей до Печенега""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
  };
        class AK_74_GL {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class akglkobra {
                        text = "+ Каллиматор";
                        script = "[""AK_74_GL"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""AK_74_GL_kobra"",""Каллиматор добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class ak_remgl {

                        text = "- Подствольник";

                        script = "[""AK_74_GL"",""ItemToolbox"",""PartGeneric"","""",""AK_74"",""- Подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
		 class AK_74_GL_kobra {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class akgl_remkobra {

                        text = "- Каллиматор";

                        script = "[""AK_74_GL_kobra"",""ItemToolbox"",""PartGeneric"","""",""AK_74_GL"",""- Каллиматор""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
        class AKS_74 {
                class aks74kobra {
                        text = "+ Каллиматор";
                        script = "[""AKS_74"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""AKS_74_kobra"",""Каллиматор добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class aks74pso {
                        text = "+ ПСО-1";
                        script = "[""AKS_74"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular_Vector""],""AKS_74_pso"",""PSO Scope установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class aks74nspu {
                        text = "+ НВ прицел";
                        script = "[""AKS_74"",[""ItemToolbox""],[[""PartGeneric"",2]],[""NVGoggles""],""AKS_74_NSPU"",""Прицел НВ установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class aks_remstock {

                        text = "Убрать обвес";

                        script = "[""AKS_74"",""ItemToolbox"",""PartGeneric"","""",""AK_74"",""обвес убран""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
		 class AKS_74_kobra {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
               class toak107 {
                        text = "Апгрейд до АК 107";
                        script = "[""AKS_74_kobra"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[],""AK_107_kobra"",""Апгрейд до АК 107""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class aks_remkobra {

                        text = "- Каллиматор";

                        script = "[""AKS_74_kobra"",""ItemToolbox"",""PartGeneric"","""",""AKS_74"",""- Каллиматор""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };

        class AKS_74_pso {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class aks_rempso {

                        text = "- ПСО-1";

                        script = "[""AKS_74_pso"",""ItemToolbox"",""PartGeneric"","""",""AKS_74"",""- ПСО-1""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };

        class AKS_74_NSPU {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class aks_remnspu {

                        text = "- НВ прицел";

                        script = "[""AKS_74_NSPU"",""ItemToolbox"","""",""NVGoggles"",""AKS_74"",""- НВ прицел""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };

       
//AK-107
        class AK_107_kobra {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class ak107gl {
                        text = "+ Подствольник";
                        script = "[""AK_107_kobra"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""AK_107_GL_kobra"",""Подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class ak107pso {
                        text = "+ ПСО-1";
                        script = "[""AK_107_kobra"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""AK_107_pso"",""PSO Scope установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
        class AK_107_pso {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class ak107pso {
                        text = "+ Подствольник";
                        script = "[""AK_107_pso"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""AK_107_GL_pso"",""Подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class ak107rempso {

                        text = "- ПСО-1";

                        script = "[""AK_107_pso"",""ItemToolbox"",""PartGeneric"","""",""AK_107_kobra"",""- ПСО-1""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
		 class AK_107_GL_kobra {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class ak107remgl {

                        text = "- Подствольник";

                        script = "[""AK_107_GL_kobra"",""ItemToolbox"",""PartGeneric"","""",""AK_107_kobra"",""- Подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };

        class AK_107_GL_pso {
				magazines[] = {"30Rnd_545x39_AK", "30Rnd_545x39_AKSD", "75Rnd_545x39_RPK"};
                class ak107psoremgl {

                        text = "- Подствольник";

                        script = "[""AK_107_GL_pso"",""ItemToolbox"",""PartGeneric"","""",""AK_107_pso"",""- Подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
//bizon
        class bizon {
                class bizonsd {
                        text = "+ Глушитель";
                        script = "[""bizon"",[""ItemToolbox""],[[""TrashTinCan"",2]],[],""bizon_silenced"",""Глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
		 class bizon_silenced {

                class bizonremsd {

                        text = "- Глушитель";

                        script = "[""bizon_silenced"",""ItemToolbox"",""PartGeneric"","""",""bizon"",""- Глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
//AKM
        class AK_47_M {
                class akms {
                        text = "Складной приклад";
                        script = "[""AK_47_M"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""AK_47_S"",""Добавлен складной приклад""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
        class AK_47_S {
                class aks74gold {
                        text = "Сделать золотым";
                        script = "[""AK_47_S"",[""ItemToolbox""],[[""PartOreGold"",10]],[],""AKS_GOLD"",""Теперь даже Кадыров завидует тебе""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				 class akm {

                        text = "Убрать обвес";

                        script = "[""AK_47_S"",""ItemToolbox"",""PartGeneric"","""",""AK_47_M"",""обвес убран""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
				  class aksd {
                        text = "AKS-74U";
                        script = "[""AK_47_S"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""AKS_74_U"",""AKS-74U""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
				};
				
        };
		
		 class AKS_GOLD {
            class ADT_gold_ak {
			text = "Переплавить в золото";					
			script = "execVM 'scripts\craft\akm_gold.sqf'";
		};
                class aks_remstock {

                        text = "Убрать позолоту";

                        script = "[""AKS_GOLD"",""ItemKeyKit"",""ItemGoldBar"","""",""AK_47_S"",""Кадыров больше не завидует тебе""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
//AKS74U
        class AKS_74_U {
                class aksd {
                        text = "Глушитель + Каллиматор";
                        script = "[""AKS_74_U"",[""ItemToolbox""],[[""PartGeneric"",2]],[""Binocular""],""AKS_74_UN_kobra"",""глушитель + прицел добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
				};
        };
		      class AKS_74_UN_kobra {

                class aksu {

                        text = "- Глушитель и Каллиматор";

                        script = "[""AKS_74_UN_kobra"",""ItemToolbox"",""PartGeneric"","""",""AKS_74_U"",""- Глушитель и Каллиматор""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
//M24
        class M24 {
                class M24camodes {
                        text = "Песочный камуфляж";
                        script = "[""M24"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""M24_des_EP1"",""Пустынный камуфляж добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
		  class M24_des_EP1 {

                class svd_remcam {

                        text = "- камуфляж";

                        script = "[""M24_des_EP1"",""ItemKnife"",""ItemCanvas"","""",""M24"",""- камуфляж""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
		
	class LeeEnfield {
                class toM14_EP1 {
                        text = "+ Калиматор";
                        script = "[""LeeEnfield"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular_Vector""],""M14_EP1"",""Калиматор установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };	
				class tohun {
                        text = "+ Прицел";
                        script = "[""LeeEnfield"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""huntingrifle"",""Прицел установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };	
				};
			class M14_EP1 {
                class toM14_EP2 {
                        text = "+ Прицел";
                        script = "[""M14_EP1"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""huntingrifle"",""Прицел установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };	
				};
				
				/*
			class huntingrifle {
                class toM14_EP3 {
                        text = "Переделать в SVD";
                        script = "[""huntingrifle"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""SVD"",""SVD""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };	
				};
				*/
//SVD
        class SVD {
                class svdcamo {
                        text = "Лесная раскраска";
                        script = "[""SVD"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""SVD_CAMO"",""Лесной камуфляж""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class svdcamodes {
                        text = "Пустынный камуляж";
                        script = "[""SVD"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""SVD_des_EP1"",""Пустынный камуляж""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class svdnspu {
                        text = "Прицел НВ";
                        script = "[""SVD"",[""ItemToolbox""],[[""PartGeneric"",1]],[""NVGoggles""],""SVD_NSPU_EP1"",""Прицел НВ добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
////US Weapons
//M4's
        class M4A1 {
                class m4a1cco {
                        text = "+ ССО прицел";
                        script = "[""M4A1"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""M4A1_Aim"",""CCO Sight установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class m4a1holo {
                        text = "Holo прицел + M203";
                        script = "[""M4A1"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""Binocular""],""M4A1_HWS_GL"",""Holo + M203 установлены""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class m4a1rco {
                        text = "RCO прицел + M203";
                        script = "[""M4A1"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""Binocular""],""M4A1_RCO_GL"",""RCO + M203 установлены""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
        class M4A1_Aim {
                class m4a1camo {
                        text = "+ каммуфляж";
                        script = "[""M4A1_Aim"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""M4A1_Aim_camo"",""камуфляж добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class tom4spr{
                        text = "+ Прицел";
                        script = "[""M4A1_Aim"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[""Binocular_Vector""],""M4SPR"",""Прицел установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				class m4a1 {

                        text = "- ССО прицел";

                        script = "[""M4A1_Aim"",""ItemToolbox"",""PartGeneric"","""",""M4A1"",""- ССО прицел""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
        class M4A1_HWS_GL {
                class M4A1_HWS_GL_1 {
                        text = "+ каммуфляж";
                        script = "[""M4A1_HWS_GL"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""M4A1_HWS_GL_camo"",""камуфляж добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				 class M4A1_HWS_GL_2 {

                        text = "- Holo прицел + M203";

                        script = "[""M4A1_HWS_GL"",""ItemToolbox"",""PartGeneric"","""",""M4A1"",""- Holo прицел + M203""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
		 class M4A1_RCO_GL {

                class m4a1_3 {

                        text = "- RCO прицел + M203";

                        script = "[""M4A1_RCO_GL"",""ItemToolbox"",""PartGeneric"","""",""M4A1"",""- RCO прицел + M203""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
        class M4A1_Aim_camo {
                class m4a1ccosd {
                        text = "+ глушитель";
                        script = "[""M4A1_Aim_camo"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""M4A1_AIM_SD_camo"",""Глушитель добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				   class m4a1_4 {

                        text = "- каммуфляж";

                        script = "[""M4A1_Aim_camo"",""ItemKnife"",""ItemCanvas"","""",""M4A1_Aim"",""- каммуфляж""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
		
        class M4A1_HWS_GL_camo {
                class M4A1_HWS_GL_camo_1 {
                        text = "+ глушитель";
                        script = "[""M4A1_HWS_GL_camo"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""M4A1_HWS_GL_SD_Camo"",""Глушитель добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class M4A1_HWS_GL_camo_2 {

                        text = "- каммуфляж";

                        script = "[""M4A1_HWS_GL_camo"",""ItemKnife"",""ItemCanvas"","""",""M4A1_HWS_GL"",""- каммуфляж""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };    
   class M4A1_AIM_SD_camo {

                class m4a1camo {

                        text = "- глушитель";

                        script = "[""M4A1_AIM_SD_camo"",""ItemToolbox"",""PartGeneric"","""",""M4A1_Aim_camo"",""- глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };		
//MP5
        class MP5A5 {
                class mp5_sd {
                        text = "+ глушитель";
                        script = "[""MP5A5"",[""ItemToolbox""],[[""PartGeneric"",1]],[],""MP5SD"",""Глушитель добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
		class MP5SD {

                class mp5remsd {

                        text = "- глушитель";

                        script = "[""MP5SD"",""ItemToolbox"",""PartGeneric"","""",""MP5A5"",""- глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };

        };
//M16 a2
        class M16A2 {
                class m16a2gl {
                        text = "+ подствольник";
                        script = "[""M16A2"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""M16A2GL"",""Grenade Launcher установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class m16a2upa42 {
                        text = "Апгрейд до M16A4";
                        script = "[""M16A2"",[""ItemToolbox""],[[""PartGeneric"",2]],[],""M16A4"",""Апгрейд M16A4 завершен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				/*
				class toM249_EP1_DZ {
                        text = "Переделать в пулемет";
                        script = "[""M16A2"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[],""M249_EP1_DZ"",""Переделан в пулемет""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };*/
        };
        class M16A2GL {
                class m16a2upa4 {
                        text = "Апгрейд до M16A4 M203";
                        script = "[""M16A2GL"",[""ItemToolbox""],[[""PartGeneric"",2]],[],""M16A4_GL"",""Апгрейд M16A4 M203 завершен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				  class m16a2remgl {

                        text = "- подствольник";

                        script = "[""M16A2GL"",""ItemToolbox"",""PartGeneric"","""",""M16A2"",""- подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
//M16 a4
        class m16a4 {
                class m16a4_acg {
                        text = "+ ACOG";
                        script = "[""m16a4"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular_Vector""],""m16a4_acg"",""Acog Scope добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class m16a4_gl {
                        text = "+ подствольник";
                        script = "[""m16a4"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""M16A4_GL"",""Подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
        class m16a4_acg {
                class m16remcco1 {
                        text = "+ подствольник";
                        script = "[""m16a4_acg"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[],""M16A4_ACG_GL"",""Подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				 class m16remcco {

                        text = "- ACOG";

                        script = "[""m16a4_acg"",""ItemToolbox"",""PartGeneric"","""",""m16a4"",""- ACOG""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
        class M16A4_GL {
                class m16a4addacg {
                        text = "+ ACOG";
                        script = "[""M16A4_GL"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular_Vector""],""M16A4_ACG_GL"",""Acog Scope установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				class m16a4remgl1 {

                        text = "- подствольник";

                        script = "[""M16A4_GL"",""ItemToolbox"",""PartGeneric"","""",""m16a4"",""- подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
				 class m16downgrade {

                        text = "Ухудшить до M16A2 GL";

                        script = "[""M16A4_GL"",""ItemToolbox"",""PartGeneric"","""",""M16A2GL"",""M16A2 GL""]execVM ""scripts\up_downgrades\downgrades.sqf"";";

                };
        };
        class M16A4_ACG_GL {
                class m16a4remgl2 {
                        text = "- подствольник";
                        script = "[""M16A4_ACG_GL"",""ItemToolbox"",""PartGeneric"","""",""m16a4_acg"",""- подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
                class m16a4remAcog {
                        text = "- ACOG";
                        script = "[""M16A4_ACG_GL"",""ItemToolbox"",""PartGeneric"","""",""M16A4_GL"",""- ACOG""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
//FAL /////////////////////
        class FN_FAL {
                class falnv {
                        text = "+ ПНВ";
                        script = "[""FN_FAL"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""NVGoggles""],""FN_FAL_ANPVS4"",""ПНВ установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
        class FN_FAL_ANPVS4 {
                class fal {
                        text = "- ПНВ";
                        script = "[""FN_FAL_ANPVS4"",""ItemToolbox"","""",""NVGoggles"",""FN_FAL"",""ПНВ удален""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
//G36
        class G36C_camo {
                class g36ccsd {
                        text = "+ коллиматор и глушитель";
                        script = "[""G36C_camo"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""Binocular""],""G36_C_SD_camo"",""Коллиматор и глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class G36C_camo {
                        text = "- Камуфляж";
                        script = "[""G36C_camo"",""ItemKnife"",""ItemCanvas"","""",""G36C"",""камуфляж удален""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
		
		
        class G36C {
                class g36csd {
                        text = "+ коллиматор и глушитель";
                        script = "[""G36C"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""Binocular_Vector""],""G36_C_SD_eotech"",""Коллиматор и глушитель установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				 class toMG36 {
                        text = "Переделать в MG36";
                        script = "[""G36C"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[""Binocular""],""MG36"",""MG36""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class G36C_camo {
                        text = "+ Камуфляж";
                        script = "[""G36C"",[""ItemKnife""],[[""ItemCanvas"",1]],[],""G36C_camo"","" Камуфляж добавлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
		
		
        class G36_C_SD_eotech {
                class g36c {
                        text = "- коллиматор и глушитель";
                        script = "[""G36_C_SD_eotech"",""ItemToolbox"",""PartGeneric"","""",""G36C"",""- коллиматор и глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
        class G36_C_SD_camo {
                class g36cc {
                        text = "- коллиматор и глушитель";
                        script = "[""G36_C_SD_camo"",""ItemToolbox"",""PartGeneric"","""",""G36C_camo"",""- коллиматор и глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };

   
//M8 compact
        class m8_compact {
                class m8_compact {
                        text = "+ коллиматор";
                        script = "[""m8_compact"",[""ItemToolbox""],[[""PartGeneric"",1],[""ItemPole"",1]],[""Binocular""],""m8_compact_pmc"",""+ коллиматор""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				
				 class m8_compactto {
                        text = "Переделать в винтовку";
                        script = "[""m8_compact"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[],""m8_carbine"",""Переделать переделан в m8_carbine""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				
        };
        class m8_compact_pmc {
                class m8_compact_pmc {
                        text = "- коллиматор";
                        script = "[""m8_compact_pmc"",""ItemToolbox"",""PartGeneric"","""",""m8_compact"",""- коллиматор""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
//M8 compact
        class m8_carbine {
                class m8_carbine_1 {
                        text = "+ подствольник";
                        script = "[""m8_carbine"",""[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[],""m8_carbineGL"",""подствольник установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class m8_carbine_2 {
                        text = "+ коллиматор";
                        script = "[""m8_carbine"",[""ItemToolbox""],[[""PartGeneric"",1]],[""Binocular""],""m8_carbine_pmc"",""коллиматор установлен""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
                class m8_carbine_3 {
                        text = "+ коллиматор и глушитель";
                        script = "[""m8_carbine"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[""Binocular_Vector""],""m8_holo_sd"",""коллиматор и глушитель установлены""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
               class tom8_sharpshooter {
                        text = "+ Прицел";
                        script = "[""m8_carbine"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",1]],[""Binocular_Vector""],""m8_sharpshooter "",""+ Прицел""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
				class M8_SAW {
                        text = "Переделать в пулемет";
                        script = "[""m8_carbine"",[""ItemToolbox""],[[""PartGeneric"",2],[""ItemPole"",2]],[""Binocular""],""M8_SAW"",""M8_SAW""]execVM ""scripts\up_downgrades\upgrades.sqf"";";
                };
        };
      
      
        class m8_carbineGL {
                class m8_carbineGL_1 {
                        text = "- подствольник";
                        script = "[""m8_carbineGL"",""ItemToolbox"",""PartGeneric"","""",""m8_carbine"",""- подствольник""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
        class m8_carbine_pmc {
                class m8_carbine_pmc_1 {
                        text = "- коллиматор";
                        script = "[""m8_carbine_pmc"",""ItemToolbox"",""PartGeneric"","""",""m8_carbine"",""- коллиматор""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };
        class m8_holo_sd {
                class m8_holo_sd_1 {
                        text = "- коллиматор и глушитель";
                        script = "[""m8_holo_sd"",""ItemToolbox"",""PartGeneric"","""",""m8_carbine"",""- коллиматор и глушитель""]execVM ""scripts\up_downgrades\downgrades.sqf"";";
                };
        };

	class ItemMap {
	class RULES {
		text = "Правила";
		script = "_SRULED = createdialog ""S_RULES""";
		};
	class FAQ {
		text = "О сервере";
		script = "_SFAQD = createdialog ""S_FAQ""";
		};
	class CRAFT {
		text = "Система крафта";
		script = "_Scraft = createdialog ""S_craft""";
		};
	class Morphine {
		text = "Морфий";					
		script = "execVM 'scripts\craft\morphine.sqf'";
		};
	};
		
		
		/*
		class MR43 {

                class ChainSaw {

                        text = "Переделать в бензопилу";

                        script = "[""MR43"",[""ItemToolbox"",""ItemKeyKit""],[[""PartGeneric"",3],[""PartEngine"", 1],[""ItemWire"", 2],[""ItemTankTrap"", 2],[""ItemPole"", 2]],[],""ChainSaw"",""Бензопила создана""]execVM ""scripts\up_downgrades\upgrades.sqf"";";

                };
     };
	 
	 class ItemWaterbottleUnfilled {
 class gr {
 text = "Создать гранату";
  script = "[[""ItemToolbox"",""ItemKeyKit""],[[""HandRoadFlare"",1],[""2Rnd_shotgun_74Pellets"",3],[""PartGeneric"",1],[""ItemWaterbottleUnfilled"",1]],[],""handgrenade_east"",""Граната создана"",""EvKobalt"",""granat""]execVM ""scripts\up_downgrades\create.sqf"";";
   };
 };
 
 class PipeBomb {

 class gr {
 text = "в MAAWS заряд";
 script = "[[""ItemToolbox"",""ItemKeyKit""],[[""PartGeneric"",6],[""PartFueltank"",1]],[""ItemToolbox"",""ItemKeyKit""],""MAAWS_HEAT"",""Заряд создан"",""EvKobalt"",""maaws""]execVM ""scripts\up_downgrades\create.sqf"";";
         };west
};
 

class handgrenade_east {
 class Bomb {
 text = "Создать с4";
 script = "[[""ItemToolbox"",""ItemKeyKit""],[[""PartGeneric"",4],[""handgrenade_east"",6],[""ItemComboLock"",1],[""TrashTinCan"",1]],[""ItemWatch"",""ItemKeyKit""],""PipeBomb"",""c4 создана"",""EvKobalt"",""c4""]execVM ""scripts\up_downgrades\create.sqf"";";
          };
	class GP25 {
 text = "Создать гранату ГП25";
 script = "[[""ItemToolbox""],[[""PartGeneric"",1],[""handgrenade_west"",1]],[],""1Rnd_HE_GP25"",""ГП25 создана"",""EvKobalt"",""GP25""]execVM ""scripts\up_downgrades\create.sqf"";";
          };
	};	

class handgrenade_west {
	 class M203 {
 text = "Создать гранату M203";
 script = "[[""ItemToolbox""],[[""PartGeneric"",1],[""handgrenade_east"",1]],[],""1Rnd_HE_M203"",""M203 создана"",""EvKobalt"",""M203""]execVM ""scripts\up_downgrades\create.sqf"";";
          };
      };	
  */
};