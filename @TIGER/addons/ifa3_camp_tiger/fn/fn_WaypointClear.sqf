/*
	Удаление вейпоинтов
	
	[grp1] call PL_fnc_WaypointClear
	
	1 - группа 
*/

if (!isServer) exitWith {} ;

private ["_group"];

_group = _this select 0;

for "_i" from 0 to ((count (waypoints _group)) - 1) do
{
	deleteWaypoint [_group,_i]
};
