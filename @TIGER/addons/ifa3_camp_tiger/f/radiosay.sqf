/* 
�����: [IMB]PIONEER
����� ����� � ���������� � ������. ������������ � �������

���������:
_say = [���,"����","�����_������",�����]execvm "radiosay.sqf"

������:
_say = [pl,"pl3","STR_pl3",1] execvm "ifa3_camp_tiger\f\radiosay.sqf"

1 - ����� �������
2 - ����� �������
3 - ����� �����
*/

_obj = _this select 0;
_sound = _this select 1;
_tema = _this select 2;
_kanal = _this select 3;

/* ����� ������ �����
if (_kanal = 1) then {_kanal=sideChat};
if (_kanal = 2) then {_kanal=vehicleChat};
if (_kanal = 3) then {_kanal=globalChat};
*/

setacctime 1;
if (!alive _obj) exitWith {};
playsound _sound;
_obj _kanal localize _tema;
if(true)exitWith{};