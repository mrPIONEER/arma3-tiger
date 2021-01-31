/*
	Автор: PIONEER
	Прикрепление камеры к объекту
	
	[air,[-9,-20,2],80] call PL_fnc_CamAttach;
	
	1 - объект
	2 - координаты относительно объекта
	3 - азимут
*/

params ["_obj","_tar","_dir","_time"];

setAccTime 1;
pl_camera attachTo [_obj, _tar];
pl_camera setDir _dir;
pl_camera camCommitPrepared 0;

