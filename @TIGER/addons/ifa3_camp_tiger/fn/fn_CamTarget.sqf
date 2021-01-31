/*
	Автор: PIONEER
	Позиция камеры относительно объекта. Смотрит на объект.
	
	[cam1,[11,-20,5],10] call PL_fnc_CamTarget;
	
	1 - объект
	2 - координаты относительно объекта
	3 - время
*/

params ["_obj","_tar","_time"];

detach pl_camera;
pl_camera camsetTarget _obj;
pl_camera camsetrelPos _tar;
pl_camera camsetFOV 0.700;
pl_camera camCommit _time;

