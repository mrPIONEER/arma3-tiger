/*
	Автор: PIONEER
	Провал миссии из-за убийства своих и гражданских.
	
	[] call PL_fnc_FrendlyFire;
*/


{

if (side player == side _x) then {
_x addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (isPlayer _killer) then {
		{
			["pl_loser_frendlyfire",false] call PL_fnc_EndMis;
			pl_proval = player createSimpleTask [localize "STRD_PL_proval_task"];
			pl_proval setSimpleTaskDescription[localize "STRD_PL_proval_task", localize "STRD_PL_proval_task", localize "STRD_PL_proval_task"];
			pl_proval setTaskState "FAILED";
		} remoteExec ["bis_fnc_call", 0];
	};
}];
}; 

if (side _x == civilian) then {
_x addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (true) then {
	{
		["pl_loser_civilian",false] call PL_fnc_EndMis;
		pl_proval = player createSimpleTask [localize "STRD_PL_proval_task"];
		pl_proval setSimpleTaskDescription[localize "STRD_PL_proval_task", localize "STRD_PL_proval_task", localize "STRD_PL_proval_task"];
		pl_proval setTaskState "FAILED";
	} remoteExec ["bis_fnc_call", 0];
	};
}];
};

} forEach allUnits;
