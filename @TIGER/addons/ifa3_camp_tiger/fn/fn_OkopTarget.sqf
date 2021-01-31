/*
	Цели для ИИ
	
	[this] spawn PL_fnc_OkopTarget;
	
	1 - юнит
*/

if (!isServer) exitWith {} ;
	
_man = _this select 0;

_man setSkill 1;
_man setBehaviour "combat";
_man setCombatMode "red";
_man setUnitAbility 1.0;
_man setSkill ["aimingSpeed",1];
_man setSkill ["spotTime",1];
_man setSkill ["spotDistance",1];
_man setSkill ["aimingAccuracy",1];

while
{
	alive _man
}
do
{
	if (!alive _man) exitWith {};
	_enemy = (_man findNearestEnemy _man);

	if (typeOf _enemy != "man") exitWith {};

	_man commandTarget _enemy;
	_man commandFire _enemy;

	waitUntil
	{
		!alive _man || !alive _enemy || (!(_enemy isKindOf "man"))
	};
};