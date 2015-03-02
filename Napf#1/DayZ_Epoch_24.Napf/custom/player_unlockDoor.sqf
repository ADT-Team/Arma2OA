private ["_display","_obj","_objectCharacterID"];
if(!isNil "DZE_DYN_UnlockDoorInprogress") exitWith { cutText [(localize "str_epoch_player_21") , "PLAIN DOWN"]; };
DZE_DYN_UnlockDoorInprogress = true;
if(!isNull dayz_selectedDoor) then 
	{
		_obj = dayz_selectedDoor;
		_notNearestPlayer = _obj call dze_isnearest_player;
		if (_notNearestPlayer) then 
			{
				_display = findDisplay 41144;
				_display closeDisplay 3000;
				cutText [(localize "STR_EPOCH_ACTIONS_16"), "PLAIN DOWN"];
			}
		else 
			{
				_objectCharacterID 	= _obj getVariable ["CharacterID","0"];
				if (DZE_Lock_Door == _objectCharacterID) then 
					{
						[player,"combo_unlock",0,false] call dayz_zombieSpeak;
						_display = findDisplay 41144;
						_display closeDisplay 3000;
						if (_obj animationPhase "Open_hinge" == 0) then 
							{_obj animate ["Open_hinge", 1];};
						if (_obj animationPhase "Open_latch" == 0) then
							{_obj animate ["Open_latch", 1];};
						KeyCodeTry = nil;
					}
				else
					{
						[10,10] call dayz_HungerThirst;
						DZE_Lock_Door = "";
						[player,"combo_locked",0,false] call dayz_zombieSpeak;
						[player,20,true,(getPosATL player)] spawn player_alertZombies;
						if (isNil 'KeyCodeTry') then 
							{KeyCodeTry = 0;};
						KeyCodeTry = KeyCodeTry + 1;
						if(KeyCodeTry >= 2) then
							{
								cutText ["[ADT-Team] Вам не удалось открыть дверь. Следующая попытка через 20 секунд!", "PLAIN DOWN"];
								[] spawn 
									{
										disableserialization;
										private ["_i"];
										_i	=	0;
										while {(_i < 200)} do
											{
												_display = findDisplay 41144;
												_display closeDisplay 3000;
												sleep 0.1;
												_i	=	_i + 1;
											};
										KeyCodeTry = nil;											
									};
							};
					};
			};
	}
else 
	{
		_display = findDisplay 41144;
		_display closeDisplay 3000;
	};
DZE_DYN_UnlockDoorInprogress = nil;