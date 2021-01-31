/*
	Автор: PIONEER
	Измененный BIS_fnc_ambientAnimCombat
	
	_p=[this,"STAND1",{triggerActivated spalili_zone_1},true] spawn PL_fnc_AnimBisCombat;
	
	1 - юнит
	2 - анимация
	3 - условия выхода из анимации (опционально)
	4 - вейпоинт найти и уничтожить

	STAND1	- стоит на посту с стволом
	STAND2	- стоит на посту с стволом 
	STAND_U1	- стоит на посту без ствола
	STAND_U2	- стоит на посту без ствола
	STAND_U3	- стоит на посту без ствола
	WATCH1	- смотрит по сторонам с стволом
	WATCH2	- смотрит по сторонам с стволом
	GUARD	- смотрит по сторонам руки за спиной
	LISTEN_BRIEFING	- стоит руки за спинок
	LEAN	- слушает с стволом
	SIT_LOW	- сидит
	SIT_LOW_U	- сидит руки за спиной
	KNEEL	- на колене
	REPAIR_VEH_PRONE	- чинит лежа
	REPAIR_VEH_KNEEL	- чинит садится
	REPAIR_VEH_STAND	- чинит стоя
	PRONE_INJURED_U1	- раненный лежит
	PRONE_INJURED	- раненный лежит
	KNEEL_TREAT	- лечит раненого
	KNEEL_TREAT2	- лечит раненого
	BRIEFING	- брифинг руки по бокам
*/

private["_unit","_animset","_cond"];

_unit  	 	= _this param [0, objNull, [objNull]];
_animset 	= _this param [1, "STAND", [""]];
_cond	 	= _this param [2, {false}, ["",{}]];
_guard	 	= _this param [3, false, [false]];

if (local _unit) then {
	
// сохраняем оружие и выполняем анимацию
private _weapon = currentWeapon _unit;
[_unit,_animset,"ASIS"] call BIS_fnc_ambientAnim;

	private["_animHandle"];

	// дождитесь инициализации системы на устройстве
	waitUntil {_animHandle = _unit getVariable ["BIS_EhAnimDone", -1];(_animHandle > -1)};

	// ждем остановки
	waitUntil {(behaviour _unit == "COMBAT") || {(damage _unit > 0) || {(_unit call _cond) || {(_unit call BIS_fnc_enemyDetected)}}}};

	{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
	_unit removeEventHandler ["AnimDone",_animHandle];

	private _noweapon = primaryWeapon _unit;

	// возврат ствола
	if !(_weapon == _noweapon) then {
	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	};

	if (
		_animset == "STAND_U1" or 
		_animset == "STAND_U2" or 
		_animset == "STAND_U3" or 
		_animset == "REPAIR_VEH_PRONE" or
		_animset == "BRIEFING"
	) then {_unit switchmove "AmovPercMstpSlowWrflDnon";} else {_unit playmoveNow "AmovPercMstpSlowWrflDnon";};

	detach _unit;

	if (_guard) then {
		hint "ok";
		_grp = group _unit;
		_wp = _grp addWaypoint [position _unit,0];
		_wp setWaypointType "SAD";
		_wp setWaypointSpeed "UNCHANGED";
		_wp setWaypointFormation "NO CHANGE";
	};
};