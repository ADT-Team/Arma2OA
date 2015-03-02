if ((getPlayerUID player) in ["6125769","15458761","3431497","11983945","1799172","10975748","11728644","10977348","14023881","9072900","156868","1658052","9427396","10685257","1874313","1928521","12922441","8355209"])
	then 
	{
titleText ["Добро пожаловать домой.", "PLAIN DOWN", 3]; titleFadeOut 4;
}else {
titleText ["Ты находишься на приватной базе HAN, уходи!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
    titleText ["Если ты не уйдешь, через 5 секунд тебя ударят по голове и отберут технику!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
    titleText ["Очнешься уже далеко отсюда.", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 10;
r_player_blood = 0; 
sleep 1; 
r_player_dead = true;
};