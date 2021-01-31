/*
	Автор: PIONEER
	Динамическое создание отделение пехоты. Отделение патрулирует через скрипт UPS.

	["start","random_marker",200] execvm "duc\pehota_ups_patrol.sqf";

	1 - стартовая позиция (маркер)
	2 - название маркера для UPS
	3-4 - размер зоны патруля

	west
	resistance
	east
*/

if (!isServer) exitWith {};

params ["_startpos","_ups","_size"];

_group = createGroup west;

[_ups,getmarkerpos _startpos,_size] call PL_fnc_UPSmarker;

// отделение пехоты
"rhsusf_army_ucp_squadleader" createUnit [getmarkerPos _startPos, _group,"[this,_ups,'random'] spawn PL_fnc_UPS"];
"rhsusf_army_ucp_teamleader" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_rifleman" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_autorifleman" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_grenadier" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_rifleman" createUnit [getmarkerPos _startPos, _group,""];

// поддержка VCOM
_group setVariable ["VCM_Skilldisable",true];
_group setVariable ["VCM_NOFLANK",true];