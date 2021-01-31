/*
	Автор: PIONEER 
	Телепорт самолёта

	[vert,pos1,200,270,60] call PL_fnc_TeleportAir
	
	1 - имя
	2 - позиция телепорта
	3 - скорость
	4 - азимут
	5 - высота

	Внимание: скорость добавляется к текущей самолета. Если самолет уже летит, скорость 0 ставьте.
*/

if (!isServer) exitWith {} ;

params ["_plane","_mesto","_speed","_dir","_vis"];

_plane setPos [getPos _mesto select 0, getPos _mesto select 1, (getPos _mesto select 2) + _vis];

_plane setdir _dir;
_vel = velocity _plane;

_plane setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];