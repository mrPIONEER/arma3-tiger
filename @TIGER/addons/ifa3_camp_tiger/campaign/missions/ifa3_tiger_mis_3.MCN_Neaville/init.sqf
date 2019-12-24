/*
	Код для всей 3 миссии ТИГР.
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
player_box=[s1,s2,s3,s4,s5];

trevoga=true;

// игроки
s1 setIdentity "ifa3_tiger_pers_s1";
s2 setIdentity "ifa3_tiger_pers_s2";
s3 setIdentity "ifa3_tiger_pers_s3";
s4 setIdentity "ifa3_tiger_pers_s4";
s5 setIdentity "ifa3_tiger_pers_s5";
s1 setGroupId [localize "STR_ifa3_tiger_radio_st1","GroupColor0"];
{_x kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""]} forEach player_box;
_mar = [tank1,"tank1"] execVM "ifa3_camp_tiger\f\gomarker.sqf";

// Перевооружение в MP в SP загрузка с прошлой миссии
if (isMultiplayer) then {
_player = [] spawn {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
// Телепортируем из танка игроков
{_x action ["eject",tank1];unassignvehicle _x;} foreach player_box;
sleep 0.5;
{_x setdir 20} foreach player_box;
};
} else {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
s1 loadStatus "ifa3_camp_tiger_2_mis_s1";
s2 loadStatus "ifa3_camp_tiger_2_mis_s2";
s3 loadStatus "ifa3_camp_tiger_2_mis_s3";
s4 loadStatus "ifa3_camp_tiger_2_mis_s4";
s5 loadStatus "ifa3_camp_tiger_2_mis_s5";
s1 moveInCommander tank1;
s2 moveInGunner tank1;
s3 moveindriver tank1;
s4 moveInTurret [tank1, [0, 1]];
s5 moveInTurret [tank1, [1]];
{_x setDamage 0} forEach player_box;
};


// Брифинг
player createDiaryRecord ["Diary", [localize "STR_ifa3_tiger_3_mis_plan1", localize "STR_ifa3_tiger_3_mis_plan1_1"]];

// 1 задание
task1 = player createSimpleTask [localize "STR_ifa3_tiger_3_mis_task1"];
task1 setSimpleTaskDescription[localize "STR_ifa3_tiger_3_mis_task1_des", localize "STR_ifa3_tiger_3_mis_task1", localize "STR_ifa3_tiger_3_mis_task1"];
task1 setSimpleTaskDestination markerpos "zona";
player setCurrentTask task1;

task0 = player createSimpleTask [localize "STR_ifa3_tiger_2_mis_task0"];
task0 setSimpleTaskDescription[localize "STR_ifa3_tiger_1_mis_task0_des", localize "STR_ifa3_tiger_2_mis_task0", localize "STR_ifa3_tiger_2_mis_task0"];
task0 setSimpleTaskDestination markerpos "tank3";

// Отключаем сохранение и провал если хоть 1 игрок умер в MP
if (isMultiplayer) then {
enableSaving [false, false];
{_x addEventHandler ["Killed", {
{
["ifa3_camp_tiger_debrif_loser_kill_player",false] call BIS_fnc_endMission;
} remoteExec ["bis_fnc_call", 0];
}];
} forEach allPlayers;
};

// Провал если танк ТИГР уничтожен
_proval_kil_tank1 = [] spawn {
waitUntil {!alive tank1};
{
Task0 setTaskState "Failed";
["ifa3_camp_tiger_kill_tiger",false] call BIS_fnc_endMission;
} remoteExec ["bis_fnc_call", 0];
};

sleep 0.5;

// запрет снятие униформы
[]execVM "ifa3_camp_tiger\f\nouniforminit.sqf";

2 fadesound 1;

// Вывод текста
sleep 1;
[parseText localize "STR_ifa3_tiger_3_mis_starttext", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;


/////////////////// МИССИЯ ///////////////////
sleep 10;
10 fademusic 0;

// дебаг миссии {_x setDamage 1} foreach [brit_tank1,brit_tank2,brit_tank3,brit_tank4];

// ТРЕВОГА
_trevoga = [] spawn {
waitUntil {trevoga};
{[_x,"sity_zona"] execVM "ifa3_camp_tiger\f\ups.sqf";} foreach [brit_tank1,brit_tank2,brit_tank3,brit_tank4,brit_trevoga_1,brit_trevoga_2];
brit_trevoga_1 setpos getmarkerpos "uk_btr_1";
brit_trevoga_2 setpos getmarkerpos "uk_btr_2";
};

// Танки уничтожены бритов
waitUntil {!canmove brit_tank1 and !canmove brit_tank2 and !canmove brit_tank3 and !canmove brit_tank4};
sleep 2;
Task1 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_3_mis_task1"]] call BIS_fnc_showNotification;

sleep 3;
// запускаем и ждем окончания ролика
_rolick = [] execVM "rolik.sqf";
waitUntil {scriptdone _rolick};

sleep 3;
hint localize "STR_ifa3_tiger_3_mis_hint1";

// 2 задание - тикать назад
task2 = player createSimpleTask [localize "STR_ifa3_tiger_3_mis_task2"];
task2 setSimpleTaskDescription[localize "STR_ifa3_tiger_3_mis_task2_des", localize "STR_ifa3_tiger_3_mis_task2", localize "STR_ifa3_tiger_3_mis_task2"];
task2 setSimpleTaskDestination markerpos "ger";
player setCurrentTask task2;
["TaskCreated",["", localize "STR_ifa3_tiger_3_mis_task2"]] call BIS_fnc_showNotification;

// 3 отряда пехоты в город
{_x setpos getmarkerpos "spawn_left"} foreach units uk_squad_full_1;
{_x setpos getmarkerpos "spawn_right"} foreach units uk_squad_full_2;
{_x setpos getmarkerpos "spawn_center"} foreach units uk_squad_full_3;
[uk_squad_full_1,"sity_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[uk_squad_full_2,"sity_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[uk_squad_full_3,"sity_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

// в нижнию зону
uk_btr_1 setpos getmarkerpos "uk_btr_1";
uk_btr_2 setpos getmarkerpos "uk_btr_2";
uk_btr_3 setpos getmarkerpos "uk_btr_2";
[uk_btr_1,"bot_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[uk_btr_2,"bot_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[uk_btr_3,"bot_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

// война за низ лево
{[_x,"bot_zona","noslow","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [ger_btr_1,ger_btr_2,ger_puma,ger_pz4_1,ger_sdk222];
uk_btr_4 setpos getmarkerpos "uk_btr_4";
uk_btr_5 setpos getmarkerpos "uk_btr_5";
uk_jeep_1 setpos getmarkerpos "uk_jeep_1";
uk_pz_1 setpos getmarkerpos "uk_pz_1";
uk_pz_2 setpos getmarkerpos "uk_pz_2";
{[_x,"bot_zona","noslow","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [uk_razved_1,uk_razved_2];
{[_x,"bot_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [uk_btr_4,uk_btr_5,uk_jeep_1,uk_pz_1,uk_pz_2];

// война за вверх право
{[_x,"right_zona","noslow","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [ger_btr_3,ger_btr_4,ger_pz4_2];
uk_btr_6 setpos getmarkerpos "uk_btr_6";
uk_btr_7 setpos getmarkerpos "uk_btr_7";
uk_jeep_2 setpos getmarkerpos "uk_jeep_2";
uk_pz_3 setpos getmarkerpos "uk_pz_3";
uk_pz_4 setpos getmarkerpos "uk_pz_4";
{[_x,"right_zona","noslow","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [uk_razved_3,uk_razved_4];
{[_x,"right_zona","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf";} foreach [uk_btr_6,uk_btr_7,uk_jeep_2,uk_pz_3,uk_pz_4];

// ПОСТЫ 
[uk_squad_post_1,"uk_post_1","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";
[uk_squad_post_2,"uk_post_1","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";
[uk_squad_post_3,"uk_post_1","randomdn"] execVM "ifa3_camp_tiger\f\UPS.sqf";


sleep 2;
{_x action ["eject",tank1];unassignvehicle _x;} foreach player_box;
waitUntil {!(s1 in tank1) and !(s2 in tank1) and !(s3 in tank1) and !(s4 in tank1) and !(s5 in tank1)};
tank1 lock true;

sleep 5;
if (!isMultiplayer) then {savegame};


// КОНЕЦ
waitUntil {s1 distance of < 200};
sleep 5;

playmusic "ifa3_tiger_m_win";
Task0 setTaskState "SUCCEEDED";
Task2 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_3_mis_task2"]] call BIS_fnc_showNotification;

// Сохраняем статус солдат для SP для миссии 2 
if (!isMultiplayer) then {
s1 saveStatus "ifa3_camp_tiger_3_mis_s1";
s2 saveStatus "ifa3_camp_tiger_3_mis_s2";
s3 saveStatus "ifa3_camp_tiger_3_mis_s3";
s4 saveStatus "ifa3_camp_tiger_3_mis_s4";
s5 saveStatus "ifa3_camp_tiger_3_mis_s5";
};

// Конец
["end1",true,10,false] call BIS_fnc_endMission;
if (true) exitWith {};