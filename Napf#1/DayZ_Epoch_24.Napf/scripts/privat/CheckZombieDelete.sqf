/*
Удаление зомби в заданом секторе 
User: by GROM
*/
if (isServer) then
    {
        private ["_sectors"];
        diag_log ( "Загрузка секторов защищенных от зомби." );
        _sectors =
            [
				[300,9650.042,1130.0769], //SADAT
				[300,18726.24,9412.8242], //DALAS
				[300,846.85547,6934.9829], //DIMA
				[300,4630.8467,5806.3262], //IVAN
				[300,11711.057,13287.964], // Yury
				[300,6582.1631,1981.2272], //A3a3a
				[300,9956.9453,9429.804] //HITMAN
            ];
        diag_log ( "Сектора загружены. Идет создание потоков..." );
        {
            [_x] spawn
                {
                    private ["_pos","_radius","_zombies","_sector"];
                    _sector = (_this select 0);
                    //diag_log (format["by GROM: Создан поток сектора: %1,%2. Радиусом: %3",(_sector select 1),(_sector select 2),(_sector select 0)]);
                    _radius = (_sector select 0);
                    _pos = [(_sector select 1),(_sector select 2),0];
                    while { true } do 
                        {
                            //diag_log (format["by GROM: Отработка цикла WHILE сектора: %1,%2. Радиусом: %3",(_pos select 0),(_pos select 1),(_radius)]);
                            _zombies = _pos nearEntities ["zZombie_Base",_radius];
							 //_zombies = _pos nearEntities ["zZombie_Base",_radius,_zz];
                                {
                                    //diag_log (format["by GROM: Перемещение объекта из сектора: %1,%2. Радиусом: %3",(_pos select 0),(_pos select 1),(_radius)]);
                                    _x setPos[0,0,0];
                                } forEach _zombies;
                            sleep 10;//Пауза
                        };
                };
        } forEach _sectors;
        diag_log ( "Все потоки созданы." );
    };
 