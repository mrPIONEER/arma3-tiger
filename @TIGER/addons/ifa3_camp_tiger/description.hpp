class Header
{
	gameType = COOP;
	minPlayers = 1;
	maxPlayers = 5;
};

Author = "$STR_avtor_ifa3_tiger";

respawn = 0; // респ отключен
enableDebugConsole = 0; // консоль только в редакторе
enableTeamSwitch = 0; // отключен выбор игрока после старта
joinUnassigned = 0; // игроки сами выбирают слоты
skipLobby  =  0;  // лобби включен
disabledAI = 0; // боты не удаляются в MP

reviveMode = 1; // включаем оживление
reviveUnconsciousStateMode = 0; // базовый тип
reviveRequiredTrait = 0; // все могут лечить
reviveRequiredItems = 0; // не нужна аптечка
reviveRequiredItemsFakConsumed  =  1 ; 
reviveMedicSpeedMultiplier = 2; // множитель для медика
reviveDelay = 15; // время оживления
reviveForceRespawnDelay = 3; // время выхода 
reviveBleedOutDelay = 300; // время чтобы раненный умер 