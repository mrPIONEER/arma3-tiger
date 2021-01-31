/*
	Автор: PIONEER.
	Удаление кроликов и змей.
	
	[] spawn PL_fnc_NoSnake
*/

// запускаем цикл
while {true} do {
	waitUntil {sleep 10; 
	{
		// находим и удаляем
		if (agent _x isKindOf "Snake_random_F" or agent _x isKindOf "Rabbit_F") then {deleteVehicle agent _x;};
	} forEach agents;
	true;
   };
};