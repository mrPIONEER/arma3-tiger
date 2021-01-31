/*
	Автор: PIONEER
	Перемещение карты.
	
	[2,0.1,"start"] call PL_fnc_CamMapTarget;
	
	1 - время перехода
	2 - зум
	3 - позиция (маркер)
*/

params ["_time","_zoom","_marker"];

mapAnimAdd [_time, _zoom, markerPos _marker];
mapAnimCommit;