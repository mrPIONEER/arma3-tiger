/*

Скрипт рандомного спавна снарядов, сигнальных и дымовых ракет, вокруг цели.
автор: Still\ Ваня Агафонов

ЗАПУСК СКРИПТА:	

[10,"R_80mm_HE",bot_1,8,200] spawn PL_fnc_Bomb;

ПОРЯДОК аргументов в скобках:

[количество снарядов,"класс снаряда",имя_объекта,пауза между спавном,радиус от объекта]

Известные классы снарядов:

							>>>>>>>ВАНИЛА<<<<<<<<<
"M_Mo_82mm_AT_LG" ---------------------------------------------------------- арт-снаряд
"M_Zephyr" | "Missile_AA_04_F" | "Rocket_03_AP_F" | "M_NLAW_AT_F" ---------- реактивные снаряды и ракеты
"R_80mm_HE" ---------------------------------------------------------------- минометный снаряд
"R_TBG32V_F" --------------------------------------------------------------- Термо-барическая от РПГ (не плохо смотрится)
"Bo_Mk82" | "Bo_Mk82_MI08" ------------------------------------------------- Авиа Бомба. огурец
"Bo_GBU12_LGB_MI10" | "Bo_GBU12_LGB" --------------------------------------- еще АБ GBU12
"Bomb_03_F" | " Bomb_04_F" ------------------------------------------------- тоже авиа, типа GBU12
"F_20mm_White" | "F_20mm_Green" | "F_20mm_Red" | "F_40mm_White" ------------ сигнальные ракеты
"G_40mm_Smoke" | "G_40mm_SmokeGreen" | "G_40mm_SmokeRed" ------------------- дымовые
"MyLight_White" ------------------------------------------------------------ ЯРКАЯ осветительная ракета (это не класс)

	РАЗНОЕ:
"test_EmptyObjectForFireBig" ----------------------------------------------- Эффект. падающий огонь.



							>>>>>>>>>RHSAFRF<<<<<<<<<<
"rhs_ammo_fab250" | "rhs_ammo_fab250_m62" | "rhs_ammo_fab500" -------------- Фугасные авиа бомбы.
"rhs_ammo_ofab250" --------------------------------------------------------- Осколочная фугасная АБ 250
"rhs_ammo_kab250" | "rhs_ammo_kab500" -------------------------------------- Корректируемые (корректировать не выйдет)
"rhs_ammo_rbk250_ao1" | "rhs_ammo_rbk500_ao25" ----------------------------- РБК. Касетные

	РАЗНОЕ:
"rhs_ammo_sub_zab25t" ------------------------------------------ не понял, что это, но эффект интересный
"rhs_ammo_ptb1500" --------------------------------------------- Эффект взрыва в воздухе, может и пригодится.
*/

// технический КОД: _type = "rhs_ammo_sub_zab25t";

if (!isServer) exitWith {} ;

_kolvo = _this select 0;
_type = _this select 1;
_obj = _this select 2;
_time = _this select 3;
_radius = _this select 4;
_Diametr = _radius * 2;

_declining = ["F_20mm_Green","F_20mm_White","F_20mm_Red","rhs_ammo_sub_zab25t","test_EmptyObjectForFireBig","F_40mm_White",
			"G_40mm_Smoke","G_40mm_SmokeRed","G_40mm_SmokeGreen"];
				
_vektor =	["Bo_Mk82","Bo_Mk82_MI08","M_Mo_82mm_AT_LG","Bomb_03_F"," Bomb_04_F","rhs_ammo_fab250","rhs_ammo_fab250_m62",
			"rhs_ammo_ofab250","rhs_ammo_kab250","Bo_GBU12_LGB_MI10","Bo_GBU12_LGB","rhs_ammo_fab500","rhs_ammo_kab500",
			"M_Zephyr","Missile_AA_04_F","R_80mm_HE","Rocket_03_AP_F","M_NLAW_AT_F","R_TBG32V_F","rhs_ammo_ptb1500"];
			
_kas_bomb =	["rhs_ammo_rbk250_ao1","rhs_ammo_rbk500_ao25"];

_light = 	["MyLight_White"];

// снаряды с указанием скорости и направления
if ({_x == _type} count _declining != 0) then
{for "_i" from 1 to _kolvo do
	{
	switch (_type) do 
	{
		case "rhs_ammo_sub_zab25t" : {speed_vector = random [0,-18,-3]};
		case "test_EmptyObjectForFireBig" : {speed_vector = random [0,-18,-3]};
		default {speed_vector = -10};
	};
		_rx = ((random _Diametr) - _radius);
		_ry = ((random _Diametr) - _radius);
		_xx = ((getPos _obj select 0) + _rx);
		_yy = ((getPos _obj select 1) + _ry);
		_zz = ((random 50) + 160);
		_koordinata = [_xx,_yy,_zz];
		_bomb = createVehicle [_type,_koordinata,[],0,"NONE"];
		_bomb setVelocity [0,0,speed_vector];
	sleep ((random _time) + 3);
	};
};

// бомбы с направлением вниз
if ({_x == _type} count _vektor != 0) then
{for "_i" from 1 to _kolvo do 
	{	
		_rx = ((random _Diametr) - _radius);
		_ry = ((random _Diametr) - _radius);
		_xx = ((getPos _obj select 0) + _rx);
		_yy = ((getPos _obj select 1) + _ry);
		_zz = ((random 60) + 180);
		_koordinata = [_xx,_yy,_zz];
		_bomb = createVehicle [_type,_koordinata,[],0,"NONE"];
		_bomb setVectorDirAndUp [[0,0,-1],[0,1,0]];
		if ({_x == _type} count _kas_bomb != 0) then {_bomb setVelocity [0,0,-50]};
	sleep ((random _time) + 3);
	};
};

// для касетных
if ({_x == _type} count _kas_bomb != 0) then
{for "_i" from 1 to _kolvo do 
	{	
		_rx = ((random _Diametr) - _radius);
		_ry = ((random _Diametr) - _radius);
		_xx = ((getPos _obj select 0) + _rx);
		_yy = ((getPos _obj select 1) + _ry);
		_zz = ((random 60) + 180);
		_koordinata = [_xx,_yy,_zz];
		_bomb = createVehicle [_type,_koordinata,[],0,"NONE"];
		_bomb setVectorDirAndUp [[0,0,-1],[0,1,0]];
		_bomb setVelocity [0,0,-50];
	sleep ((random _time) + 3);
	};
};

// яркая осветительная
if ({_x == _type} count _light != 0) then
{
	_fnc = 	{private ["_l","_b"];
			_b = _this select 0;_l = _this select 1;
				while {true} 
					do 
					{
						if (!alive _b) exitWith {deletevehicle _l};
					};
			};
	for "_i" from 1 to _kolvo do
	{	
		_myLight = "#lightpoint" createVehicleLocal [0,0,0];
		_myLight setLightBrightness 2.3;//------------------------------ Яркость света
		_myLight setLightColor [1.0, 1.0, 0.5];//----------------------- Цвет источника света
		_myLight setLightAmbient [1.0, 1.0, 0.5];//--------------------- Цвет света отраженного от объектов
		_rx = ((random _Diametr) - _radius);
		_ry = ((random _Diametr) - _radius);
		_xx = ((getPos _obj select 0) + _rx);
		_yy = ((getPos _obj select 1) + _ry);
		_zz = ((random 50) + 160);
		_koordinata = [_xx,_yy,_zz];
		_bomb = createVehicle ["F_20mm_White",_koordinata,[],0,"NONE"];
		_myLight lightAttachObject [_bomb,[0,0,0]];
		_bomb setVelocity [0,0,-5];
	[_bomb,_myLight] spawn _fnc;					
	sleep ((random _time) + 5);
	};
};
true