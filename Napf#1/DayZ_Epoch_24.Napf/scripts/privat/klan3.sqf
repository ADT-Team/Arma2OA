if ((getPlayerUID player) in ["994308","11597124","10975748","10977348","11728644","9427396","14987337","1919556","1874313"])
	then 
	{
titleText ["Добро пожаловать домой.", "PLAIN DOWN", 3]; titleFadeOut 4;
}else {
titleText ["Ты находишься на приватной базе EDO, уходи!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
    titleText ["Если ты не уйдешь, через 5 секунд тебя ударят по голове и отберут технику!", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 5;
    titleText ["Очнешься уже далеко отсюда.", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 10;
r_player_blood = 0; 
sleep 1; 
r_player_dead = true;
};