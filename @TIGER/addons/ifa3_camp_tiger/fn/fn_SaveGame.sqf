/*
	Автор: PIONEER
	Сохранение игры
	
	[5] spawn PL_fnc_SaveGame;

	1 - время до сейва
*/

params [["_time",2]];

if (!isMultiplayer) then {
	sleep _time;
	saveGame;
};