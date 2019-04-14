/*
	Запрет на снятие униформы. Активация
*/

if (!(isDedicated)) then {
waitUntil {!(isNull player)};
player addEventHandler ["inventoryOpened","_nul=execVM 'ifa3_camp_tiger\f\nouniform.sqf'"];
};