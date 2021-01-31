/*
  Автор: DarkBall
  Правки: PIONEER
  Передавать живых бойцов из группы игрока между миссиями
  
  [1] spawn PL_fnc_LoadWeapon
  
  1 - запись в конце миссии
  2 - загрузка в начале
*/

params ["_param"];

if (_param == 0) then {
private _units = ((units group player) select {alive _x}) - [player];
private _classNames = _units apply {typeOf _x};
profileNamespace setVariable ["units_peredacha",_classNames];
};

if (_param == 1) then {
_unitsArray = profileNamespace getVariable "units_peredacha"; 
_createUnitsArray = {group player createUnit [_x, position player, [], 0, "FORM"];} forEach _unitsArray;
};