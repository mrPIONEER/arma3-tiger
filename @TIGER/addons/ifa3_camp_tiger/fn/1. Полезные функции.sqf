// Все БИС функции: https://community.bistudio.com/wiki/Category:Arma_3:_Functions

[ vehicle player, 50, 60, true, 0] spawn BIS_fnc_UnitCapture;

[player] call BIS_fnc_cameraOld; // вкл камеры старой

// ДЕЙСТВИЕ: 

[
	_myLaptop,											// Object the action is attached to
	"Hack Laptop",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ _this call MY_fnc_hackingCompleted },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	12,													// Action duration [s]
	0,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _myLaptop];	// MP compatible implementation

// НОВОСТИ: 

[
	parseText "<t size='2'>AAN live in Takistan</t>",
	parseText "Weather coming up hot and steamy - Takistan shelled again from border area"
] spawn BIS_fnc_AAN;


// АНИМАЦИИ: 

[player, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;
[_unit, "STAND", "FULL"] call BIS_fnc_ambientAnimCombat;

// ВЫВОД ТЕКСТА:

["CROSSROAD", "Mission is a go, I repeat, mission is a go, Crossroad, out."] spawn BIS_fnc_showSubtitle

[ 
  ["Speaker1","Subtitle1",0], 
  ["Speaker2","Subtitle2",5], 
  ["Speaker3","Subtitle3",10], 
  ["Speaker4","Subtitle5",15] 
] spawn BIS_fnc_EXP_camp_playSubtitles;

[parseText "<t font='PuristaBold' size='1.6'>MyMission</t><br />by Username", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles

["<t color='#ff0000' size = '.8'>Warning!<br />Stop doing what you are doing</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;

[ "Somewhere on Altis", format ["Year %1", date select 0], mapGridPosition player ] spawn BIS_fnc_infoText;

// показ видео перед миссией
["\a3\missions_f_epb\video\b_out2_quotation.ogv", "your translation"] call BIS_fnc_titlecard; 

"Stratis, 2035-07-14 0130<br />A dark night ahead…" call BIS_fnc_titleText;

[
	[
		["CAMP ROGAIN,", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["RESUPPLY POINT", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["10 MINUTES LATER ...", "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
	]
] spawn BIS_fnc_typeText;

[
	[
		["CAMP ROGAIN, ", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
		["RESUPPLY POINT", "align = 'center' shadow = '1' size = '0.7'", "#aaaaaa"],
		["","<br/>"], // line break
		["10 MINUTES LATER...","align = 'center' shadow = '1' size = '1.0'"]
	]
] spawn BIS_fnc_typeText2;

// ВИДЕО:

_video = ["A3\Missions_F_EPA\video\A_in_intro.ogv"] spawn BIS_fnc_playVideo;

// ЗАДАЧИ ДЛЯ ЮНИТОВ: 

[group this, getPos this, 250] call bis_fnc_taskPatrol
[opforGroup, getPosATL player] call BIS_fnc_taskAttack
[group this, getPos this] call bis_fnc_taskDefend

// ВКЛЮЧИТЬ ЛАМПЫ:

// Switches all lamps off in a radius of 200m
private _lampsIn200m = nearestObjects [player, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], 200];
{ [_x, false] call BIS_fnc_switchLamp; } forEach _lampsIn200m;

// УНИЧТОЖЕНИЕ ЗДАНИЙ: 

["destroyBase", 500, 42, [ourHouseInTheMiddleOfTheStreet]] call BIS_fnc_destroyCity;

// АРТА ИИ СТРЕЛЯЕТ:

[group this, getMarkerPos "end", objNull, 30, "8Rnd_82mm_Mo_shells"] spawn BIS_fnc_wpArtillery;
mortar1 doArtilleryFire [[3000, 120, 1000], "8Rnd_82mm_Mo_shells", 3];

// МУЗЫКА: 

["LeadTrack04_F",10,0.5] call BIS_fnc_playMusic;

// ИИ садится в технику:

[myCar, player, "cargo"] [call]] BIS_fnc_moveIn;

// ГРЯЗЬ НА ЛИЦЕ ИГРОКА:

[player, 0.9] call BIS_fnc_dirtEffect;