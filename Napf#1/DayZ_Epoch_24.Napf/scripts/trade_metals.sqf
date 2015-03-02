/*
ADT-TEAM
*/
private ["_buy","_metals_conversion","_cancel"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_parts;s_player_parts = [];
s_player_parts_crtl = 1;

_metals_conversion = [ 
    ["ItemTopaz","ItemBriefcase80oz",1,1,"buy","Briefcase80oz","Topaz",99],
    ["ItemBriefcase80oz","ItemTopaz",1,1,"buy","Topaz","Briefcase80oz",99],
    
    ["ItemObsidian","ItemBriefcase90oz",1,1,"buy","Briefcase90oz","Obsidian",99],
    ["ItemBriefcase90oz","ItemObsidian",1,1,"buy","Obsidian","Briefcase90oz",99],    
    
    ["ItemRuby","ItemBriefcase100oz",1,3,"buy","Briefcase100oz","Ruby",99],
    ["ItemBriefcase100oz","ItemRuby",1,1,"buy","Ruby","Briefcase100oz",99],
	 
	["ItemSapphire","ItemBriefcase30oz",1,1,"buy","Briefcase30oz","Sapphire",99],
    ["ItemBriefcase30oz","ItemSapphire",1,1,"buy","Sapphire","Briefcase30oz",99],
	
	["ItemAmethyst","ItemBriefcase50oz",1,1,"buy","Briefcase50oz","Amethyst",99],
    ["ItemBriefcase50oz","ItemAmethyst",1,1,"buy","Amethyst","Briefcase50oz",99],
	
	["ItemEmerald","ItemBriefcase70oz",1,1,"buy","Briefcase70oz","Emerald",99],
    ["ItemBriefcase70oz","ItemEmerald",1,1,"buy","Emerald","Briefcase70oz",99],
	
	///["PartOreGold","ItemGoldBar",1,1,"buy","GoldBar","OreGold",99],
    //["ItemGoldBar","PartOreGold",1,1,"buy","OreGold","GoldBar",99],

    ["ItemCitrine","ItemBriefcase60oz",1,1,"buy","Briefcase60oz","Citrine",99],
    ["ItemBriefcase60oz","ItemCitrine",1,1,"buy","Citrine","Briefcase60oz",99]	
	
];

// Стат меню...
{
	//diag_log format["DEBUG TRADER: %1", _x];
	_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "custom\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
	s_player_parts set [count s_player_parts,_buy];
				
} count _metals_conversion;

//_cancel = player addAction ["Отмена", "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
_cancel = player addAction ["Cancel", "custom\trade_cancel.sqf",["na"], 0, true, false, "",""];
s_player_parts set [count s_player_parts,_cancel];

DZE_ActionInProgress = false;
