/*
	Автор: PIONEER
	Радиоперегоры США. Требуется RHS
	
	1 - точка радио.
	[radio] spawn PL_fnc_radioEn;
*/

params ["_radio"];

while {alive _radio} do {
_sound = ["rhs_usa_land_rc_1","rhs_usa_land_rc_2","rhs_usa_land_rc_3","rhs_usa_land_rc_4","rhs_usa_land_rc_5","rhs_usa_land_rc_6","rhs_usa_land_rc_7","rhs_usa_land_rc_8","rhs_usa_land_rc_9","rhs_usa_land_rc_10","rhs_usa_land_rc_11","rhs_usa_land_rc_12","rhs_usa_land_rc_13","rhs_usa_land_rc_14","rhs_usa_land_rc_15","rhs_usa_land_rc_16","rhs_usa_land_rc_17","rhs_usa_land_rc_18","rhs_usa_land_rc_19","rhs_usa_land_rc_20","rhs_usa_land_rc_21","rhs_usa_land_rc_22","rhs_usa_land_rc_23","rhs_usa_land_rc_24","rhs_usa_land_rc_25","rhs_usa_land_rc_26","rhs_usa_land_rc_27","rhs_usa_land_rc_28","rhs_usa_land_rc_29","rhs_usa_land_rc_30","rhs_usa_land_rc_31","rhs_usa_land_rc_32","rhs_usa_land_rc_33","rhs_usa_land_rc_34","rhs_usa_land_rc_35","rhs_usa_land_rc_36"] call BIS_fnc_selectRandom;
_radio say3D _sound;
sleep 30;
};