/*
	Запрет на снятие униформы
*/

waitUntil {!(isNull (findDisplay 602))};
while {!(isNull (findDisplay 602))} do {
ctrlEnable [6331, false];
};