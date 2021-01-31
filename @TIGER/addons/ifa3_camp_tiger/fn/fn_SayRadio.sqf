/* 
	Автор: PIONEER
	Вывод звука, текста в канал радио

	Параметры:
	1 - имя юнита
	2 - название звука
	3 - ID текста от stringtable

	Пример:
	[player,"pl3","STR_pl3"] call PL_fnc_SayRadio
*/

params ["_obj","_sound","_tema"];

if (!alive _obj) exitWith {};

setacctime 1;

playsound _sound;
_obj  sidechat localize _tema;