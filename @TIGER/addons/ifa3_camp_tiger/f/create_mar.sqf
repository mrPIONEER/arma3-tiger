/*
�������� ������� ���� �����, ������������� ��� UPS �������.

���������:

s=["���_�������",�������,�,y] execVM "ifa3_camp_tiger\f\create_mar.sqf"

������:

s=["ups_sol",sol_pos,50,50] execVM "ifa3_camp_tiger\f\create_mar.sqf"

�����: PIONEER
*/

_mar_name = _this select 0;
_pos = _this select 1;
_x = _this select 2;
_y = _this select 3;

_mar_name = createMarker [_mar_name, position _pos];
_mar_name setMarkerShape "ELLIPSE";
_mar_name setMarkerBrush  "GRID";
_mar_name  setMarkerSize [_x,_y];

if (true) exitWith {};