/*
	Автор: PIONEER
	Стрельба артиллерии по точке
	
	[arty,getmarkerpos "marker",4] call PL_fnc_ArtyFire;
	
	1 - юнит
	2 - цель
	3 - кол-во
*/

if (!isServer) exitWith {};

params ["_arty","_targer","_count"];

_magazine = currentMagazine _arty;
_arty doArtilleryFire [_targer, _magazine, _count];