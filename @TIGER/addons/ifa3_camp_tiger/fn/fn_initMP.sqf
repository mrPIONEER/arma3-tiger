/*
	Автор: PIONEER
	Отключение сохранений и провал если игрок умер
	Включать если только миссия для COOP
	
	[] spawn PL_fnc_initMP;
*/

params [["_proval",false]];

if (isMultiplayer) then {
	// провал если игрок умер
	if (_proval) then {
		{_x addEventHandler ["Killed", {
			{
				["pl_loser_kill_player",false] call BIS_fnc_endMission;
			} remoteExec ["bis_fnc_call", 0];
			}];
		} forEach allPlayers;
	};

	// отключение диалогов
	enableSentences false;
	enableRadio false;
	showSubtitles false;

	// удаляем ботов игроков
	{if !(isPlayer _x) then {deleteVehicle _x} forEach playableUnits};

	// нельзя перезайти на чужой слот
	// Сохраняем занятые слоты и информацию о игроках на них
	missionNamespace setVariable ["SavedSlots", playableUnits apply { [_x, getPlayerUID _x]; }];

	// Обработка подключения игрока
	addMissionEventHandler [
		"PlayerConnected",
		{
			params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

			// Скрипт правильности занятия слота
			private _arg = [
				missionNamespace getVariable ["SavedSlots", playableUnits apply { [_x, getPlayerUID _x]; }]
			];
			private _fnc = {
				params ["_slots"];

				// Ищем слот и ID игрока в сохраненном списке
				if !([player, getPlayerUID player] in _slots) then {
					// Неизвестный слот? (Не существовал на момент сохранения слотов (aka отключение ИИ))
					if (_slots findIf { _x params ["_unit"]; _unit == player; } == -1) then {
						// Скрипт удаления неизвестного слота  
						private _arg = [
							player
						];
						private _fnc = {
							params ["_unit"];

							waitUntil {
								deleteVehicle _unit;
								isNull _unit;
							};
						};

						// Запускаем скрипт удаления неизвестного слота (на сервере)
						[_arg, _fnc] remoteExec ["spawn", 2, false];
					};
					
					// Выкидываем игрока в лобби
					failMission "LOSER";
				};
			};

			// Запускаем скрипт проверки правильности занятия слота
			[_arg, _fnc] remoteExec ["call", _owner, false];
		}
	];

} else {
	// отключение переключению юнитов
	enableTeamSwitch false;
};