/*
	Автор: PIONEER
	Создание вейпоинтов для группы.
	grp1 = group this;

	[grp1,"end"] call PL_fnc_Waypoint
	[grp1,"end","MOVE","NORMAL","WEDGE"] call PL_fnc_Waypoint

	1 - группа
	2 - куда идем (маркер)
	3 - действие вейпоинта (опционально)
	4 - скорость (опционально)
	5 - построение (опционально)

	Тип вейпоинта ("MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", 
	"LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "CYCLE",
	"TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "AND", "OR".)

	Скорость: 

	"UNCHANGED"
	"LIMITED"
	"NORMAL"
	"FULL"

	Построение:
	"NO CHANGE"
	"COLUMN"
	"STAG COLUMN"
	"WEDGE"
	"ECH LEFT"
	"ECH RIGHT"
	"VEE"
	"LINE"
	"FILE"
	"DIAMOND"
*/

if (!isServer) exitWith {};

params ["_grp","_wppos",["_wptype","MOVE"],["_wpspeed","NORMAL"],["_wpform","WEDGE"]];

_wp = _grp addWaypoint [getmarkerpos _wppos,0];
_wp setWaypointType _wptype;
_wp setWaypointSpeed _wpspeed;
_wp setWaypointFormation _wpform;