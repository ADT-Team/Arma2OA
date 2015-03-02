class S_RULES
{
idd = 1;
movingenable = true;
   
class Controls
{
class help_box: Box_help
{
	idc = -1;
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};
class hlp_frame: RscFrame_help
{
	idc = 1800;
	text = "Правила сервера";
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};

class hlp_text: RscHTML_Help
{
	idc = 1000;
	filename = "scripts\info\HELP.html";
  	text = "";
	x = 0.167872 * safezoneW + safezoneX;
	y = 0.122369 * safezoneH + safezoneY;
	w = 0.308559 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_html: RscHTML_Help
{

	idc = 1100;
	filename = "scripts\info\RULES.html";
  	text = "";
	x = 0.164376 * safezoneW + safezoneX;
	y = 0.268684 * safezoneH + safezoneY;
	w = 0.677395 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_button: RscButton_help
{
	idc = 1600;
	text = "Закрыть";
	x = 0.699277 * safezoneW + safezoneX;
	y = 0.85 * safezoneH + safezoneY;
	w = 0.0987937 * safezoneW;
	h = 0.0521053 * safezoneH;
	action = closedialog 0;
};
};
};


class S_FAQ
{
idd = 1;
movingenable = true;
   
class Controls
{
class help_box: Box_help
{
	idc = -1;
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};
class hlp_frame: RscFrame_help
{
	idc = 1800;
	text = "F.A.Q.";
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};

class hlp_text: RscHTML_Help
{
	idc = 1000;
	filename = "scripts\info\HELP.html";
  	text = "";	x = 0.167872 * safezoneW + safezoneX;
	y = 0.122369 * safezoneH + safezoneY;
	w = 0.308559 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_html: RscHTML_Help
{

	idc = 1100;
	filename = "scripts\info\FAQ.html";
  	text = "";
	x = 0.164376 * safezoneW + safezoneX;
	y = 0.268684 * safezoneH + safezoneY;
	w = 0.677395 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_button: RscButton_help
{
	idc = 1600;
	text = "Закрыть";
	x = 0.699277 * safezoneW + safezoneX;
	y = 0.85 * safezoneH + safezoneY;
	w = 0.0987937 * safezoneW;
	h = 0.0521053 * safezoneH;
	action = closedialog 0;
};
};
};

class S_craft
{
idd = 1;
movingenable = true;
   
class Controls
{
class help_box: Box_help
{
	idc = -1;
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};
class hlp_frame: RscFrame_help
{
	idc = 1800;
	text = "F.A.Q.";
	x = 0.14777 * safezoneW + safezoneX;
	y = 0.0789474 * safezoneH + safezoneY;
	w = 0.707986 * safezoneW;
	h = 0.844211 * safezoneH;
};

class hlp_text: RscHTML_Help
{
	idc = 1000;
	filename = "scripts\info\HELP.html";
  	text = "";	x = 0.167872 * safezoneW + safezoneX;
	y = 0.122369 * safezoneH + safezoneY;
	w = 0.308559 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_html: RscHTML_Help
{

	idc = 1100;
	filename = "scripts\info\CRAFT.html";
  	text = "";
	x = 0.164376 * safezoneW + safezoneX;
	y = 0.268684 * safezoneH + safezoneY;
	w = 0.677395 * safezoneW;
	h = 0.568422 * safezoneH;
};
class hlp_button: RscButton_help
{
	idc = 1600;
	text = "Закрыть";
	x = 0.699277 * safezoneW + safezoneX;
	y = 0.85 * safezoneH + safezoneY;
	w = 0.0987937 * safezoneW;
	h = 0.0521053 * safezoneH;
	action = closedialog 0;
};
};
};