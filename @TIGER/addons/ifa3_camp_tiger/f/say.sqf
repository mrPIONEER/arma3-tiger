/* 
Автор: [IMB]PIONEER
Вывод звука, текста и говорение губами. Используется в роликах.

Параметры:
_say = [кто,"звук","стриг_текста",время_разговора]execvm "say.sqf"

Пример:
_say = [pl,"pl3","STR_pl3",2] execvm "peacekeeper2\say.sqf"
*/

_obj = _this select 0;
_sound = _this select 1;
_tema = _this select 2;
_time = _this select 3;

if (!alive _obj) exitWith {};

_timetext = (_time + 1);

setacctime 1;
playsound _sound;
[localize _tema,0,0.92,_timetext,0,0,789] spawn BIS_fnc_dynamicText;
_obj setRandomLip true;
sleep _time;
_obj setRandomLip false;
if(true)exitWith{};