/*
	Автор: PIONEER
	Плавный переход
	
	[] spawn PL_fnc_CamPerehod;
	
	1 - время в секундах (опционально, стандарт 2с)
*/

params [["_time",2]];

titleCut ["","BLACK OUT",1];
_time fadesound 0;
sleep _time;
titleCut ["","BLACK IN",1];
1 fadesound 1;