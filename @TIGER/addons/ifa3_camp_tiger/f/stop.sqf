/*
[SV] Simych

Ставим ТРИГГЕР

Тип: Нет
Активация: Кто угодно - для всех, либо ставье фракцию для кого ограничить зону
Тип активации: Присутствует
Повторяемый: ДА
Только сервер: НЕТ

Пишем в

Условие:
player in thislist - только пехота.
(player in thislist) or (vehicle player in thislist) - пехота+техника.

При активации:
stop1=execVM "ifa3_camp_tiger\f\stop.sqf";

Вместо stop1 можно любое свое значение, но учтите каждый триггер должен иметь разное значение!
т.е. например stop1  stop2  stop3 и т.д. чтоб скрипт случайно не сработал на всех триггерах сразу.

При деактивации:
terminate stop1;

Это делается для того, чтоб скрипт выгружался когда человек выходил из триггера! ОБЯЗАТЕЛЬНО!
*/


if (local player) then {
_pname = format ["%1",name player];
mess1 = "<t color='#ff0000'>STOP</t>" +_pname+ "<t color='#ff0000'><br /></t>";
nul = [mess1,0,0.5,5,1] spawn BIS_fnc_dynamicText;
sleep 5;
nul = ["<t color='#ff0000'>5</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 1;
nul = ["<t color='#ff0000'>4</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 1;
nul = ["<t color='#ff0000'>3</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 1;
nul = ["<t color='#ff0000'>2</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 1;
nul = ["<t color='#ff0000'>1</t>",0,0.4,1,1] spawn BIS_fnc_dynamicText;
sleep 1;
player setDamage 1;
};