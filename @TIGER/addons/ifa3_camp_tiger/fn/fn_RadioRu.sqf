/*
	Автор: PIONEER
	Радиоперегоры РФ. Требуется RHS
	
	1 - точка радио.
	[radio] spawn PL_fnc_radioru;
*/

params ["_radio"];

while {alive _radio} do {
_sound = ["rhs_rus_land_rc_01","rhs_rus_land_rc_02","rhs_rus_land_rc_03","rhs_rus_land_rc_04","rhs_rus_land_rc_05","rhs_rus_land_rc_06","rhs_rus_land_rc_07","rhs_rus_land_rc_08","rhs_rus_land_rc_09","rhs_rus_land_rc_10","rhs_rus_land_rc_11","rhs_rus_land_rc_12","rhs_rus_land_rc_13","rhs_rus_land_rc_14","rhs_rus_land_rc_15","rhs_rus_land_rc_16","rhs_rus_land_rc_17","rhs_rus_land_rc_18","rhs_rus_land_rc_19","rhs_rus_land_rc_20","rhs_rus_land_rc_21","rhs_rus_land_rc_22","rhs_rus_land_rc_23","rhs_rus_land_rc_24","rhs_rus_land_rc_25","rhs_rus_land_rc_26","rhs_rus_land_rc_27","rhs_rus_land_rc_28","rhs_rus_land_rc_29","rhs_rus_land_rc_30","rhs_rus_land_rc_31","rhs_rus_land_rc_32","rhs_rus_land_rc_01","rhs_rus_land_rc_33","rhs_rus_land_rc_34","rhs_rus_land_rc_35","rhs_rus_land_rc_36"] call BIS_fnc_selectRandom;
_radio say3D _sound;
sleep 30;
};