/*
	Ракетный обстрел

	["цель_обстрела","им¤_макера вылета ракет",колво_выстрелов,разброс] spawn PL_fnc_Grad
	
	["M_ed","M_st",100,300] spawn PL_fnc_Grad
	
	Ваниль:
	"M_Zephyr" | "Missile_AA_04_F" | "Rocket_03_AP_F" | "M_NLAW_AT_F"
*/

if (!isServer) exitWith {} ;

params["_nachalo", "_konez","_kolvo","_random"];

_xp = 0;
_yp = 0;
_hp = 0;
_ps = [];
_ps0 = getMarkerPos _nachalo;
_ps1 = getMarkerPos _konez;
_ps1 set [2,400];
_dis = _ps0 distance _ps1;
_xp = (_ps0 select 0) - (_ps1 select 0);
_yp = (_ps0 select 1) - (_ps1 select 1);
_hp = (_ps0 select 2) - (_ps1 select 2);

_a = 0;
While {_a < _kolvo} do {
_ob = "LIB_R_280mm_WkSpr"  createVehicle _ps1;
_ob setPos _ps1;
_ob setVectorDirAndUp [[_xp + (random _random) - 50,_yp + (random _random) - 50,_hp],[_xp + (random _random) - 50,_yp + (random _random) - 50,_hp]];
sleep 1;
_a = _a + 1;
}; 

