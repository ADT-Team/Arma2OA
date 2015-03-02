//Assembled for the DayZ Epoch Community by jOoPs [MGC]
class RscActiveText
{
   access=0;
   type=11;
   style=2;
   h=0.050000;
   w=0.150000;
   font="TahomaB";
   sizeEx=0.040000;
   color[]={1,1,1,1};
   colorActive[]={1,0.500000,0,1};
   soundEnter[]={"",0.100000,1};
   soundPush[]={"",0.100000,1};
   soundClick[]={"",0.100000,1};
   soundEscape[]={"",0.100000,1};
   text="";
   default=0;
   shadow = 0;
};

class RscStructuredText
{
	class Attributes;
};
class RscStructuredTextGUI: RscStructuredText
{
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	class Attributes: Attributes
	{
		align = "center";
		valign = "middle";
	};
};

class DRN_DIALOG
{
	idd=-1;
	movingenable=true;
	class Controls
	{
		class Mainback: RscPicture
		{
			idc = 1200;
			text = "custom\spawn\spawn_bg.paa";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
		class RscSelectedRegion1 : RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_kamenka.paa";
			x = 0.524899 * safezoneW + safezoneX;
			y = 0.591199 * safezoneH + safezoneY;
			w = 0.234287 * safezoneW;
			h = 0.3044 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegion2: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_balota.paa";
			x = 0.230417 * safezoneW + safezoneX;
			y = 0.610615 * safezoneH + safezoneY;
			w = 0.223688 * safezoneW;
			h = 0.270356 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 1;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegion3: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_cherno.paa";
			x = 0.234564 * safezoneW + safezoneX;
			y = 0.116375 * safezoneH + safezoneY;
			w = 0.234375 * safezoneW;
			h = 0.275 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 2;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegion4: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_elektro.paa";
			x = 0.212005 * safezoneW + safezoneX;
			y = 0.371473 * safezoneH + safezoneY;
			w = 0.234683 * safezoneW;
			h = 0.274546 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 3;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegion5: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_sol.paa";
			x = 0.565892 * safezoneW + safezoneX;
			y = 0.365922 * safezoneH + safezoneY;
			w = 0.246438 * safezoneW;
			h = 0.275001 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 4;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegion6: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_berezino.paa";
			x = 0.517793 * safezoneW + safezoneX;
			y = 0.13013 * safezoneH + safezoneY;
			w = 0.234375 * safezoneW;
			h = 0.275 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 5;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class RscSelectedRegionRandom: RscActiveText
		{
			idc = -1;
			style = 48;
			text = "custom\spawn\spawn_random.paa";
			x = 0.420865 * safezoneW + safezoneX;
			y = 0.336926 * safezoneH + safezoneY;
			w = 0.168843675 * safezoneW;
			h = 0.331135035 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;spawnSelect = 6;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
	};
};
