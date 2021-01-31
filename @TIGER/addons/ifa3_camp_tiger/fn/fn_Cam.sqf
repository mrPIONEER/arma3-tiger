/*
	Автор: PIONEER
	Создание камеры \ удаление камеры
	
	[true] call PL_fnc_Cam;
	
	1 - true создать, false удалить
	2 - true\false полоски камеры (опционально)
*/

params ["_camera",["_border",true]];

setAccTime 1;

if (_camera) then {

pl_camera = "camera" camcreate [0,0,0];
pl_camera cameraeffect ["internal", "back"];
showcinemaborder _border;
enableRadio false;
enableSaving [false, false];

} else {

pl_camera cameraeffect ["terminate", "Back"];
camdestroy pl_camera;
if !(isMultiplayer) then {enableRadio true};
enableSaving [true, true];
[1,2,false,true] call PL_fnc_CinemaBorder;
};