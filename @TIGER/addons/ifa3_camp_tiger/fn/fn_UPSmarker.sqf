/*
	јвтор: PIONEER
	—оздание маркера типа элипс, используетьс¤ дл¤ UPS скрипта.

	["ups_sol",position player,50] call PL_fnc_UPSmarker
	
	1 - им¤ маркера, уникальное.
	2 - позици¤ марекра
	3 - размер (опционально, стандарт 50м)
*/

if (!isServer) exitWith {} ;

params ["_mar_name","_pos",["_razmer",50]];

_mar_name = createMarker [_mar_name, _pos];
_mar_name setMarkerShape "ELLIPSE";
_mar_name setMarkerBrush  "GRID";
_mar_name  setMarkerSize [_razmer,_razmer];
//_mar_name setMarkerAlpha 0;