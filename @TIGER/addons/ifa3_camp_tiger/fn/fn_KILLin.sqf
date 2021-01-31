/*
	Автор: PIONEER
	Удаление объекта в SP \ MP \ CADET
	
	[this,"MP+VETERAN",true] call PL_fnc_KILLin
	
	1 - юнит
	2 - где удалить
		MP - удалить в мультиплеере
		VETERAN - оставить в ветеран режиме
		MP+VETERAN - удалить в МП режиме и ветеране
	2 - удалить всех из отряда, по умолчанию false
*/

if (!isServer) exitWith {};

params ["_unit",["_mult","SP"],["_alldel",false]];

_PL_CadetMode = if (difficulty in [0,1]) then {true} else {false};

_fn_delete_all = {
	{_v = _x;
	{_v deleteVehicleCrew _x} forEach crew _v;
	deleteVehicle _x;
	} forEach units _this;
};

// Удалить в МП и ветеран режиме
if (_mult == "MP+VETERAN") exitWith {
	if (isMultiplayer) then {
		if (_PL_CadetMode) then {
			{_x deleteVehicleCrew _unit} forEach crew _unit;
			deleteVehicle _unit;
		};
	} else {
		{_x deleteVehicleCrew _unit} forEach crew _unit;
		deleteVehicle _unit;
	};
};

// Удалить в МП
if (_mult == "MP") exitWith {
	if !(isMultiplayer) then {
		{_x deleteVehicleCrew _unit} forEach crew _unit;
		deleteVehicle _unit;
	};
};

// Оставляет в ветеран режиме
if (_mult == "VETERAN") exitWith {
	if (_PL_CadetMode) then {
		{_x deleteVehicleCrew _unit} forEach crew _unit;
		deleteVehicle _unit;
	};
};