/*
 Принудительная высадка с транспорта
 
 Активация:
 _n=[имя_группы,имя_самолёта] execvm "scripts\getout_group.sqf"
 
 Пример:
 _n=[t1_1,tank1] execvm "ifa3_camp_tiger\f\getout_group.sqf"
 
 PIONEER
*/

_CargoGroup=_this select 0;
_heli=_this select 1;
_count=0;
_limit=(count units _CargoGroup);

while {true} do {
_unit=((units _CargoGroup) select _count);
_unit action ["eject",_heli];
unassignvehicle _unit;
sleep 0.5;
_count=_count+1;
if (_count==_limit) exitWith {hint "exit"};
};