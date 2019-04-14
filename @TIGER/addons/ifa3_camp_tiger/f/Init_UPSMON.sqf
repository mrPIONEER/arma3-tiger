// only run on server (including SP, MP, Dedicated) and Headless Client 
if (!isServer && hasInterface ) exitWith {};


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
//        These Variables should be checked and set as required, to make the mission runs properly.
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//=�������� ��� 0=��������� �������. � ������� ����� ���� ������� ���� ���������������� de ������ � ��� ���� ���� ���������� ��������, ����� �������� ��� �������������� ������
UPSMON_Debug = 0;

//������������ ��������-��� ������������ �����, ����� ���������� ������ ����� �����, ����� ��� �������� � ���� ��� ���������� ������ ����.
UPSMON_maxwaiting = 10;

// �������, ������� ������� ������ ����� ������ ������ �������������� �������
UPSMON_SRCHTIME = 90;

// E��� �� �������� ������� AI, ��������� ������ ������ ������ AI ������ ���� � ���, ����� ���� � ����� ����� �������� �������. ��� ����, �������� ����
UPSMON_sharedist = 800; // �������� org 800 = > ��������� ��� ���� ArmA3 ��� ����� ������������� ������..

// knowsAbout 0.5 1.03, 1.49 ����� �������� ����� ����� � "������ �����" (1-4) ��� ���� �����, ��� ������ ����������� ����������� (�������� � 5.0.7 ��� 0.5)
// ��� �� ������, ��� �� �� ����� �������� � ����. ��� ��������: ��� ������ ���� knowsAbout ��� UPSMON ��������� ��� � ������ ����� (UPSMON ������ �����)
UPSMON_knowsAboutEnemy = 1.5; // 5

//////////////////////// MODULES ////////////////////////////////////////////

// �������� ���, ����� ��������� ������������, ����� ������� ��� � �������� ������ ����� ������.
UPSMON_reinforcement = false; // ���� �������� True, ���� reinf UPSMON ���� �� ���� ������������

// �������������� ���������, ����� ��������������, ���� ���������� � ��������
UPSMON_ARTILLERY_EAST_FIRE = false; //set to true for doing east to fire //ToDo verify if needed
UPSMON_ARTILLERY_WEST_FIRE = false; //set to true for doing west to fire
UPSMON_ARTILLERY_GUER_FIRE = false; //set to true for doing resistance to fire

// ����� �� ������ �������?
UPSMON_SURRENDER = false;

// ���� ������� / 100
UPSMON_WEST_SURRENDER = 10;
UPSMON_EAST_SURRENDER = 10;
UPSMON_GUER_SURRENDER = 10;

// ����������� �����������/100
UPSMON_WEST_RETREAT = 0;
UPSMON_EAST_RETREAT = 0;
UPSMON_GUER_RETREAT = 0;

/// ����������� ������������ (���������� �������� 0, ���� �� ������ ��������� �������)
UPSMON_Ammountofhostility = 0;

UPSMON_WEST_HM = 10;
UPSMON_EAST_HM = 100;
UPSMON_GUER_HM = 100;

//////////////////////// ////////////////////////////////////////////

//������, ��� ���� ����� ������ ���� ���� ����� �������������� � 10%
UPSMON_flyInHeight = 40; //80;

//������������ ���������� �� ���� ��� ���������� para-drop, ����� ��������������� ����� 0 � 100% �� ����� ��������.
UPSMON_paradropdist = 400;

//������, ��� ���� ����� ������, ���� ��� ������ paradroping.
UPSMON_paraflyinheight = 110;

// ���������� �� ������ ���������� ��� ������ ������������ �������. (������� ������ ���������� ����� 200 �),
// ���� ��� ����� ���������� ������, ��� UPSMON_searchVehicledist, AI ���������� ����� ������������ ��������, ����� ����� ����.
UPSMON_searchVehicledist = 900; // 700, 900 

// ��� ������ opfor ���������� �� �� ������������� ������
UPSMON_closeenoughV = 800;

// ��� ������ ���� ������ ���� � ����, ����� ������� ����� ���� ��� ����� � ����� �����������
UPSMON_closeenough = 300;  // ToDo ��������� ������ ���������� ����� ��������, ��������, �� 50 / / 300

// ��������� �� ���������� �� ������� ������� ����;
UPSMON_deadBodiesReact = true;

// ������� ���� ����� ������� ���� (������ � ������ �������)
UPSMON_useMines = true;

// ���������� �� ����� ������
UPSMON_ambushdist = 100;

// % �� ����� ������������ ��� ������� �������, ����� ���-�� ����� ��� ���� � ������ � %(�� ��������� 13 � 35).
// ���������� ��� 0 -> ��������� ��� �������
UPSMON_USE_SMOKE = 20;

// ��������� �������� ����� �� ����� nightime ��� ���� ����� ������� �����
UPSMON_Allowfireplace = false;

// ��������� ������ ��������������
UPSMON_AllowRearm = true;

//=============================================================================================================================
//=============================== �� ������������ � ���� ����������================================================================

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
