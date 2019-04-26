/*
	Код для всей 4 миссии ТИГР.
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

// Переменные
player_box=[s1,s2,s3,s4,s5];
tank2_unit=[t1_1,t1_2,t1_3,t1_4,t1_5];
tank_zachistka=false;

// игроки
s1 setIdentity "ifa3_tiger_pers_s1";
s2 setIdentity "ifa3_tiger_pers_s2";
s3 setIdentity "ifa3_tiger_pers_s3";
s4 setIdentity "ifa3_tiger_pers_s4";
s5 setIdentity "ifa3_tiger_pers_s5";
s1 setGroupId [localize "STR_ifa3_tiger_radio_st1","GroupColor0"];
{_x kbAddTopic ["briefing", "ifa3_camp_tiger\f\briefing.bikb", ""]} forEach player_box;
_mar = [tank1,"tank1"] execVM "ifa3_camp_tiger\f\gomarker.sqf";
{_x allowDamage false} forEach player_box;
{_x allowDamage false} forEach tank2_unit;
of allowDamage false;

// Перевооружение в MP в SP загрузка с прошлой миссии
if (isMultiplayer) then {
_player = [] spawn {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
};
} else {
s1 call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s1.sqf";
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
s1 loadStatus "ifa3_camp_tiger_2_mis_s1";
s2 loadStatus "ifa3_camp_tiger_2_mis_s2";
s3 loadStatus "ifa3_camp_tiger_2_mis_s3";
s4 loadStatus "ifa3_camp_tiger_2_mis_s4";
s5 loadStatus "ifa3_camp_tiger_2_mis_s5";
{_x setDamage 0} forEach player_box;
};


// Брифинг
player createDiaryRecord ["Diary", [localize "STR_ifa3_tiger_4_mis_plan1", localize "STR_ifa3_tiger_4_mis_plan1_1"]];
player createDiaryRecord ["Diary", [localize "STRD_ifa3lib_tank_peredacha_init", localize "STRD_ifa3lib_tank_peredacha"]];


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


sleep 0.5;

// Скрипт коробки передач и запрет снятие униформы
if (isMultiplayer) then {_nul=execVM "ifa3_camp_tiger\f\Peredacha.sqf"};
_nul=execVM "ifa3_camp_tiger\f\nouniforminit.sqf";

2 fadesound 1;

// Вывод текста
sleep 1;
[parseText localize "STR_ifa3_tiger_4_mis_starttext", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;


/////////////////// МИССИЯ ///////////////////

dialog_of = [] spawn {
_say = [s1,"STR_ifa3_tiger_mis4_say1","STR_ifa3_tiger_mis4_say1",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say2","STR_ifa3_tiger_mis4_say2",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say3","STR_ifa3_tiger_mis4_say3",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say4","STR_ifa3_tiger_mis4_say4",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say5","STR_ifa3_tiger_mis4_say5",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say6","STR_ifa3_tiger_mis4_say6",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say7","STR_ifa3_tiger_mis4_say7",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say8","STR_ifa3_tiger_mis4_say8",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say9","STR_ifa3_tiger_mis4_say9",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say10","STR_ifa3_tiger_mis4_say10",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say11","STR_ifa3_tiger_mis4_say11",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say12","STR_ifa3_tiger_mis4_say12",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say13","STR_ifa3_tiger_mis4_say13",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say14","STR_ifa3_tiger_mis4_say14",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say15","STR_ifa3_tiger_mis4_say15",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [s1,"STR_ifa3_tiger_mis4_say16","STR_ifa3_tiger_mis4_say16",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
_say = [of,"STR_ifa3_tiger_mis4_say17","STR_ifa3_tiger_mis4_say17",3] execvm "ifa3_camp_tiger\f\say3d.sqf";
sleep 3;
if (isMultiplayer) then {s1 removeAction action_s1;};
};

sleep 3;

// Пропуск В МП
if (isMultiplayer) then {
hint localize "STR_ifa3_tiger_1_mis_hint1";
action_s1 = s1 addAction [localize "STR_ifa3_tiger_1_mis_action1", {
{
terminate dialog_of;
s1 removeAction action_s1;
} remoteExec ["bis_fnc_call", 0];
}];
};

waitUntil {scriptdone dialog_of};

// Телепорт к танку
cutText ["","Black out",2];
setacctime 1;
sleep 2;
2 fadesound 0;
sleep 0.5;
s1 setpos getmarkerpos "s1";
s2 setpos getmarkerpos "s2";
s3 setpos getmarkerpos "s3";
s4 setpos getmarkerpos "s4";
s5 setpos getmarkerpos "s5";
sleep 0.5;
cutText ["","Black in",2];
sleep 2;
2 fadesound 1;

// 1 задание
task1 = player createSimpleTask [localize "STR_ifa3_tiger_4_mis_task1"];
task1 setSimpleTaskDescription[localize "STR_ifa3_tiger_4_mis_task1_des", localize "STR_ifa3_tiger_4_mis_task1", localize "STR_ifa3_tiger_4_mis_task1"];
task1 setSimpleTaskDestination markerpos "tank_rolik";
player setCurrentTask task1;
["TaskCreated",["", localize "STR_ifa3_tiger_4_mis_task1"]] call BIS_fnc_showNotification;
{_x allowDamage true} forEach player_box;

sleep 5;
if (!isMultiplayer) then {savegame};

// Зачистили танк возле
waitUntil {tank_zachistka and s1 distance tank1 <100};
setacctime 1;
sleep 2;
Task1 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_4_mis_task1"]] call BIS_fnc_showNotification;
sleep 1;

cutText ["","Black out",2];
setacctime 1;
sleep 2;
2 fadesound 0;
sleep 0.5;
{_x action ["eject",tank3];unassignvehicle _x;} foreach player_box;
sleep 1;
s1 setpos getmarkerpos "s1_1";
s2 setpos getmarkerpos "s2_1";
s3 setpos getmarkerpos "s3_1";
s4 setpos getmarkerpos "s4_1";
s5 setpos getmarkerpos "s5_1";

track_tank1 setpos getmarkerpos "tank1_car";
if (canmove tank3) then {tank3 setpos getmarkerpos "tank3_pos"};
{_x setpos getmarkerpos "tank1_car";} foreach tank2_unit;

cutText ["","Black in",2];
sleep 2;
2 fadesound 1;
sleep 1;

// болтовня
setacctime 1;
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say1",false];
sleep 3;
s2 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say2",false];
sleep 3;
s2 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say3",false];
sleep 3;
s4 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say4",false];
sleep 3;
s2 kbTell [s4, "briefing", "STR_ifa3_tiger_mis5_say5",false];
sleep 3;
s1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say6",false];
sleep 3;
s2 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say7",false];
sleep 3;
s4 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say8",false];
sleep 3;
s1 kbTell [s1, "briefing", "STR_ifa3_tiger_mis5_say9",false];
sleep 3;

{[_x] joinsilent s1} foreach tank2_unit;

sleep 1;

// 2 задание
task2 = player createSimpleTask [localize "STR_ifa3_tiger_4_mis_task2"];
task2 setSimpleTaskDescription[localize "STR_ifa3_tiger_4_mis_task2_des", localize "STR_ifa3_tiger_4_mis_task2", localize "STR_ifa3_tiger_4_mis_task2"];
task2 setSimpleTaskDestination markerpos "brit";
player setCurrentTask task2;
["TaskCreated",["", localize "STR_ifa3_tiger_4_mis_task2"]] call BIS_fnc_showNotification;

sleep 5;
if (!isMultiplayer) then {savegame};

// Время
hint localize "STR_ifa3_tiger_4_mis_hint1";
sleep 300;
hint localize "STR_ifa3_tiger_4_mis_hint2";
sleep 300;
hint localize "STR_ifa3_tiger_4_mis_hint3";
sleep 180;
hint localize "STR_ifa3_tiger_4_mis_hint4";
sleep 130;

playmusic "ifa3_tiger_m_win";
Task2 setTaskState "SUCCEEDED";
["TaskSucceeded",["",localize "STR_ifa3_tiger_3_mis_task2"]] call BIS_fnc_showNotification;
sleep 3;

// Ролик конечный
{_x allowDamage false} forEach player_box;
{_x allowDamage false} forEach tank2_unit;
playmusic "ifa3_tiger_m_win";
titlecut["","black out",3];
3 fadesound 0;
sleep 3;
titlecut["","black in",1];
1 fadesound 1;
_camera = "camera" camCreate [2485.99,2352.82,29.48];
_camera cameraEffect ["internal","back"];
_camera camPrepareTarget [42478.49,92752.66,-14891.53];
_camera camPreparePos [2485.99,2352.82,29.48];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0
_camera camPrepareTarget [42478.49,92752.66,-14891.53];
_camera camPreparePos [2541.15,2477.58,30.51];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 15

sleep 5;
// Конец
["end1",true,10,false] call BIS_fnc_endMission;
if (true) exitWith {};