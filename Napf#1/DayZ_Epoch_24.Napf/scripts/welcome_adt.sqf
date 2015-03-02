/* *********************************************************************** */
 
/* =======================================================================
/* SCRIPT NAME: Server Intro Credits Script by IT07
/* SCRIPT VERSION: v1.3.5 BETA
/* Credits for original script: Bohemia Interactive http://bistudio.com
/* =======================================================================
 
/* *********************************************************************** */
 
// ========== SCRIPT CONFIG ============
_onScreenTime = 6; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role
//NOTE: Above value is not in seconds!
 
// ==== HOW TO CUSTOMIZE THE CREDITS ===
// If you want more or less credits on the screen, you have to add/remove roles.
// Watch out though, you need to make sure BOTH role lists match eachother in terms of amount.
// Just take a good look at the _role1 and the rest and you will see what I mean.
 
// For further explanation of it all, I included some info in the code.
 
// == HOW TO CUSTOMIZE THE COLOR OF CREDITS ==
// Find line **** and look for: color='#f2cb0b'
// The numbers and letters between the 2 '' is the HTML color code for a certain yellow.
// If you want to change the color of the text, search on google for HTML color codes and pick the one your like.
// Then, replace the existing color code for the code you would like to use instead. Don't forget the # in front of it.
// HTML Color Codes Examples:
// #FFFFFF (white)
// #000000 (black) No idea why you would want black, but whatever
// #C80000 (red)
// #009FCF (light-blue)
// #31C300 (Razer Green)
// #FF8501 (orange)
// ===========================================
 
 
// SCRIPT START
 
waitUntil {!isNil "dayz_animalCheck"};
sleep 10; //Wait in seconds before the credits start after player IS ingame
 
_role1 = "Добро пожаловать на сервер";
_role1names = ["ADT-68 Napf 1.0.5.1/112555 NO CD"];
_role2 = "Администраторы";
_role2names = ["Mavet","cryptic"];
_role3 = "Версия";
_role3names = ["DayZ Napf"];
_role4 = "Группа ВКонтакте";
_role4names = ["VK.COM/ADT_68"];
_role5 = "Наш сайт";
_role5names = ["ADT-TEAM.RU"];
_role6 = "Основные нововведения";
_role6names = ["Переделанные трейд зоны", "Сейфзоны 300 м"];
_role7 = "Основные нововведения";
_role7names = ["Автопочинка техники на заправках за золото"];
_role8 = "Основные нововведения";
_role8names = ["Перезарядка вооружения техники на заправках за золото"];
_role9 = "Основные нововведения";
_role9names = ["Переведены торговцы", "Добавлены новые товары", "Анимированные хеликраши","Дополнительная информация ПКМ по карте"];
_role10 - "Вся дополнительная информация находится на форуме:";
_role10names = ["www.adt-team.ru/forum"];
 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names] //make SURE the last one here does NOT have a , at the end
];