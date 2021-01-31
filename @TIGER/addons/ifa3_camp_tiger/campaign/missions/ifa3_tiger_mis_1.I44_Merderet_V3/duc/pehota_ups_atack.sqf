/*
	Автор: PIONEER
	Динамическое создание отделений пехоты. Отделение атакует через скрипт UPS.

	["start","end","random_marker"] execvm "duc\pehota_ups_ataka.sqf";

	1 - стартовая позиция (маркер)
	2 - конечная позиция (маркер)
	3 - название маркера для UPS

	west
	resistance
	east
*/

if (!isServer) exitWith {};

params ["_startpos","_endpos","_ups"];

_group = createGroup west;

[_ups,getmarkerpos _endpos,100] call PL_fnc_UPSmarker;

// отделение пехоты
"rhsusf_army_ucp_squadleader" createUnit [getmarkerPos _startPos, _group,"[this,_ups,'noslow'] spawn PL_fnc_UPS"];
"rhsusf_army_ucp_teamleader" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_rifleman" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_autorifleman" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_grenadier" createUnit [getmarkerPos _startPos, _group,""];
"rhsusf_army_ucp_rifleman" createUnit [getmarkerPos _startPos, _group,""];

// поддержка VCOM
_group setVariable ["VCM_Skilldisable",true];
_group setVariable ["VCM_NOFLANK",true];