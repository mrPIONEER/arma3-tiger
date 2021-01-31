/*
	Автор: PIONEER
	Дебаг скрипт для быстрой проверки миссии.
	
	[] spawn PL_fnc_Debug;
*/

hint "Debug ON!";
player allowDamage false;
vehicle player allowDammage false;
player enableStamina false;
player addAction ["Open Arsenal", {["Open",[true]] call BIS_fnc_arsenal;}];

// игрок убивает всех с одного попадания
{_x addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	if (_source == player) then {_unit setDamage 1;};
}];} foreach allunits;

// игрок убивает всю технику с одного попадания
{_x addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	if (_source == player) then {_unit setDamage 1;};
}];} foreach Vehicles;


// если выйти в камеру или в спектатор бессмертие отключается.
while {true} do {
	waitUntil {isDamageAllowed player};
	player allowDamage false;
	sleep 1;
};