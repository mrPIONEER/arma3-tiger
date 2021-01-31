/*
	Автор: PIONEER
	Уничтожение юнитов в зоне
	
	[trig_final,east,300] call PL_fnc_KillAll
	[trig_final,east,300,false,"All"] call PL_fnc_KillAll
	
	1 - позиция
	2 - сторона
	3 - радиус
	4 - true убить, false удалить
	5 - Класс юнитов Man \ All и тд
*/

if (!isServer) exitWith {};

params ["_pos","_side","_xy",["_dam",true],["_who","Man"]];

{
	if (side _x == _side) then {
		if (_dam) then {_x setDammage 1} else {
			_v = _x;
			{_v deleteVehicleCrew _x} forEach crew _v;
			deleteVehicle _x;
			}
	}
} forEach (
	_pos nearEntities [[_who], _xy]
);