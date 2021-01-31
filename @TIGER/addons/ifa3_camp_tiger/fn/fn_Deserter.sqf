/*
	Автор: PIONEER
	Скрипт провала миссии по дезертирству

	ТРИГГЕР

	Условие:
	player in thislist - только пехота.
	(player in thislist) or (vehicle player in thislist) - пехота+техника.

	При активации:
	pl_stop_1 = [] spawn PL_fnc_deserter;

	При деактивации:
	terminate pl_stop_1;
*/


[localize "STRD_proval_deser",0,0.5,5,1] spawn BIS_fnc_dynamicText;
sleep 5;
["<t color='#ff0000'>5</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 2;
["<t color='#ff0000'>4</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 2;
["<t color='#ff0000'>3</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 2;
["<t color='#ff0000'>2</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 2;
["<t color='#ff0000'>1</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 2;

{
	pl_proval = player createSimpleTask [localize "STRD_PL_proval_task"];
	pl_proval setSimpleTaskDescription[localize "STRD_PL_proval_task", localize "STRD_PL_proval_task", localize "STRD_PL_proval_task"];
	pl_proval setTaskState "FAILED";
	["TaskFAILED",["",localize "STRD_PL_proval_task"]] call BIS_fnc_showNotification;
	["pl_loser_desertir",false] call PL_fnc_EndMis;
} remoteExec ["bis_fnc_call", 0];

