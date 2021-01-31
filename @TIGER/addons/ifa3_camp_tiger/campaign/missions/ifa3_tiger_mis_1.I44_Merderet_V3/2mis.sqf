/*
	Активная фаза игры - выполнение всех задач и конец миссии.
*/


// Выполнение 2 задачи уничтожение радио
_task2 = [] spawn {
waitUntil {!canmove btr_radio};
setAccTime 1;
task2_pos=true;
if (!alive btr_radio) then {deleteVehicle radio_brit};
radio_brit attachTo [btr_radio, [2, -10, -0.3]]; 
"task2" setMarkerSize [0, 0];
sleep 2;

["task2","SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 5;
if (!isMultiplayer) then {saveGame};
};

// Выполнение 3 задачи захват  востока
_task3 = [] spawn {
waitUntil {task3_pos};
setAccTime 1;
"task3" setMarkerSize [0, 0];
sleep 2;
["task3","SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 5;
if (!isMultiplayer) then {saveGame};
};

// Выполнение 4 задачи захват запада
_task4 = [] spawn {
waitUntil {task4_pos};
setAccTime 1;
"task4" setMarkerSize [0, 0];
sleep 2;
["task4","SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 5;
if (!isMultiplayer) then {saveGame};
};

// Ждем выполнения всех задач
waitUntil {task2_pos and task3_pos and task4_pos};
sleep 10;

setAccTime 1;
// Вернутся назад задача
task5 = player createSimpleTask [localize "STR_ifa3_tiger_1_mis_task4"];
task5 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task4_des", localize "STR_ifa3_tiger_1_mis_task4", localize "STR_ifa3_tiger_1_mis_task4"];
task5 setSimpleTaskDestination markerpos "task5";
player setCurrentTask task5;
"task5" setMarkerSize [1, 1];
["TaskCreated",["", localize "STR_ifa3_tiger_1_mis_task5"]] call BIS_fnc_showNotification;

// Вернулись, завершаем миссию
waitUntil{(s1 distance tank3 < 50) or (vehicle s1 distance tank3 <50)};
setAccTime 1;
playmusic "ifa3_tiger_m_win";
Task5 setTaskState "SUCCEEDED";
Task1 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_1_mis_task5"]] call BIS_fnc_showNotification;

// Сохраняем статус солдат для SP для миссии 2 
if (!isMultiplayer) then {
s1 saveStatus "ifa3_camp_tiger_1_mis_s1";
s2 saveStatus "ifa3_camp_tiger_1_mis_s2";
s3 saveStatus "ifa3_camp_tiger_1_mis_s3";
s4 saveStatus "ifa3_camp_tiger_1_mis_s4";
s5 saveStatus "ifa3_camp_tiger_1_mis_s5";
};

// Конец
["end1",true,10,false] call BIS_fnc_endMission;
if (true) exitWith {};