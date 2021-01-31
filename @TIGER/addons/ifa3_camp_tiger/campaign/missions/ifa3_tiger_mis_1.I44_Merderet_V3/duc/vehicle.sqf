/*
	Автор: PIONEER
	Динамическое создание техники

	["start","end",180] execvm "duc\vehicle.sqf";

	1 - стартовая позиция (маркер)
	2 - конечная позиция (маркер)
	3 - азимут

	west
	resistance
	east
*/

if (!isServer) exitWith {};

params ["_startpos","_endpos","_dir"];

_group = createGroup west;

_vehicle = createVehicle ["rhsusf_m1a1aim_tuski_wd",getmarkerpos _startpos, [], 0, ""]; 
createVehicleCrew _vehicle;
private _group = group driver _vehicle;
_group addVehicle _vehicle;

_vehicle setdir _dir;

[_group,_endpos] call PL_fnc_Waypoint;

// поддержка VCOM
_group setVariable ["VCM_Skilldisable",true];
_group setVariable ["VCM_NOFLANK",true];