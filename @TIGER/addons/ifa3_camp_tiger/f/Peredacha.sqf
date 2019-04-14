/* 

Скрипт ручной коробки передач для танков.

Автор и код -  [IMB]PIONEER
Основной код - Slon

Сайт отряда: imbrigade.ru
Для проекта: ifa3.ru

Можно изменять скрипт и использовать на любых проектах с указанием автора.

*/

peredacha_Key = false;

// Глушит движок и сливает топливо, после 5 сек возвращает. Увы, топливо бесконечное.

fn_fuel = {
if (((_this) isKindOf "Tank") && (Player == driver (_this))) then {
hint "Заглох";
_this engineOn false;
(_this) setFuel 0;
sleep 5; 
(_this) setFuel 1;
_this engineOn true;
_pr=0;
};
};

// Действия на 5 передач

_id = (findDisplay 46) displayAddEventHandler ["KeyDown",{ 
if ((_this select 1) in [2,3,4,5,6]) then {
if (((vehicle Player) isKindOf "Tank") && (Player == driver (vehicle Player))) then {
	_as = (_this select 1) Spawn fn_peredacha_key
}}}];

fn_peredacha_key = {

	if peredacha_Key exitWith {};
	peredacha_Key = true;
	_ob = (vehicle Player);
	_pr = (vehicle Player) getVAriable ["peredacha", 0];
	_tx = "";
	
	_n = count ( (vehicle Player) Call fn_peredacha_type ) - 1;
	
	
	// Передачи и глушилка двигателя если не так включил. На 1-2 можно ездить без проблем, для 3-5 глушит, если скорость больше >10-26
	Switch _this do {
		case 2 : {
	if (_pr < _n and ((_pr == 0) or (_pr == 1))) then {_pr = 0; _tx = format ["Передача 1", _pr]} else {_ob call  fn_fuel};
			};
		case 3 : {
	if (((_pr == 0) or (_pr== 1) or (_pr== 2))) then {_pr = 1; _tx = format ["Передача 2", _pr]} else {_ob call  fn_fuel};
			};
		case 4 : {
	if (((_pr == 1) or (_pr == 2) or (_pr== 3)) and speed (vehicle Player) > 10) then {_pr = 2; _tx = format ["Передача 3", _pr]} else {_ob call  fn_fuel};
			};
		case 5 : {
	if (((_pr == 2) or (_pr == 3) or (_pr == 4)) and speed (vehicle Player) > 20) then {_pr = 3; _tx = format ["Передача 4", _pr]} else {_ob call  fn_fuel};
			};
		case 6 : {
	if (((_pr == 3) or (_pr == 4) or (_pr == 5)) and speed (vehicle Player) > 26) then {_pr = 4; _tx = format ["Передача 5", _pr]} else {_ob call  fn_fuel};
			};
		};
		
	
	(vehicle Player) setVAriable ["peredacha", _pr, true];
	
	hint _tx;
	sleep 1;
	peredacha_Key = false;
};

// Список техники и их скоростной режим, если нет техники - default активируется. Можно указать режим для любого танка.
fn_peredacha_type = {
_ms = [];
		Switch (typeOf _this) do {
		case "LIB_t34_76" : {_ms =  [5, 15, 28, 36, 100]};
		default {_ms = [5, 15, 28, 36, 100]};
	};
_ms	
};

// Функция и цикл толкания назад при высокой скорости
fn_peredacha_con = {

	_ob = _this;
	_ms = [];
	_ms = _ob Call fn_peredacha_type ;
	
	sleep 3;

	While {count crew _ob > 0} do {
	private ["_pr", "_sd", "_c", "_dir"];
	
	
	_pr = _ob getVAriable ["peredacha", 0];
	_sd = _ms select _pr; 

	// Вырубает двигатель если низкая скорость и высокая передача
	if (speed _ob < 10 and (_pr > 1)) then {if (((vehicle Player) isKindOf "Tank") && (Player == driver (vehicle Player))) then {_ob call fn_fuel;}};
	
	if (speed _ob > _sd) then {
		_c = _sd / 4; // метры в секунду
		_vel = velocity _ob;
		_dir = getDir _ob;
		_ob  setVelocity [sin _dir*_c , cos _dir*_c ,_vel select 2];
	};
	
	
	
};
	_ob setVAriable ["peredacha", 0, true];
};


// Необходимо дать ЕH каждому созданому танку
{	
	if (_x isKindOf "Tank") then {
	_x addEventHandler ["GetIn", {
		if (count crew (_this select 0) == 1) then {
			_as = (_this select 0) Spawn fn_peredacha_con;
			}}];
	};
	_x setVAriable ["peredacha", 0, true];
} forEach Vehicles;

