if (not local _this) exitwith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "U_LIB_GER_Tank_crew_private";
_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 8 do {_this addItemToUniform "LIB_8Rnd_9x19";};
_this addVest "V_LIB_GER_TankPrivateBelt";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "LIB_M39";};
for "_i" from 1 to 3 do {_this addItemToVest "LIB_8Rnd_9x19";};
_this addHeadgear "H_LIB_GER_TankPrivateCap";

comment "Add weapons";
_this addWeapon "LIB_P38";
_this addWeapon "LIB_Binocular_GER";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";

comment "Set identity";
_this setFace "LIB_WhiteHead_08_Dirt";
_this setSpeaker "male04ger";



if (true) exitWith {};