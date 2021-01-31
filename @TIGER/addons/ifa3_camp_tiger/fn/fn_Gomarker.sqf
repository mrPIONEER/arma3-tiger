/*
	Автор: PIONEER
	Привязывания маркера к юниту
	
	Активация:
	[tank,"tank"] spawn PL_fnc_Gomarker
	
	1 - имя юнита
	2 - имя маркера
*/

if (!isServer) exitWith {};

params["_man", "_marker"];

while {true} do {
_marker setmarkerpos getpos _man;
sleep 1;
if (!alive _man) exitWith {deleteMarker _marker};
};