/* 
	Автор: PIONEER.
	Вывод звука, текста и шевеление губами.

	Параметры:
	1 - имя юнита
	2 - название звука
	3 - ID текста от stringtable
	4 - вывод звука позиционного или глобального (глобальный для роликов) (true\false)
	5 - вывод текста автора (true\false)

	Пример:
	[player,"STRD_PL_SAY1","STRD_PL_SAY1",true,true] spawn PL_fnc_Say.sqf;
*/

params ["_obj","_sound","_tema","_playsound","_text"];

if (!alive _obj) exitWith {};

setacctime 1;

if (_playsound) then {

	_obj say3D _sound;

	if (_text) then {[name _obj,localize _tema] spawn BIS_fnc_showSubtitle} else {["",localize _tema] spawn BIS_fnc_showSubtitle};
	_obj setRandomLip true;

	[_obj] spawn {
		params ["_obj"];
		_sound = getPos _obj nearestObject "#soundonvehicle";
		waitUntil {isNull _sound};
		_obj setRandomLip false;
	};
	
} else {

	playsound _sound;

	if (_text) then {[name _obj,localize _tema] spawn BIS_fnc_showSubtitle} else {["",localize _tema] spawn BIS_fnc_showSubtitle};
	_obj setRandomLip true;

	[_obj] spawn {
		params ["_obj"];
		_sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
		waitUntil {isNull _sound};
		_obj setRandomLip false;
	};

};