/*
	Стрельба из-за укрытия ИИ
	
	[this] spawn PL_fnc_Okop;
	
	1 - юнит
*/

if (!isServer) exitWith {} ;

private ["_unit","_handle1","_handle2","_pos"];

_unit = _this select 0;
[_unit] spawn PL_fnc_OkopTarget;

_handle1 = _unit addEventHandler ["FiredNear",
{
	private ["_unit","_firer"];
	_unit = _this select 0;
	_firer = _this select 1;

	if ((side _unit) != (side _firer)) then
	{
		_unit setUnitPos "middle";
		_unit doWatch (position _firer);
	};
}];

_handle2 = _unit addEventHandler ["HandleDamage",
{
	private ["_unit"];
	_unit = _this select 0;

	_unit setUnitPos "middle";
	_unit doWatch (position (_this select 3));

	_this select 2;
}];

_unit setVariable ["argt_chicken",true];
_unit setCombatMode "red";
_unit setBehaviour "aware";
_unit allowFleeing 0;
_unit disableAI "move";

_pos = getPosATL _unit;

while
{
	(canStand _unit)
	&&
	(_unit getVariable "argt_chicken")
}
do
{
	if (!alive _unit) exitWith {};
	_unit setUnitPos "middle";

	sleep (3 + random 10);

	_unit setUnitPos "up";

	sleep (3 + random 10);

	_unit setPosATL _pos;
};

_unit removeEventHandler ["FiredNear",_handle1];
_unit removeEventHandler ["HandleDamage",_handle2];

_unit enableAI "move";
_unit setUnitPos "auto";
