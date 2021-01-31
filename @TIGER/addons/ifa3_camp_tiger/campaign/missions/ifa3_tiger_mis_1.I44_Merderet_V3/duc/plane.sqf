/*
	Автор: PIONEER
	Динамическое создание самолёта

	["start","end",180,500] execvm "duc\plane.sqf";

	1 - стартовая позиция (маркер)
	2 - конечная позиция (маркер)
	3 - азимут
	4 - высота полета

	west
	resistance
	east
*/

if (!isServer) exitWith {};

params ["_startpos","_endpos","_dir","_up"];

_group = createGroup west;

_vehicle =  createVehicle ["RHS_A10",getmarkerpos _startPos, [], 0, "FLY"];
createVehicleCrew _vehicle;
private _group = group driver _vehicle;
_group addVehicle _vehicle;

[_vehicle,_vehicle,200,_dir,_up] call PL_fnc_TeleportAir;
[_group,_endpos] call PL_fnc_Waypoint;
_vehicle flyInHeight _up;

// поддержка VCOM
_group setVariable ["VCM_Skilldisable",true];
_group setVariable ["VCM_NOFLANK",true];