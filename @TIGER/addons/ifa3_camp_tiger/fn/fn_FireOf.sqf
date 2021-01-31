/*
	Автор: PIONEER
	Провал, если игрок выстрелит
	
	[] call PL_fnc_FireOf

	Отключение: 
	player removeEventHandler ["fired", pl_of_fired];
*/


pl_of_fired = player addEventHandler ["fired", {
	{
		player removeAllEventHandlers "fired";
		["pl_loser_fire",false] call PL_fnc_EndMis;
		pl_proval = player createSimpleTask [localize "STRD_PL_proval_task"];
		pl_proval setSimpleTaskDescription[localize "STRD_PL_proval_task", localize "STRD_PL_proval_task", localize "STRD_PL_proval_task"];
		pl_proval setTaskState "FAILED";
	} remoteExec ["bis_fnc_call", 0];
}];