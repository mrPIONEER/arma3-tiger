/*
	Автор: PIONEER
	Выгрузка группы из техники
	
	Активация:
	[unit] spawn PL_fnc_GetOut - высадка группы ИИ из техники, в которой сидят
	[unit,true,car] spawn PL_fnc_GetOut - принудительная высадка группы

	1 - имя группы
	2 - true при нудительная высадка
	3 - имя техники
*/

if (!isServer) exitWith {};

params["_group",["_eject",false],["_car",objnull]];

if !(_eject) then {
{
	doGetOut _x; 
	unassignVehicle _x; 
	[_x] allowGetIn true;
} foreach units _group;

} else {

_aunits = units _group;
_i = 0;
_j = count _aunits;

while {true} do {
(_aunits select _i) action ["EJECT",_car];
unassignvehicle (_aunits select _i);
sleep 1;
waitUntil {!((_aunits select _i) in _car)};
_i=_i+1;
if (_i > (_j - 1)) exitWith {};
};

};