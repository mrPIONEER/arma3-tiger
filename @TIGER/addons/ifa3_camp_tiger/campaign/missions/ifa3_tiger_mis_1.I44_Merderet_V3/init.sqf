/*
	Код для всей 1 миссии ТИГР.
	[IMB]PIONEER
*/

// Выход если зашел во время игры
if (didJIP) exitWith {["ifa3_camp_tiger_debrif_loser_jip",false,false] call BIS_fnc_endMission;};

// Прогрузка скрипта патрулирования
//_upsmon = [] spawn {call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\Init_UPSMON.sqf";};

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6]; 
"dynamicBlur" ppEffectCommit 0;  
"dynamicBlur" ppEffectAdjust [0.0]; 
"dynamicBlur" ppEffectCommit 5;

0 fadesound 0;
0 fadeRadio 1.3;
playmusic "ifa3_tiger_m_intro";

// Переменные
kolona_priehala=false;
task2_pos=false;
task3_pos=false;
task4_pos=false;
konez_dialog2=false;
ataka_blue=false;

player_box=[s1,s2,s3,s4,s5];
tankistu_box=[t1_1,t1_2,t1_3,t2_1,t2_2,t2_3];
tanki_box=[tank1,tank2,tank3]; 

_player_ammo = [] spawn {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
s2 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";
s3 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";
s4 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";
s5 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";
};

s1 setIdentity "ifa3_tiger_pers_s1";
s2 setIdentity "ifa3_tiger_pers_s2";
s3 setIdentity "ifa3_tiger_pers_s3";
s4 setIdentity "ifa3_tiger_pers_s4";
s5 setIdentity "ifa3_tiger_pers_s5";

s1 setGroupId [localize "STR_ifa3_tiger_radio_st1","GroupColor0"];
t1_1 setGroupId [localize "STR_ifa3_tiger_radio_st3","GroupColor0"];

// Стартовые команды
{_x allowDamage false} forEach player_box;
{_x allowDamage false;_x setCaptive true;} forEach tankistu_box;
{_x lock true;clearweaponcargo _x; clearmagazinecargo _x;clearItemCargo _x} forEach tanki_box;
{_x kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""]} forEach player_box;
t1_1 kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""];

// Для синих
{_x setMarkerSize [0,0]} foreach ["task2","task3","task4","task5","task0"];

// Для карты зеленых
{_x setMarkerSize [0,0]} foreach ["brit_mar_1","brit_mar_2","brit_mar_3","brit_mar_4","brit_mar_5","brit_mar_6","brit_mar_7","brit_mar_8","brit_mar_9","brit_mar_10","brit_mar_11","brit_mar_12","brit_mar_13","brit_mar_14","brit_mar_15","brit_mar_16","brit_mar_17","brit_mar_18"];


// Брифинг
player createDiaryRecord ["Diary", [localize "STR_ifa3_tiger_1_mis_plan1", localize "STR_ifa3_tiger_1_mis_plan1_1"]];
player createDiaryRecord ["Diary", [localize "STRD_ifa3lib_tank_peredacha_init", localize "STRD_ifa3lib_tank_peredacha"]];

// 1 задание
task1 = player createSimpleTask [localize "STR_ifa3_tiger_1_mis_task1"];
task1 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task1_des", localize "STR_ifa3_tiger_1_mis_task1", localize "STR_ifa3_tiger_1_mis_task1"];
task1 setSimpleTaskDestination markerpos "pos1";
player setCurrentTask task1;

// Отключаем сохранение и провал если хоть 1 игрок умер в MP
if (isMultiplayer) then {
enableSaving [false, false];
// Убираем ботов из группы командира
{if (isPlayer _x) then {[_x] join objNull}} foreach player_box;
{_x addEventHandler ["Killed", {
{
["ifa3_camp_tiger_debrif_loser_kill_player",false] call BIS_fnc_endMission;
} remoteExec ["bis_fnc_call", 0];
}];
} forEach allPlayers;
};


sleep 2;

// Скрипт коробки передач и запрет снятие униформы
if (isMultiplayer) then {_nul=execVM "ifa3_camp_tiger\f\Peredacha.sqf"};
_nul=execVM "ifa3_camp_tiger\f\nouniforminit.sqf";

2 fadesound 0.1;

// Вывод текста
sleep 2;
[parseText localize "STR_ifa3_tiger_1_mis_starttext", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

// Ждем пролета самолета
waitUntil {sam1 distance tank1 < 400};
3 fademusic 0;
sleep 3;
 
// Диалог экипажа по радио

_dialog = [] spawn {
setAccTime 1;
s2 kbTell [s1, "briefing", "STR_ifa3_tiger_mis1_say1",true];
sleep 3;
setAccTime 1;
s1 kbTell [s2, "briefing", "STR_ifa3_tiger_mis1_say2",true];
sleep 3;
setAccTime 1;
s2 kbTell [s1, "briefing", "STR_ifa3_tiger_mis1_say3",true];
sleep 3;
setAccTime 1;
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis1_say4",true];
sleep 3;
setAccTime 1;
s5 kbTell [s3, "briefing", "STR_ifa3_tiger_mis1_say5",true];
sleep 3;
setAccTime 1;
s3 kbTell [s5, "briefing", "STR_ifa3_tiger_mis1_say6",true];
sleep 3;
setAccTime 1;
s1 kbTell [s5, "briefing", "STR_ifa3_tiger_mis1_say7",true];
sleep 3;
setAccTime 1;
s1 kbTell [t1_1, "briefing", "STR_ifa3_tiger_mis1_say8",true];
sleep 3;
2 fademusic 1;
};

// Ждем когда доедем и меняем сцену
waitUntil {kolona_priehala};
setAccTime 1;
{doStop _x} foreach [s3,t1_3,t2_3];
if (isMultiplayer) then {tank3 setFuel 0};
{_x engineOn false} forEach tanki_box;
{_x disableAI "ALL"} foreach player_box;
{_x disableAI "ALL"} foreach tankistu_box;

cutText ["","Black out",2];
sleep 2;

tank3 lock false;
s5 action ["eject",tank3];
unassignvehicle s5;
sleep 0.5;
tank3 lock true;
[s1,s2,s3,s4,s5] joinsilent objNull;

// Сцена в амбаре
"task0" setMarkerSize [1,1];

sleep 0.5;

tank1 attachTo [dom, [2, -10, -0.3]]; 
tank2 attachTo [dom, [2, 0, -0.3]]; 
tank3 attachTo [dom, [2, 10, -0.3]]; 

s1 setpos getmarkerpos "s1";
s2 setpos getmarkerpos "s2";
s3 setpos getmarkerpos "s3";
s4 setpos getmarkerpos "s4";
s5 setpos getmarkerpos "s5";

t1_1 setpos getmarkerpos "t1_1";
t1_2 setpos getmarkerpos "t1_2";
t1_3 setpos getmarkerpos "t1_3";
t2_1 setpos getmarkerpos "t2_1";
t2_2 setpos getmarkerpos "t2_2";
t2_3 setpos getmarkerpos "t2_3";

sleep 0.5;

{_x setdir 180} foreach tanki_box;

// Первый экипаж на улице
t1_2 switchmove "HubStandingUA_move1";
t1_1 switchmove "Acts_A_M01_briefing";
t1_3 switchmove "HubStandingUC_move2";

// Второй в амбаре
t2_1 switchmove "amovpsitmstpslowwrfldnon";
t2_2 switchmove "AidlPsitMstpSnonWnonDnon_ground00";
t2_3 switchmove "amovpsitmstpslowwrfldnon";

// Игроки
s1 switchmove "amovpsitmstpslowwrfldnon";
s2 switchmove "Acts_A_M01_briefing";
s3 switchmove "amovpsitmstpslowwrfldnon";
s4 switchmove "AidlPsitMstpSnonWnonDnon_ground00";
s5 switchmove "amovpsitmstpslowwrfldnon"; // у радио

sleep 0.1;

s1 setdir 180;
s2 setdir 95;
s3 setdir 220;
s4 setdir 270;
s5 setdir 180;

t1_2 setdir 150;
t1_1 setdir 200;
t1_3 setdir 300;
t2_1 setdir 0;
t2_2 setdir 180;
t2_3 setdir 180;

// Удаляем ящик в SP
if (!isMultiplayer) then {deleteVehicle box};

sleep 2;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6]; 
"dynamicBlur" ppEffectCommit 0;  
"dynamicBlur" ppEffectAdjust [0.0]; 
"dynamicBlur" ppEffectCommit 2;

{_x setpos [getpos _x select 0, getpos _x select 1, (getpos _x select 2) + 0.5]} forEach [t2_1,t2_2,t2_3];
{_x setpos [getpos _x select 0, getpos _x select 1, (getpos _x select 2) + 0.5]} forEach player_box;
cutText ["","Black in",1];
1 fadeSound 1;
1 fademusic 0;
sleep 1;


// Диалог экипажа в амбаре
dialog2 = [] spawn {
setAccTime 1;
radio say3d "ifa3_tiger_s_morze";
setAccTime 1;
_say = [s5,"STR_ifa3_tiger_mis1_say9","STR_ifa3_tiger_mis1_say9",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s2,"STR_ifa3_tiger_mis1_say10","STR_ifa3_tiger_mis1_say10",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s1,"STR_ifa3_tiger_mis1_say11","STR_ifa3_tiger_mis1_say11",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s5,"STR_ifa3_tiger_mis1_say12","STR_ifa3_tiger_mis1_say12",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s4,"STR_ifa3_tiger_mis1_say13","STR_ifa3_tiger_mis1_say13",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s2,"STR_ifa3_tiger_mis1_say14","STR_ifa3_tiger_mis1_say14",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s5,"STR_ifa3_tiger_mis1_say15","STR_ifa3_tiger_mis1_say15",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s2,"STR_ifa3_tiger_mis1_say16","STR_ifa3_tiger_mis1_say16",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s1,"STR_ifa3_tiger_mis1_say17","STR_ifa3_tiger_mis1_say17",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s4,"STR_ifa3_tiger_mis1_say17_1","STR_ifa3_tiger_mis1_say17_1",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s2,"STR_ifa3_tiger_mis1_say18","STR_ifa3_tiger_mis1_say18",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s1,"STR_ifa3_tiger_mis1_say19","STR_ifa3_tiger_mis1_say19",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s4,"STR_ifa3_tiger_mis1_say20","STR_ifa3_tiger_mis1_say20",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s1,"STR_ifa3_tiger_mis1_say21","STR_ifa3_tiger_mis1_say21",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s3,"STR_ifa3_tiger_mis1_say22","STR_ifa3_tiger_mis1_say22",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s5,"STR_ifa3_tiger_mis1_say23","STR_ifa3_tiger_mis1_say23",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s4,"STR_ifa3_tiger_mis1_say24","STR_ifa3_tiger_mis1_say24",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s1,"STR_ifa3_tiger_mis1_say25","STR_ifa3_tiger_mis1_say25",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
_say = [s2,"STR_ifa3_tiger_mis1_say26","STR_ifa3_tiger_mis1_say26",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
setAccTime 1;
konez_dialog2=true;
};


// Возможность пропуска диалога в MP
if (isMultiplayer) then {
hint localize "STR_ifa3_tiger_1_mis_hint1";
action_s1 = s1 addAction [localize "STR_ifa3_tiger_1_mis_action1", {
{
terminate dialog2;
s1 removeAction action_s1;
konez_dialog2=true;
} remoteExec ["bis_fnc_call", 0];
}];
};

// Ждем конца диалога или пропуска
waitUntil {konez_dialog2};
2 fademusic 1;
sleep 1;
cutText ["","Black out",1];
if (isMultiplayer) then {s1 removeAction action_s1;};
sleep 1;

// Докидываем в ящик или сразу бк ботов для SP
if (isMultiplayer) then {
if (local box) then {
box addWeaponCargoGlobal ["LIB_MG34",1];
box addWeaponCargoGlobal  ["LIB_PzFaust_30m",1];
box addmagazinecargoGlobal  ["LIB_PzFaust_PreloadedMissileDummy",1];
box addmagazinecargoGlobal  ["LIB_50Rnd_792x57",4];
box addBackpackCargoGlobal  ["B_LIB_GER_Backpack",1];
box addmagazinecargoGlobal  ["LIB_Shg24",4];
};
} else {
s2 addWeapon "LIB_MP40";
s2 addBackpack "B_LIB_GER_Backpack";
for "_i" from 1 to 8 do {s2 addItemToBackpack "LIB_32Rnd_9x19";};
for "_i" from 1 to 3 do {s2 addItemToBackpack "LIB_M39";};
for "_i" from 1 to 2 do {s2 addItemToBackpack "LIB_NB39";};
s2 selectweapon "LIB_MP40";
s3 addWeapon "LIB_K98_Late";
s3 addBackpack "B_LIB_GER_Backpack";
for "_i" from 1 to 5 do {s3 addItemToBackpack "LIB_M39";};
for "_i" from 1 to 11 do {s3 addItemToBackpack "LIB_5Rnd_792x57";};
for "_i" from 1 to 3 do {s3 addItemToBackpack "LIB_NB39";};
s3 selectweapon "LIB_K98_Late";
s4 addWeapon "LIB_MG34";
s4 addBackpack "B_LIB_GER_Backpack";
s4 addItemToUniform "LIB_50Rnd_792x57";
s4 addItemToVest "LIB_50Rnd_792x57";
s4 addItemToBackpack "LIB_50Rnd_792x57";
s4 selectweapon "LIB_MG34";
s5 addBackpack "B_LIB_GER_A_frame";
for "_i" from 1 to 8 do {s5 addItemToBackpack "LIB_30Rnd_792x33";};
s5 addWeapon "LIB_MP44";
s5 selectweapon "LIB_MP44";
};

{_x switchmove ""} foreach player_box;
{_x enableAI "ALL"} foreach player_box;
{_x allowDamage true} forEach player_box;
[s2,s3,s4,s5] joinsilent s1;

sleep 0.5;
deleteVehicle stop1_trig; // Удаляем триггер ограничения зоны
cutText ["","Black in",1];

// Создаем 3 задания для игроков
task2 = player createSimpleTask [localize "STR_ifa3_tiger_1_mis_task2"];
task2 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task2_des", localize "STR_ifa3_tiger_1_mis_task2", localize "STR_ifa3_tiger_1_mis_task2"];
task2 setSimpleTaskDestination markerpos "task2";

task3 = player createSimpleTask [localize "STR_ifa3_tiger_1_mis_task3"];
task3 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task3_des", localize "STR_ifa3_tiger_1_mis_task3", localize "STR_ifa3_tiger_1_mis_task3"];
task3 setSimpleTaskDestination markerpos "task3";

task4 = player createSimpleTask [localize "STR_ifa3_tiger_1_mis_task4"];
task4 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task4_des", localize "STR_ifa3_tiger_1_mis_task4", localize "STR_ifa3_tiger_1_mis_task4"];
task4 setSimpleTaskDestination markerpos "task4";

// Показываем маркера
"task2" setMarkerSize [1,1];
"task3" setMarkerSize [75,116];
"task4" setMarkerSize [100,116];

// Отменяем задание 1
Task1 setTaskState "Canceled";

sleep 2;

// Ставим активное задание 2 и уведомление
setAccTime 1;
player setCurrentTask task2;
["TaskCreated",["", localize "STR_ifa3_tiger_1_mis_hint2"]] call BIS_fnc_showNotification;

// Сохранение для SP
_save_sp = [] spawn {
if (!isMultiplayer) then {
sleep 60;
saveGame;
};
};

/////////////// Активная фаза игры ///////////////

_botu = [] spawn {
waitUntil {s1 distance tank3 > 50};
ataka_blue=true;
// Вейпоинты для групп вермахта
sleep 500;
// Спавн самолета и потом удаление
_this_air = createCenter resistance;
_center_0 = _this_air;
_group_air = createGroup _center_0;
_p47 = createVehicle ["LIB_P47",getmarkerpos "air1", [], 0, "FLY"];
"LIB_US_Pilot" createUnit [getmarkerPos  "air1", _group_air,"this moveindriver _p47"];
_wp = _group_air addWaypoint [getmarkerpos "air2",50];
_wp setWaypointType "SAD";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointFormation "LINE";
sleep 500;
_wp2 = _group_air addWaypoint [getmarkerpos "air3",50];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "NORMAL";
_wp2 setWaypointFormation "LINE";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} foreach units this"];
};

// Возможность взять карту Британцев
karta_brit_fnx = [] spawn {
// Ждем когда подойдем к картеь
waitUntil {(player distance karta1 < 2) or (player distance karta2 < 2)};
karta_brit_mark = player addAction [localize "STR_ifa3_tiger_1_mis_action2", {
{
player removeAction karta_brit_mark;
{deleteVehicle _x} foreach [karta1,karta2];
// Увеличиваем маркера
{_x setMarkerSize [1.5,1.5]} foreach ["brit_mar_1","brit_mar_2","brit_mar_3","brit_mar_4","brit_mar_5","brit_mar_6","brit_mar_7","brit_mar_8","brit_mar_9","brit_mar_10","brit_mar_11","brit_mar_12","brit_mar_13","brit_mar_14","brit_mar_15","brit_mar_16","brit_mar_17","brit_mar_18"];
terminate karta_brit_fnx;
} remoteExec ["bis_fnc_call", 0];
}];
};

// Выполнение 2 задачи уничтожение радио
_task2 = [] spawn {
waitUntil {!canmove btr_radio};
setAccTime 1;
task2_pos=true;
if (!alive btr_radio) then {deleteVehicle radio_brit};
radio_brit attachTo [btr_radio, [2, -10, -0.3]]; 
"task2" setMarkerSize [0, 0];
sleep 2;
Task2 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_1_mis_task2"]] call BIS_fnc_showNotification;
sleep 5;
if (!isMultiplayer) then {saveGame};
};

// Выполнение 3 задачи захват  востока
_task3 = [] spawn {
waitUntil {task3_pos};
setAccTime 1;
"task3" setMarkerSize [0, 0];
sleep 2;
Task3 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_1_mis_task3"]] call BIS_fnc_showNotification;
sleep 5;
if (!isMultiplayer) then {saveGame};
};

// Выполнение 4 задачи захват запада
_task4 = [] spawn {
waitUntil {task4_pos};
setAccTime 1;
"task4" setMarkerSize [0, 0];
sleep 2;
Task4 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_1_mis_task4"]] call BIS_fnc_showNotification;
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