/*
	Автор: PIONEER
	Открытие\закрытие карты
	
	[true] call PL_fnc_CamMap;
	
	1 - true открыть, false закрыть.
*/

params ["_start"];

forceMap _start;
openMap [_start, _start];

if (_start) then {
showPad false;
ShowCompass false;
showWatch false;
showRadio false;
} else {
showPad true;
ShowCompass true;
showWatch true;
showRadio true;
};