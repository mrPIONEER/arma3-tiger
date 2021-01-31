/*
	Бесконечные патроны
	
	[this] spawn PL_fnc_Patrons;
	
	1 - юнит
*/

private ["_unit","_magazine","_count"];

_unit = _this select 0;

_count = count (magazines _unit);

if (_count > 0) then
{
	_magazine = (magazines _unit) select 0;

	while
	{
		alive _unit
	}
	do
	{
		waitUntil
		{
			sleep 10;

			((count (magazines _unit)) < _count)
			||
			(!(alive _unit))
		};

		if (alive _unit) then
		{
			_unit addMagazine _magazine;
		};
	};
};

