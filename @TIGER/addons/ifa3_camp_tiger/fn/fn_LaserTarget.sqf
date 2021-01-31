// УНИЧТОЖЕНИЕ ЦЕЛИ ПО ЛАЗЕРНОМУ НАВЕДЕНИЮ.
//////////////////////////////////////////
// автор: Ванька Still
/////////////////////
// вызов скрипта:		_L_targ = [270,10] spawn PL_fnc_Lasertarget;
// порядок аргументов:	[азимут, время_захвата_цели]
// АЗИМУТ - с какой стороны летит ракета
//////////////////////////////////////////

_dir = _this select 0;
_timer = _this select 1;
 
// проверка включения лазера
while {isNull laserTarget player} do {hint "Turn on the laser!";sleep 1};

// ожидание наведения функция
_navedenie = {
_all_target = nearestObjects [laserTarget player, ["Tank","Car","Truck","Air","Ship"], 5];
_targetx = _all_target select 0;
	if (isNull laserTarget player) then {_i = 0; hint "No marker..."}
		else {
		if (count _all_target == 0) then {_i = 0;hint "No target..."}
			else {
				if (!canMove _targetx) then {hint "Immobilized..."} 
					else {
						_name_targ = getText (configFile >> "cfgVehicles" >>TypeOf _targetx >> "displayName");
						hint format ["Targeting: %1 %2\n------------------------\nTarget:\n%3",_i,"%",_name_targ];
					}
				}
			}
};

// вычисление траектории функция
_fnc = {
	_obj_Pos = [(getPosASL _obj) select 0,(getPosASL _obj) select 1,((getPosASL _obj) select 2)];
	_bomb_Pos = [(getPosASL _bomb) select 0,(getPosASL _bomb) select 1,((getPosASL _bomb) select 2)];
	_x_vector = [_bomb_Pos,_obj_Pos] call BIS_fnc_vectorFromXToY;	
	_y_vector = (asin ((((_bomb_Pos) select 2) - (_obj_Pos select 2)) / (_obj distance _bomb))) * -1;
	_bomb setVectorDir _x_vector;
	[_bomb,_y_vector,0] call BIS_fnc_setPitchBank;
};

// таймер наведения
_t_naved = _timer / 100;
for "_i" from 0 to 100 do {
	call _navedenie;
	sleep _t_naved;
};
_obj = laserTarget player;
[]spawn {hint "Marker Captured";sleep 2; hint "";if (true) exitWith {}};

// создание ракеты
_xyz = _obj getPos [600,_dir];
_xx = _xyz select 0;
_yy = _xyz select 1;
_zz = 450;
_bomb = createVehicle ["M_Scalpel_AT",[_xx,_yy,_zz],[],0,"NONE"];

// полет ракеты
while {alive _bomb} do {
if (isNull laserTarget player) exitWith {hint "Marker lost..."};
call _fnc;
sleep 0.2;
};