/*
 Автор: PIONEER
 
 Воинское приветствие
 [p1,p2] spawn PL_fnc_Privet
 
 1 - имя юнита
 2 - имя юнита
*/

if (!isServer) exitWith {} ;

params ["_unit1","_unit2"];

_unit1 lookAt [getpos _unit2 select 0, getpos _unit2 select 1, (getpos _unit2 select 2) + 1.7];
_unit2 lookAt [getpos _unit1 select 0, getpos _unit1 select 1, (getpos _unit1 select 2) + 1.7];

If (primaryWeapon _unit1 == "" and secondaryWeapon _unit1 == "") then {
_unit1 playmove "AmovPercMstpSnonWnonDnon_Salute";
sleep 1;
_unit1 playmove "AmovPercMstpSnonWnonDnon_SaluteOut";
} else {_unit1 playmove "AmovPercMstpSlowWrflDnon_Salute"};
sleep 1; 
If (primaryWeapon _unit2 == "" and secondaryWeapon _unit2 == "") then {
_unit2 playmove "AmovPercMstpSnonWnonDnon_Salute";
sleep 1;
_unit2 playmove "AmovPercMstpSnonWnonDnon_SaluteOut";
} else {_unit2 playmove "AmovPercMstpSlowWrflDnon_Salute"};


/* 
AmovPercMstpSlowWrflDnon_Salute - c оружием
AmovPercMstpSnonWnonDnon_Salute - без оружия
AmovPercMstpSrasWpstDnon_Salute - с пистолетом
*/
