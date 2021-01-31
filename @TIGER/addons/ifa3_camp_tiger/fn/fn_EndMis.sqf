/*
	Автор: PIONEER.
	Завершение миссии
	
	1 - id из дебрифинга
	2 - true победа false поражение
	
	["end1",true] call PL_fnc_EndMis;
*/


params["_status", "_vin"];

// чтобы повторно не срабатывал, только один раз
if (missionNamespace getVariable ["PL_endMissionFunction", false]) exitWith {};
missionNamespace setVariable ["PL_endMissionFunction", true];

player setcaptive true;
player allowDammage false;
vehicle player allowDammage false;
[_status,_vin,true] call BIS_fnc_endMission;