/*
	Автор: PIONEER
	Создание действия в стандартный канал радио 0-0-1. Только для одиночной игры.
	
	1 - канал | "ALPHA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIET"
	2 - Текст
	3 - действие
	
	["ALPHA","STRD_Task1","hint 'работает!'"] call PL_fnc_TriggerRadio;

*/

params ["_radio","_text","_main"];

_trg = createTrigger ["EmptyDetector", [0,0,0]];
_trg setTriggerArea [0, 0, 0, false];
_trg setTriggerActivation ["ALPHA", "PRESENT", true];
_trg setTriggerStatements ["this", _main, ""];
_trg setTriggerText localize _text;