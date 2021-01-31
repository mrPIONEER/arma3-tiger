/*
	Код для всей 1 миссии ТИГР.
	[IMB]PIONEER
*/

// Выход если зашел во время игры
if (didJIP) exitWith {["ifa3_camp_tiger_debrif_loser_jip",false,false] call BIS_fnc_endMission;};

setViewDistance 1500;

titleCut ["","BLACK faded",0];

0 fadesound 0;
0 fadeRadio 1.3;
playmusic "ifa3_tiger_m_intro";

// Переменные
konez_dialog_start=false;
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
{_x call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\w\s2.sqf";} foreach [s2,s3,s4,s5];
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
{_x setMarkerAlpha 0} foreach ["zona1","zona2","zona3","zona4","zona5","zona6","zona_all","zona_art","zona_niz_1","zona_niz_2","zona_niz_3","zona_niz_4"];

// Для синих
{_x setMarkerSize [0,0]} foreach ["task2","task3","task4","task5","task0"];

// Для карты зеленых
{_x setMarkerSize [0,0]} foreach ["brit_mar_1","brit_mar_2","brit_mar_3","brit_mar_4","brit_mar_5","brit_mar_6","brit_mar_7","brit_mar_8","brit_mar_9","brit_mar_10","brit_mar_11","brit_mar_12","brit_mar_13","brit_mar_14","brit_mar_15","brit_mar_16","brit_mar_17","brit_mar_18"];

// Брифинг
player createDiaryRecord ["Diary", [localize "STR_ifa3_tiger_1_mis_plan1", localize "STR_ifa3_tiger_1_mis_plan1_1"]];

// 1 задание
[west, ["task1"], [localize "STR_ifa3_tiger_1_mis_task1_des", localize "STR_ifa3_tiger_1_mis_task1", "pos1"], objNull ,1, 2, false, "default"] call BIS_fnc_taskCreate;

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

[true] spawn PL_fnc_No3D;
[] spawn PL_fnc_Debug;
[] spawn PL_fnc_nouniform;
[] spawn PL_fnc_NoSnake;
[] execVM "map.sqf";

[]execVM "1mis.sqf";


