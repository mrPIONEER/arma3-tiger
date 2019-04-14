/*
 Привязывания маркера к юниту
 Активация:
 [имя_юнита,"имя_маркера"] exec "scripts\gomarker.sqs"
 Пример:
 [player,"player"] exec "scripts\gomarker.sqs"
*/

_man = _this select 0;
_marker = _this select 1;

while {true} do {
_marker setmarkerpos getpos _man;
uisleep 1;
if (!alive _man or !canmove _man) exitWith {deleteMarker _marker}; // Выход при смерти или повреждении
};