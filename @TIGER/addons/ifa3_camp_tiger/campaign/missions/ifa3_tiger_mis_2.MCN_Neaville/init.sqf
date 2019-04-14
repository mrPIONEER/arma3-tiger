/*
	Код для всей 2 миссии ТИГР.
	[IMB]PIONEER
*/

// Выход если зашел во время игры
if (didJIP) exitWith {["ifa3_camp_tiger_debrif_loser_jip",false,false] call BIS_fnc_endMission;};

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6]; 
"dynamicBlur" ppEffectCommit 0;  
"dynamicBlur" ppEffectAdjust [0.0]; 
"dynamicBlur" ppEffectCommit 5;

0 fadesound 0;
0 fadeRadio 1.3;
playmusic "ifa3_tiger_m_intro";

// Переменные
razvedka_kolona=false;
kolona_brit_poshla=false;
razvedka_kolona_know=false;
art1_minus=false;
art2_minus=false;
stop1_trig=true;

player_box=[s1,s2,s3,s4,s5];
tanki_box=[tank1,tank2,tank3];
tankistu_tank1=[t1_1,t1_2,t1_3,t1_4,t1_5];

peh_brit_kolona_kom=[kolona_peh_1,kolona_peh_2,kolona_peh_3,kolona_peh_4,kolona_peh_5,kolona_peh_6,kolona_peh_7,kolona_peh_8,kolona_peh_9];
tanki_brit_kolona=[kolona_tank_1,kolona_tank_2,kolona_tank_3,kolona_tank_4,kolona_tank_5,kolona_tank_6,kolona_tank_7,kolona_tank_8,kolona_tank_9];

{_x moveincargo kolona_tank_1} foreach units  kolona_peh_1;
{_x moveincargo kolona_tank_2} foreach units  kolona_peh_2;
{_x moveincargo kolona_tank_3} foreach units  kolona_peh_3;
{_x moveincargo kolona_tank_4} foreach units  kolona_peh_4;
{_x moveincargo kolona_tank_5} foreach units  kolona_peh_5;
{_x moveincargo kolona_tank_6} foreach units  kolona_peh_6;
{_x moveincargo kolona_tank_7} foreach units  kolona_peh_7;
{_x moveincargo kolona_tank_8} foreach units  kolona_peh_8;
{_x moveincargo kolona_tank_9} foreach units  kolona_peh_9;

{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [t1_1,t2_1];
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [t1_2,t1_3,t1_4,t1_5,t2_2,t2_3,t2_4,t2_5];

// Перевооружение в MP в SP загрузка с прошлой миссии
if (isMultiplayer) then {
_player = [] spawn {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
// Телепортируем из танка игроков
{_x action ["eject",tank3];unassignvehicle _x;} foreach player_box;
sleep 0.5;
s2 setpos getmarkerpos "s2";
s3 setpos getmarkerpos "s3";
s4 setpos getmarkerpos "s4";
s5 setpos getmarkerpos "s5";
sleep 0.5;
{_x setdir 20} foreach player_box;
};
} else {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
s1 loadStatus "ifa3_camp_tiger_1_mis_s1";
s2 loadStatus "ifa3_camp_tiger_1_mis_s2";
s3 loadStatus "ifa3_camp_tiger_1_mis_s3";
s4 loadStatus "ifa3_camp_tiger_1_mis_s4";
s5 loadStatus "ifa3_camp_tiger_1_mis_s5";
{_x setDamage 0} forEach player_box;
};

// игроки
s1 setIdentity "ifa3_tiger_pers_s1";
s2 setIdentity "ifa3_tiger_pers_s2";
s3 setIdentity "ifa3_tiger_pers_s3";
s4 setIdentity "ifa3_tiger_pers_s4";
s5 setIdentity "ifa3_tiger_pers_s5";
solder setIdentity "ifa3_tiger_pers_solder";
{_x disableAI "ALL"} foreach player_box;

s1 setGroupId [localize "STR_ifa3_tiger_radio_st1","GroupColor0"];
t1_1 setGroupId [localize "STR_ifa3_tiger_radio_st2","GroupColor0"];
t2_1 setGroupId [localize "STR_ifa3_tiger_radio_st3","GroupColor0"];

{_x kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""]} forEach player_box;
{_x kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""]} foreach [solder,t1_1,t2_1];
{_x setMarkerSize [0,0]} foreach ["task2","task3"];
{_x setMarkerSize [0,0]} foreach ["kolona_tank_1","kolona_tank_2","kolona_tank_3","kolona_tank_4","kolona_tank_5","kolona_tank_6","kolona_tank_7","kolona_tank_8","kolona_tank_9"];
"zona" setMarkerAlpha 0;
{_x lock true} forEach tanki_box;
{_x setBehaviour "safe"} forEach tankistu_tank1;
{_x setBehaviour "safe"} forEach player_box;
{_x setBehaviour "safe"} forEach [t1_1,t1_2,t1_3,t1_4,t1_5];
_mar = [tank1,"tank1"] execVM "ifa3_camp_tiger\f\gomarker.sqf";
_mar = [tank2,"tank2"] execVM "ifa3_camp_tiger\f\gomarker.sqf";
_mar = [tank3,"tank3"] execVM "ifa3_camp_tiger\f\gomarker.sqf";
tank3 setFuel 0;

// Брифинг
player createDiaryRecord ["Diary", [localize "STR_ifa3_tiger_2_mis_plan1", localize "STR_ifa3_tiger_2_mis_plan1_1"]];
player createDiaryRecord ["Diary", [localize "STRD_ifa3lib_tank_peredacha_init", localize "STRD_ifa3lib_tank_peredacha"]];

// 0 и 1 задание
task0 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task0"];
task0 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task0_des", localize "STR_ifa3_tiger_2_mis_task0", localize "STR_ifa3_tiger_2_mis_task0"];
task0 setSimpleTaskDestination markerpos "tank3";

task1 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task1"];
task1 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task1_des", localize "STR_ifa3_tiger_2_mis_task1", localize "STR_ifa3_tiger_2_mis_task1"];
task1 setSimpleTaskDestination markerpos "task1";
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

// Провал если танк ТИГР уничтожен
_proval_kil_tank3 = [] spawn {
waitUntil {!alive tank1};
{
Task0 setTaskState "Failed";
["ifa3_camp_tiger_kill_tiger",false] call BIS_fnc_endMission;
} remoteExec ["bis_fnc_call", 0];
};

sleep 0.5;

// Скрипт коробки передач и запрет снятие униформы
if (isMultiplayer) then {_nul=execVM "ifa3_camp_tiger\f\Peredacha.sqf"};
_nul=execVM "ifa3_camp_tiger\f\nouniforminit.sqf";

// Вейпоинты для двух групп пехоты
_wp1_gr1 = gr1 addWaypoint [getmarkerpos "pehota_pos_1",0];
_wp1_gr1 setWaypointType "MOVE";
_wp1_gr1 setWaypointSpeed "FULL";
_wp1_gr1 setWaypointFormation "COLUMN";
_wp2_gr1 = gr1 addWaypoint [getmarkerpos "pehota_pos_1",0];
_wp2_gr1 setWaypointType "MOVE";
_wp2_gr1 setWaypointSpeed "NORMAL";
_wp2_gr1 setWaypointFormation "LINE";
_wp2_gr1 setWaypointBehaviour "COMBAT";

_wp1_gr2 = gr2 addWaypoint [getmarkerpos "pehota_pos_2",0];
_wp1_gr2 setWaypointType "MOVE";
_wp1_gr2 setWaypointSpeed "FULL";
_wp1_gr2 setWaypointFormation "COLUMN";
_wp2_gr2 = gr2 addWaypoint [getmarkerpos "pehota_pos_2",0];
_wp2_gr2 setWaypointType "MOVE";
_wp2_gr2 setWaypointSpeed "NORMAL";
_wp2_gr2 setWaypointFormation "LINE";
_wp2_gr2 setWaypointBehaviour "COMBAT";

2 fadesound 1;

// Вывод текста
sleep 1;
[parseText localize "STR_ifa3_tiger_2_mis_starttext", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
1 fadeMusic 0;
sleep 1;

// ------------------------- СТАРТ МИССИИ ------------------------- //

// ПРОПУСК СЦЕНЫ
if (isMultiplayer) then {
hint localize "STR_ifa3_tiger_1_mis_hint1";
action_s1 = s1 addAction [localize "STR_ifa3_tiger_1_mis_action1", {
{
// Пропуск задания
terminate scena_tigr;
s1 removeAction action_s1;

// задание 2 на организацию засады
Task1 setTaskState "SUCCEEDED";
task2 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task2"];
task2 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task2_des", localize "STR_ifa3_tiger_2_mis_task2", localize "STR_ifa3_tiger_2_mis_task2"];
task2 setSimpleTaskDestination markerpos "tank3";
player setCurrentTask task2;
["TaskCreated",["", localize "STR_ifa3_tiger_2_mis_task2"]] call BIS_fnc_showNotification;
t2_1 domove getMarkerPos "tank_pos";

// Меняем экипаж
tank3 lock true;
tank1 lock false;
tank3 setFuel 0;
_wp1_gr1_tank1 = gr1_tank1 addWaypoint [getMarkerPos "tank1_pos",0];
_wp1_gr1_tank1 setWaypointType "GETOUT";
_wp1_gr1_tank1 setWaypointSpeed "FULL";
_wp1_gr1_tank1 setWaypointFormation "COLUMN";
_wp2_gr1_tank1 = gr1_tank1 addWaypoint [getMarkerPos "tankistu_pos",0];
_wp2_gr1_tank1 setWaypointType "LOITER";
_wp2_gr1_tank1 setWaypointSpeed "FULL";
_wp2_gr1_tank1 setWaypointFormation "COLUMN";
_wp2_gr1_tank1 setWaypointBehaviour "SAFE";
{_x action ["eject",tank3];unassignvehicle _x;} foreach player_box;
{_x doMove position tank3} foreach tankistu_tank1;
[s2,s3,s4,s5] joinSilent s1;
task2 setSimpleTaskDestination markerpos "tank1";
{_x setBehaviour "aware"} forEach player_box;
{_x enableAI "ALL"} foreach player_box;
3 fademusic 1;
hint localize "STR_ifa3_tiger_2_mis_hint2";
if(s1 in tank1) then {task2 setSimpleTaskDestination markerpos "task2"};
[solder] joinSilent gr2;
} remoteExec ["bis_fnc_call", 0];
}];
};

// СЦЕНА
scena_tigr = [] spawn {

// Начало разговора с солдатом
solder playmove "AmovPercMstpSlowWrflDnon_Salute";
s1 playmove "AmovPercMstpSlowWrflDnon_Salute";
_say = [solder,"STR_ifa3_tiger_mis2_say1","STR_ifa3_tiger_mis2_say1",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [s1,"STR_ifa3_tiger_mis2_say2","STR_ifa3_tiger_mis2_say2",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [solder,"STR_ifa3_tiger_mis2_say3","STR_ifa3_tiger_mis2_say3",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [solder,"STR_ifa3_tiger_mis2_say4","STR_ifa3_tiger_mis2_say4",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [s1,"STR_ifa3_tiger_mis2_say5","STR_ifa3_tiger_mis2_say5",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [solder,"STR_ifa3_tiger_mis2_say6","STR_ifa3_tiger_mis2_say6",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;

_say = [s1,"STR_ifa3_tiger_mis2_say7","STR_ifa3_tiger_mis2_say7",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
[solder] joinSilent gr2;

if (isMultiplayer) then {
s1 removeAction action_s1;
{_x enableAI "ALL"} foreach player_box;};

// задание 2 на организацию засады
Task1 setTaskState "SUCCEEDED";
task2 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task2"];
task2 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task2_des", localize "STR_ifa3_tiger_2_mis_task2", localize "STR_ifa3_tiger_2_mis_task2"];
task2 setSimpleTaskDestination markerpos "tank3";
player setCurrentTask task2;
["TaskCreated",["", localize "STR_ifa3_tiger_2_mis_task2"]] call BIS_fnc_showNotification;

// Ждем когда все в танк сядут
hint localize "STR_ifa3_tiger_2_mis_hint1";
tank3 lock false;
waitUntil {s1 in tank3 and s2 in tank3 and s3 in tank3 and s4 in tank3 and s5 in tank3};
if (isMultiplayer) then {[s2,s3,s4,s5] joinSilent s1};
tank3 lock true;
{_x enableAI "ALL"} foreach player_box;
sleep 1;

// Диалог внутри танка

s1 kbTell [s3, "briefing", "STR_ifa3_tiger_mis2_say8",true];
sleep 3;

// Движок барахлит
tank3 setFuel 1;
tank3 engineOn true;
sleep 2;
tank3 setFuel 0;
tank3 engineOn false;
sleep 2;
tank3 setFuel 1;
tank3 engineOn true;
sleep 2;
tank3 setFuel 0;
tank3 engineOn false;
sleep 1;
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say9",true];
sleep 3;
s1 kbTell [s3, "briefing", "STR_ifa3_tiger_mis2_say10",true];
sleep 3;

// Диалог по рации другим танкам
s1 kbTell [t1_1, "briefing", "STR_ifa3_tiger_mis2_say11",true];
sleep 3;
t1_1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say12",true];
sleep 3;
s1 kbTell [t1_1, "briefing", "STR_ifa3_tiger_mis2_say13",true];
sleep 3;
t1_1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say14",true];
sleep 3;
s1 kbTell [t1_1, "briefing", "STR_ifa3_tiger_mis2_say15",true];
sleep 3;
t2_1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say16",true];
sleep 3;
s1 kbTell [t2_1, "briefing", "STR_ifa3_tiger_mis2_say17",true];
sleep 3;
t2_1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say18",true];
sleep 3;
s1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis2_say19",true];
sleep 3;

t2_1 domove getMarkerPos "tank_pos";

// Меняем экипаж
_wp1_gr1_tank1 = gr1_tank1 addWaypoint [getMarkerPos "tank1_pos",0];
_wp1_gr1_tank1 setWaypointType "GETOUT";
_wp1_gr1_tank1 setWaypointSpeed "FULL";
_wp1_gr1_tank1 setWaypointFormation "COLUMN";

_wp2_gr1_tank1 = gr1_tank1 addWaypoint [getMarkerPos "tankistu_pos",0];
_wp2_gr1_tank1 setWaypointType "LOITER";
_wp2_gr1_tank1 setWaypointSpeed "FULL";
_wp2_gr1_tank1 setWaypointFormation "COLUMN";
_wp2_gr1_tank1 setWaypointBehaviour "SAFE";
tank3 lock false;
tank1 lock false;
{_x enableAI "ALL"} foreach player_box;
{_x action ["eject",tank3];unassignvehicle _x;} foreach player_box;
{_x doMove position tank3} foreach tankistu_tank1;
if (isMultiplayer) then {{_x domove position of} foreach player_box} else {[s2,s3,s4,s5] joinSilent s1};
task2 setSimpleTaskDestination markerpos "tank1";
{_x setBehaviour "aware"} forEach player_box;
3 fademusic 1;
hint localize "STR_ifa3_tiger_2_mis_hint2";
if(player in tank1) then {task2 setSimpleTaskDestination markerpos "task2"};
};

// Ждем когда отъедет и пошла разведка
waitUntil {(s1 distance tank3 > 300) or (vehicle s1 distance tank3 > 300)}; 


// Скрипт для колоны
_kolona = [] spawn {
kolona_brit_poshla=true;
waitUntil {kolona_tank_1 distance pos_marker <100 or kolona_tank_2 distance pos_marker <100};
_nul = [kolona_tank_1,"kolona_tank_1"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_2,"kolona_tank_2"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_3,"kolona_tank_3"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_4,"kolona_tank_4"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_5,"kolona_tank_5"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_6,"kolona_tank_6"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_7,"kolona_tank_7"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_8,"kolona_tank_8"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
_nul = [kolona_tank_9,"kolona_tank_9"] execvm "ifa3_camp_tiger\f\gomarker.sqf";
{_x setMarkerSize [1,1]} foreach ["kolona_tank_1","kolona_tank_2","kolona_tank_3","kolona_tank_4","kolona_tank_5","kolona_tank_6","kolona_tank_7","kolona_tank_8","kolona_tank_9"];

Task2 setTaskState "SUCCEEDED";
task3 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task3"];
task3 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task3_des", localize "STR_ifa3_tiger_2_mis_task3", localize "STR_ifa3_tiger_2_mis_task3"];
task3 setSimpleTaskDestination markerpos "task2";
"task2" setMarkerSize [1,1];
player setCurrentTask task3;
["TaskCreated",["", localize "STR_ifa3_tiger_2_mis_task3"]] call BIS_fnc_showNotification;

// Ждем обнаружение
waitUntil {razvedka_kolona_know};
deleteVehicle trig_srop1;
stop1_trig=false;
{_nul = [_x,"zona"] execVM "ifa3_camp_tiger\f\UPS.sqf"} foreach peh_brit_kolona_kom;
{_x domove position s1} foreach tanki_brit_kolona;
{_nul = [_x,"zona"] execVM "ifa3_camp_tiger\f\UPS.sqf"} foreach [art1G,art2G,art3G,art4G];
};


// Ждем уничтожение колоны
waitUntil {
!canmove kolona_tank_1 and 
!canmove kolona_tank_2 and 
!canmove kolona_tank_3 and 
!canmove kolona_tank_4 and 
!canmove kolona_tank_5 and 
!canmove kolona_tank_6 and 
!canmove kolona_tank_7 and 
!canmove kolona_tank_8 and 
!canmove kolona_tank_9
};
sleep 5;
Task3 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_2_mis_task3"]] call BIS_fnc_showNotification;
sleep 3;
// Начало арт обстрела
{[_x,10,200] exec "ifa3_camp_tiger\f\obstrel.sqs"} foreach [tank3,art_levo,art_pravo,art_center];
sleep 10;

// задание 5 на уничтожение миномётов
task4 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task4"];
task4 setSimpleTaskDescription[localize "STR_ifa3_tiger_2_mis_task4_des", localize "STR_ifa3_tiger_2_mis_task4", localize "STR_ifa3_tiger_2_mis_task4"];
task4 setSimpleTaskDestination markerpos "task3";
player setCurrentTask task4;
"task3" setMarkerSize [1,1];
["TaskCreated",["", localize "STR_ifa3_tiger_2_mis_task4"]] call BIS_fnc_showNotification;

_mortar1 = [] spawn {
waitUntil {(!canmove art1 or !alive art1G) and (!canmove art2 or !alive art2G)};
art1_minus=true;
};

_mortar2 = [] spawn {
waitUntil {(!canmove art3 or !alive art3G) and (!canmove art3 or !alive art3G)};
art2_minus=true;
};

// Ждем уничтожение миномётов
waitUntil {art1_minus and art2_minus};
sleep 5;

playmusic "ifa3_tiger_m_win";
Task0 setTaskState "SUCCEEDED";
Task4 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_2_mis_task5"]] call BIS_fnc_showNotification;

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