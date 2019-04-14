// only run on server (including SP, MP, Dedicated) and Headless Client 
if (!isServer && hasInterface ) exitWith {};


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
//        These Variables should be checked and set as required, to make the mission runs properly.
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//=Включить или 0=отключить отладку. В отладке можно было увидеть знак позиционирования de лидера и еще один знак назначения движения, очень полезный для редактирования миссии
UPSMON_Debug = 0;

//Максимальное ожидание-это Максимальное время, когда патрульные группы будут ждать, когда они прибудут в цель для выполнения другой цели.
UPSMON_maxwaiting = 10;

// Укажите, сколько времени объект будет искать вокруг подозрительной позиции
UPSMON_SRCHTIME = 90;

// Eсли вы замечены группой AI, насколько близко другая группа AI должна быть к вам, чтобы быть в курсе вашей нынешней позиции. над этим, потеряет цель
UPSMON_sharedist = 800; // значение org 800 = > увеличено для карт ArmA3 для менее предсказуемых миссий..

// knowsAbout 0.5 1.03, 1.49 чтобы добавить этого врага в "список целей" (1-4) чем выше число, тем меньше способность обнаружения (оригинал в 5.0.7 был 0.5)
// это не значит, что ИИ не будет стрелять в тебя. Это означает: что должно быть knowsAbout вас UPSMON добавляет вас в список целей (UPSMON список целей)
UPSMON_knowsAboutEnemy = 1.5; // 5

//////////////////////// MODULES ////////////////////////////////////////////

// Включите его, чтобы отправить подкрепление, лучше сделать это в триггере внутри вашей миссии.
UPSMON_reinforcement = false; // Тодо значение True, если reinf UPSMON идет от быть использованы

// Артиллерийская поддержка, лучше контролировать, если установлен в триггере
UPSMON_ARTILLERY_EAST_FIRE = false; //set to true for doing east to fire //ToDo verify if needed
UPSMON_ARTILLERY_WEST_FIRE = false; //set to true for doing west to fire
UPSMON_ARTILLERY_GUER_FIRE = false; //set to true for doing resistance to fire

// Может ли группа сдаться?
UPSMON_SURRENDER = false;

// Шанс сдаться / 100
UPSMON_WEST_SURRENDER = 10;
UPSMON_EAST_SURRENDER = 10;
UPSMON_GUER_SURRENDER = 10;

// Возможность отступления/100
UPSMON_WEST_RETREAT = 0;
UPSMON_EAST_RETREAT = 0;
UPSMON_GUER_RETREAT = 0;

/// Гражданская враждебность (установите значение 0, Если вы хотите отключить функцию)
UPSMON_Ammountofhostility = 0;

UPSMON_WEST_HM = 10;
UPSMON_EAST_HM = 100;
UPSMON_GUER_HM = 100;

//////////////////////// ////////////////////////////////////////////

//Высота, что хели будет летать этот вход будет рандомизирован в 10%
UPSMON_flyInHeight = 40; //80;

//Максимальное расстояние до цели для выполнения para-drop, будет рандомизировано между 0 и 100% от этого значения.
UPSMON_paradropdist = 400;

//Высота, что хели будет летать, если его миссия paradroping.
UPSMON_paraflyinheight = 110;

// Расстояние от пункта назначения для поиска транспортных средств. (Область поиска составляет около 200 м),
// Если ваш пункт назначения дальше, чем UPSMON_searchVehicledist, AI попытается найти транспортное средство, чтобы пойти туда.
UPSMON_searchVehicledist = 900; // 700, 900 

// Как далеко opfor высадиться из не бронированной машины
UPSMON_closeenoughV = 800;

// как близко блок должен быть к цели, чтобы создать новую цель или войти в режим невидимости
UPSMON_closeenough = 300;  // ToDo исследует эффект уменьшения этого значения, например, до 50 / / 300

// Реагирует ли устройство на близкие мертвые тела;
UPSMON_deadBodiesReact = true;

// Сделать блок может сложить мину (засада и модуль обороны)
UPSMON_useMines = true;

// Расстояние до точки засады
UPSMON_ambushdist = 100;

// % от шанса использовать дым членами команды, когда кто-то ранен или убит в группе в %(по умолчанию 13 и 35).
// установить как 0 -> Выключить эту функцию
UPSMON_USE_SMOKE = 20;

// Позвольте ослабить блоки во время nightime для того чтобы создать камин
UPSMON_Allowfireplace = false;

// Разрешить единиц перевооружения
UPSMON_AllowRearm = true;

//=============================================================================================================================
//=============================== НЕ ПРИКАСАЙТЕСЬ К ЭТИМ ПЕРЕМЕННЫМ================================================================

//UPSMON_Version
UPSMON_Version = "UPSMON 6.0.9.5";
//Misc Array
UPSMON_Total = 0;
UPSMON_Instances = 0;
UPSMON_Exited = 0;
UPSMON_AllWest = 0;
UPSMON_AllEast = 0;
UPSMON_AllRes = 0;
upsmon_west_total = 0;
upsmon_east_total = 0;
//Reinforcement group array
UPSMON_REINFORCEMENT_WEST_UNITS = [];
UPSMON_REINFORCEMENT_EAST_UNITS = [];
UPSMON_REINFORCEMENT_GUER_UNITS = [];
//Artillery group array
UPSMON_ARTILLERY_WEST_UNITS = [];
UPSMON_ARTILLERY_EAST_UNITS = [];
UPSMON_ARTILLERY_GUER_UNITS = [];
//Transport group array
UPSMON_TRANSPORT_WEST_UNITS = [];
UPSMON_TRANSPORT_EAST_UNITS = [];
UPSMON_TRANSPORT_GUER_UNITS = [];
//Supply group array
UPSMON_SUPPLY_WEST_UNITS = [];
UPSMON_SUPPLY_EAST_UNITS = [];
UPSMON_SUPPLY_GUER_UNITS = [];
//Supply group array
UPSMON_SUPPORT_WEST_UNITS = [];
UPSMON_SUPPORT_EAST_UNITS = [];
UPSMON_SUPPORT_GUER_UNITS = [];
//tracked units array
UPSMON_Trackednpcs = []; 
//Targetpos of groups
UPSMON_targetsPos = [];
//Units array by sides
UPSMON_AllWest = [];
UPSMON_AllEast = [];
UPSMON_AllRes = [];
//UPSMON Array groups
UPSMON_NPCs = [];
UPSMON_Civs = [];
//Markers Array
UPSMON_Markers = [];
//Template Array
UPSMON_TEMPLATES = [];
//EH Killed Civ
KILLED_CIV_COUNTER = [];

UPSMON_FlareInTheAir = false;

UPSMON_GOTKILL_ARRAY = [];
UPSMON_GOTHIT_ARRAY = [];

//===============================================================================
//========================					=====================================

// logic is needed to display rGlobalChat
private ["_center","_group","_UPSMON_Minesclassname","_m"];
_center = createCenter sideLogic; _group = createGroup _center;
UPSMON_Logic_civkill = _group createUnit ["LOGIC", [1,1,1], [], 0, "NONE"];
_group = nil;
_center = nil;

UPSMON = compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON.sqf";
UPSMON_CreateGroup = compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\UPSMON_CreateGroup.sqf";

//Core
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\Core\init.sqf";
call compile preprocessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\Get_pos\UPSMON_pos_init.sqf";
//Params
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\Group\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\target\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\unit\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\Params\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\buildings\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\vehicles\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\cover\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\terrain\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\COMMON\MP\init.sqf";
//Modules
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\FORTIFY\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\AMBUSH\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ARTILLERY\init.sqf";
//Orders
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_PATROL\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_REINFORCEMENT\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_Transport\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_PATROLSRCH\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_FLANK\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_ASSAULT\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_DEFEND\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_RELAX\init.sqf";
call compile preProcessFileLineNumbers "ifa3_camp_tiger\f\UPSMON\MODULES\ORDERS\UPSMON_SUPPLY\init.sqf";

[] execvm "ifa3_camp_tiger\f\UPSMON\COMMON\CORE\fnc\UPSMON_TRACK.sqf";
[] execvm "ifa3_camp_tiger\f\UPSMON\UPSMON_MAINLOOP.sqf";
[] execvm "ifa3_camp_tiger\f\UPSMON\UPSMON_MAINLOOPCiv.sqf";

//get all mines types
_UPSMON_Minesclassname = [] call UPSMON_getminesclass;
UPSMON_Minestype1 = _UPSMON_Minesclassname select 0; // ATmines
UPSMON_Minestype2 = _UPSMON_Minesclassname select 1; // APmines


_m = createMarker ["DummyUPSMONMarker",[0,0]];
_m setmarkerColor "Colorblack";
_m setMarkerShape "ELLIPSE";
_m setMarkerSize [100,100];
_m setMarkerBrush "Solid";
_m setmarkerAlpha 0;



//Initialization done
UPSMON_INIT=1;	
