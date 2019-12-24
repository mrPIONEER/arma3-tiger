titlecut["","black out",3];
1 fadesound 0;
setacctime 1;
sleep 3;
// убиваем всех, кто остался в городе
_nem = nearestObjects [gorod, ["LIB_UK_Soldier_base"], 700];
{_x setdamage 1;} foreach _nem;

// телепортим всех
s1 setpos getmarkerpos "s1";
s2 setpos getmarkerpos "s2";
s3 setpos getmarkerpos "s3";
s4 setpos getmarkerpos "s4";
s5 setpos getmarkerpos "s5";
sleep 1;

s1 moveInCommander tank1;
s2 moveInGunner tank1;
s3 moveindriver tank1;
s4 moveInTurret [tank1, [0, 1]];
s5 moveInTurret [tank1, [1, 0]];

tank1 setpos getmarkerpos "tank_rolik";
tank1 setdir 90;
{dostop _x} foreach units s1;
sleep 2;
setacctime 1;
_camera = "camera" camCreate [2453.85,2563.43,3.73];
_camera cameraEffect ["internal","back"];
_camera camPrepareTarget [100864.97,-13222.19,-8122.98];
_camera camPreparePos [2453.85,2563.43,3.73];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

titlecut["","black in",3];
[parseText localize "STR_ifa3_tiger_2_mis_starttext2", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
2 fadesound 1;
_camera camPrepareTarget [95219.56,11240.33,-36349.13];
_camera camPreparePos [2472.53,2560.43,4.27];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

// движок барахлит
tank1 setfuel 0;
sleep 1;
tank1 setfuel 1;
tank1 engineOn true;
sleep 1;
tank1 setfuel 0;
sleep 1;
tank1 setfuel 1;
tank1 engineOn true;
sleep 1;
tank1 setfuel 0;
sleep 1;
tank1 setfuel 1;
tank1 engineOn true;
sleep 1;
tank1 setfuel 0;
sleep 2;

// болтовня
if (s3 in tank1 and s1 in tank1) then {
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis3_say1",true];
sleep 2;
s1 kbTell [s3, "briefing", "STR_ifa3_tiger_mis3_say2",true];
sleep 1;
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis3_say3",true];
sleep 2;
s1 kbTell [s3, "briefing", "STR_ifa3_tiger_mis3_say4",true];
sleep 2;
s3 kbTell [s1, "briefing", "STR_ifa3_tiger_mis3_say5",true];
sleep 12;
s1 kbTell [s3, "briefing", "STR_ifa3_tiger_mis3_say6",true];
sleep 13
};

_camera cameraeffect ["terminate", "Back"];
camDestroy _camera;