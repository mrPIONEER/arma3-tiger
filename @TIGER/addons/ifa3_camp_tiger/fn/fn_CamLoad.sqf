/*
	Автор: PIONEER
	Подзагрузка камеры
	
	_start = ["pos_camera"] spawn PL_fnc_CamLoad;
	waitUntil {scriptDone _start};

	1 - маркер
*/

params ["_pos"];

 _text = [[localize "STRD_PL_Loading"],0,1] spawn BIS_fnc_typeText;
waitUntil {preloadCamera position _pos};
terminate _text;
[[],0,1] spawn BIS_fnc_typeText;