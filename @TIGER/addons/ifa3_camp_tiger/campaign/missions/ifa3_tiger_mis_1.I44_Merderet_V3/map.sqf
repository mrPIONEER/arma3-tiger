[
	player,
	localize "STR_ifa3_tiger_1_mis_action2",										
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",	
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",	
	"(player distance karta2 < 2) or (player distance karta1 < 2)",						
	"(player distance karta2 < 2)  or (player distance karta1 < 2)",						
	{},
	{},
	{
	{
	{deleteVehicle _x} foreach [karta1,karta2];
	// Увеличиваем маркера
	{_x setMarkerSize [1.5,1.5]} foreach ["brit_mar_1","brit_mar_2","brit_mar_3","brit_mar_4","brit_mar_5","brit_mar_6","brit_mar_7","brit_mar_8","brit_mar_9","brit_mar_10","brit_mar_11","brit_mar_12","brit_mar_13","brit_mar_14","brit_mar_15","brit_mar_16","brit_mar_17","brit_mar_18"];
	terminate karta_brit_fnx;
	} remoteExec ["bis_fnc_call", 0];
	},
	{},													
	[],													
	2,													
	0,													
	true,												
	false												
] remoteExec ["BIS_fnc_holdActionAdd", 0, player];