/*
	Aвтор: PIONEER
	Все не покидают поле боя и все на минимальном уровне скилла
	При необходимости задать значения отдельно для каждой фракции
	
	[] spawn PL_fnc_Skill
*/

if (!isServer) exitWith {};

// нужно, чтобы перезаписать параметры игры и других скриптов
sleep 10;

{
if (side _x == East) then {
_x setSkill 0;
_x allowFleeing 0;
}; 

if (side _x == West) then {
_x setSkill 0;
_x allowFleeing 0;
}; 

if (side _x == resistance) then {
_x setSkill 0;
_x allowFleeing 0;
}; 

if (side _x == Civilian) then {
_x setSkill 0;
_x allowFleeing 0;
}; 
} forEach allUnits;