/* 
	Author : Hardy;
	null  = [танк,цель,кол-во выстрелов] execVM "tank.sqf";
	
	[tank,target,5] spawn PL_fnc_Tankfire;
*/

if (!isServer) exitWith {} ;

_veh  = _this select 0;
_target = _this select 1;
_index = _this select 2;
_weapon = (weapons _veh) select 0;
_magazine_array = _veh magazinesTurret [0];
_magazine = 0;

_magazine =  _magazine_array select 2;

for "_i" from 0 to _index do {
_veh loadMagazine [[0], _weapon ,_magazine];
sleep 15;
_veh doWatch _target;
waitUntil {_veh aimedAtTarget [_target] > 0};
sleep 2;
_veh fireAtTarget [_target, _weapon];
_veh doWatch objNull;
};