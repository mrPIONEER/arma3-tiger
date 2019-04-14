/* 
Автор: [IMB]PIONEER
Вывод звука в радиоканал и текста. Используется в миссиях

Параметры:
_say = [кто,"звук","стриг_текста",канал]execvm "radiosay.sqf"

Пример:
_say = [pl,"pl3","STR_pl3",1] execvm "ifa3_camp_tiger\f\radiosay.sqf"

1 - канал стороны
2 - канал техники
3 - канал общий
*/

_obj = _this select 0;
_sound = _this select 1;
_tema = _this select 2;
_kanal = _this select 3;

/* Выбор канала рации
if (_kanal = 1) then {_kanal=sideChat};
if (_kanal = 2) then {_kanal=vehicleChat};
if (_kanal = 3) then {_kanal=globalChat};
*/

setacctime 1;
if (!alive _obj) exitWith {};
playsound _sound;
_obj _kanal localize _tema;
if(true)exitWith{};