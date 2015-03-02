// ADT-Team.ru by GROMx.ru

private ["_part","_worth","_totalCurrency","_briefcase_100oz","_gold_10oz_a","_gold_10oz_b","_gold_10oz","_gold_1oz_a","_gold_1oz_b","_gold_1oz","_silver_10oz_a","_silver_10oz_b","_silver_10oz","_silver_1oz_a","_silver_1oz_b","_silver_1oz","_successful","_buyOrSell","_total_items"];

//Get total currency
_totalCurrency = 0;
{
	_part =  (configFile >> "CfgMagazines" >> _x);
	_worth =  (_part >> "worth");
	if isNumber (_worth) then {
		if (([player,_part,1] call BIS_fnc_invRemove) == 1) then {
			_totalCurrency = _totalCurrency + getNumber(_worth);
		};
	};

} count (magazines player);


	_briefcase_100oz = floor(_totalCurrency / 10000);

	_gold_10oz_a = floor(_totalCurrency / 1000);
	_gold_10oz_b = _briefcase_100oz * 10;
	_gold_10oz = (_gold_10oz_a - _gold_10oz_b);

	_gold_1oz_a = floor(_totalCurrency / 100);
	_gold_1oz_b = _gold_10oz_a * 10;
	_gold_1oz = (_gold_1oz_a - _gold_1oz_b);

	_silver_10oz_a = floor(_totalCurrency / 10);
	_silver_10oz_b = _gold_1oz_a * 10;
	_silver_10oz = (_silver_10oz_a - _silver_10oz_b);

	_silver_1oz_a = floor(_totalCurrency);
	_silver_1oz_b = _silver_10oz_a * 10;
	_silver_1oz = (_silver_1oz_a - _silver_1oz_b);


	if (_briefcase_100oz > 0) then {
		for "_x" from 1 to _briefcase_100oz do {
			player addMagazine "ItemBriefcase100oz";
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _briefcase_100oz, "ItemBriefcase100oz"];
		};
	};
	if (_gold_10oz > 0) then {
		if (_gold_10oz == 1) then {
			player addMagazine "ItemGoldBar10oz";
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _gold_10oz, "ItemGoldBar10z"];
		} else {
			player addMagazine format["ItemBriefcase%1oz",floor(_gold_10oz*10)];
			//diag_log format["DEBUG TRADER CHANG MADE: ItemBriefcase%1oz", floor(_gold_10oz*10)];
		};
	};
	if (_gold_1oz > 0) then {
		if (_gold_1oz == 1) then {
			player addMagazine "ItemGoldBar";
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _gold_1oz, "ItemGoldBar"];
		} else {
			player addMagazine format["ItemGoldBar%1oz",_gold_1oz];
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _gold_1oz, "ItemGoldBar"];
		};
	};
	if (_silver_10oz > 0) then {
		if (_silver_10oz == 1) then {
			player addMagazine "ItemSilverBar10oz";
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_10oz, "ItemSilverBar10oz"];
		} else {
			player addMagazine format["ItemBriefcaseS%1oz",floor(_silver_10oz*10)];
			//diag_log format["DEBUG TRADER CHANG MADE: ItemBriefcaseS%1oz", floor(_silver_10oz*10)];
		};
	};
	if (_silver_1oz > 0) then {
		if (_silver_1oz == 1) then {
			player addMagazine "ItemSilverBar";
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
		} else {
			player addMagazine format["ItemSilverBar%1oz",_silver_1oz];
			//diag_log format["DEBUG TRADER CHANG MADE: %1 x %2", _silver_1oz, "ItemSilverBar"];
		};
	};

	//Let the player know it happened
	cutText [format["Скомпонованы все слитки в максимально возможный номинал."], "PLAIN DOWN"];