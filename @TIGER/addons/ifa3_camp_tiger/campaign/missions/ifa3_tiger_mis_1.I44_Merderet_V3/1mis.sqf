/*
	Интро и сцена в амбаре 
*/

2 fadesound 0.1;

[true] call PL_fnc_Cam;
titleCut ["","BLACK in",0];
[parseText localize "STR_ifa3_tiger_1_mis_starttext", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
[tank1,[11,-20,5],0] call PL_fnc_CamTarget;
sleep 2;
[tank1,[11,-20,1],10] call PL_fnc_CamTarget;
sleep 10;
[2] spawn PL_fnc_CamPerehod;
sleep 2;
[false] call PL_fnc_Cam;


// Ждем пролета самолета
waitUntil {sam1 distance tank1 < 1500};
[2] spawn PL_fnc_CamPerehod;
sleep 2;
[true] call PL_fnc_Cam;
[sam1,[-25,-50,2],10] call PL_fnc_CamAttach;
sleep 5;
[2] spawn PL_fnc_CamPerehod;
sleep 2;
[false] call PL_fnc_Cam;

// Диалог экипажа по радио

_dialog = [] spawn {
[s2,"STR_ifa3_tiger_mis1_say1","STR_ifa3_tiger_mis1_say1",false,true] spawn PL_fnc_Say;
sleep 1;
[s1,"STR_ifa3_tiger_mis1_say2","STR_ifa3_tiger_mis1_say2",false,true] spawn PL_fnc_Say;
sleep 2;
[s2,"STR_ifa3_tiger_mis1_say3","STR_ifa3_tiger_mis1_say3",false,true] spawn PL_fnc_Say;
sleep 3;
[s3,"STR_ifa3_tiger_mis1_say4","STR_ifa3_tiger_mis1_say4",false,true] spawn PL_fnc_Say;
sleep 3;
[s5,"STR_ifa3_tiger_mis1_say5","STR_ifa3_tiger_mis1_say5",false,true] spawn PL_fnc_Say;
sleep 3;
[s3,"STR_ifa3_tiger_mis1_say6","STR_ifa3_tiger_mis1_say6",false,true] spawn PL_fnc_Say;
sleep 8;
[s1,"STR_ifa3_tiger_mis1_say7","STR_ifa3_tiger_mis1_say7",false,true] spawn PL_fnc_Say;
sleep 1;
[s1,"STR_ifa3_tiger_mis1_say8","STR_ifa3_tiger_mis1_say8",false,true] spawn PL_fnc_SayRadio;
sleep 11;
2 fademusic 1;
konez_dialog_start=true;
};

// Ждем когда доедем и меняем сцену
waitUntil {kolona_priehala and konez_dialog_start};
setAccTime 1;
{doStop _x} foreach [s3,t1_3,t2_3];
if (isMultiplayer) then {tank3 setFuel 0};
{_x engineOn false} forEach tanki_box;
{_x disableAI "ALL"} foreach player_box;
{_x disableAI "ALL"} foreach tankistu_box;

cutText ["","Black out",2];
0 fadeSound 2;
sleep 2;
tank3 setFuel 0;
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

[true] call PL_fnc_Cam;
[radio,[-1,1,1],0] call PL_fnc_CamTarget;

cutText ["","Black in",1];
1 fadeSound 1;
1 fademusic 0;
sleep 1;

// Диалог экипажа в амбаре
dialog2 = [] spawn {
setAccTime 1;
radio say3d "ifa3_tiger_s_morze";
[s5,"STR_ifa3_tiger_mis1_say9","STR_ifa3_tiger_mis1_say9",false,true] spawn PL_fnc_Say;
sleep 5;
[s2,"STR_ifa3_tiger_mis1_say10","STR_ifa3_tiger_mis1_say10",false,true] spawn PL_fnc_Say;
sleep 5;
[s1,"STR_ifa3_tiger_mis1_say11","STR_ifa3_tiger_mis1_say11",false,true] spawn PL_fnc_Say;
sleep 1;
[s5,"STR_ifa3_tiger_mis1_say12","STR_ifa3_tiger_mis1_say12",false,true] spawn PL_fnc_Say;
sleep 5;
[s4,"STR_ifa3_tiger_mis1_say13","STR_ifa3_tiger_mis1_say13",false,true] spawn PL_fnc_Say;
sleep 2;
[s2,"STR_ifa3_tiger_mis1_say14","STR_ifa3_tiger_mis1_say14",false,true] spawn PL_fnc_Say;
sleep 3;
[s5,"STR_ifa3_tiger_mis1_say15","STR_ifa3_tiger_mis1_say15",false,true] spawn PL_fnc_Say;
sleep 5;
[s2,"STR_ifa3_tiger_mis1_say16","STR_ifa3_tiger_mis1_say16",false,true] spawn PL_fnc_Say;
sleep 2;
[s1,"STR_ifa3_tiger_mis1_say17","STR_ifa3_tiger_mis1_say17",false,true] spawn PL_fnc_Say;
sleep 9;
[s4,"STR_ifa3_tiger_mis1_say17_1","STR_ifa3_tiger_mis1_say17_1",false,true] spawn PL_fnc_Say;
sleep 2;
[s2,"STR_ifa3_tiger_mis1_say18","STR_ifa3_tiger_mis1_say18",false,true] spawn PL_fnc_Say;
sleep 3;
[s1,"STR_ifa3_tiger_mis1_say19","STR_ifa3_tiger_mis1_say19",false,true] spawn PL_fnc_Say;
sleep 13;
[s4,"STR_ifa3_tiger_mis1_say20","STR_ifa3_tiger_mis1_say20",false,true] spawn PL_fnc_Say;
sleep 2;
[s1,"STR_ifa3_tiger_mis1_say21","STR_ifa3_tiger_mis1_say21",false,true] spawn PL_fnc_Say;
sleep 16;
[s3,"STR_ifa3_tiger_mis1_say22","STR_ifa3_tiger_mis1_say22",false,true] spawn PL_fnc_Say;
sleep 1;
[s5,"STR_ifa3_tiger_mis1_say23","STR_ifa3_tiger_mis1_say23",false,true] spawn PL_fnc_Say;
sleep 4;
[s4,"STR_ifa3_tiger_mis1_say24","STR_ifa3_tiger_mis1_say24",false,true] spawn PL_fnc_Say;
sleep 2;
[s1,"STR_ifa3_tiger_mis1_say25","STR_ifa3_tiger_mis1_say25",false,true] spawn PL_fnc_Say;
sleep 1;
[s2,"STR_ifa3_tiger_mis1_say26","STR_ifa3_tiger_mis1_say26",false,true] spawn PL_fnc_Say;
sleep 6;
konez_dialog2=true;
};

[radio,[-2,5,1],10] call PL_fnc_CamTarget;
sleep 10;
[false] call PL_fnc_Cam;


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
["Task1","Canceled"] call BIS_fnc_taskSetState;
[west, ["task2"], [localize "STR_ifa3_tiger_1_mis_task2_des", localize "STR_ifa3_tiger_1_mis_task2", "task2"], objNull ,1, 2, false, "default"] call BIS_fnc_taskCreate;
[west, ["task3"], [localize "STR_ifa3_tiger_1_mis_task3_des", localize "STR_ifa3_tiger_1_mis_task3", "task3"], objNull ,1, 2, false, "default"] call BIS_fnc_taskCreate;
[west, ["task4"], [localize "STR_ifa3_tiger_1_mis_task4_des", localize "STR_ifa3_tiger_1_mis_task4", "task4"], objNull ,1, 2, false, "default"] call BIS_fnc_taskCreate;

// Показываем маркера
"task2" setMarkerSize [1,1];
"task3" setMarkerSize [75,116];
"task4" setMarkerSize [100,116];

sleep 2;

// Ставим активное задание 2 и уведомление
setAccTime 1;
["TaskCreated",["", localize "STR_ifa3_tiger_1_mis_hint2"]] call BIS_fnc_showNotification;

// Сохранение для SP
_save_sp = [] spawn {
if (!isMultiplayer) then {
sleep 60;
saveGame;
};
};

// вызов авиации
[] spawn {
waitUntil {s1 distance radio > 20};
[]execvm"cpt_air.sqf";
};

[]execVM "2mis.sqf";