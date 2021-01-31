/*
    Автор: PIONEER
	Запрет на снятие униформы.
	
	[] spawn PL_fnc_Nouniform;
*/


PL_lock_uniform = {
    waitUntil {!(isNull (findDisplay 602))};
    while {!(isNull (findDisplay 602))} do {
       ctrlEnable [6331, false];  
       sleep 0.001;
    };   
};  

if (!isDedicated and hasInterface) then {
       waitUntil {!(isNull player)};
       player addEventHandler ["inventoryOpened", {_this spawn PL_lock_uniform;}];
};