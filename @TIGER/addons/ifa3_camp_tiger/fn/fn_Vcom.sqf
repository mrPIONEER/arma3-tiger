/*
	Автор: PIONEER
	Поддержка Vcom мода на продвинутый ИИ
	Отключает дополнительные маршруты у всех групп на старте (юниты могут убежать и не идти по вейпоинтам)
	Отключает изменение скила юнитам (настраивайте сами или убирайте всё в 0 через PL_fnc_skill)
	
	[] call PL_fnc_Vcom;
*/

if (!isServer) exitWith {};

{
	_x setVariable ["VCM_Skilldisable",true];
	_x setVariable ["VCM_NOFLANK",true];
} foreach allGroups;