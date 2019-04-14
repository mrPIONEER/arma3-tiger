/*
	POLPOX's Calm Animations 3.0 (PLP_calmSoldier3)
	

	Author: POLPOX

	Description:
	Adds calm animation for some units which they cancel when under fire.

	Parameter(s):
	
> «STAND» — стоит с винтовкой
> «STAND_U» — Стоит
> «GUARD» — Стоит, руки за спиной
> «WATCH» — Стоит, осматривается с винтовкой
> «LEAN» — Стоит, операясь на стену с винтовкой
> «LEAN_ON_TABLE» — стоит, руки на столе
> «LISTEN_BRIEFING» — стоит, слушает
> «BRIEFING» — Брифинг
> «BRIEFING_POINT_RIGHT» — Брифинг, указывает на право
> «BRIEFING_POINT_LEFT» — Брифинг, указывает на лево
> «BRIEFING_POINT_TABLE» — Брифинг, тычит в тоблицу
> «TALKING» — Соит, говорит
> «KNEEL» — стоя на колене, с винтовкой
>»KNEEL_U» — стоя на колене
>»EXERCICE» — стоя на колене, оглядывается
> «WAMUP» — Разминка, с винтовкой
> «WAMUP_KNEEL» — Разминка, стоя на колене, с винтовкой
> «WAMUP_P» — Разминка, с пистолетом
> «WAMUP_KNEEL_P» — Разминка, стоя на коленях, с пистолетом
> «WAMUP_U» — Разминка
> «WAMUP_KNEEL_U» — Разминка, стоя на коленях
> «SIT» — Сидит с винтовкой
> «SIT_U» — Сидит
> «SIT_LOW» — Сидит на земле, с винтовкой
> «SIT_LOW_U» — Сидит на земле
> «SIT_SAD» — Сидит и выглядит печально
> «SIT_LOW_SAD» — Сидит на земле и выглядит печально
> «SIT_HIGH1» — Сидит на на возвышенностях # 1
> «SIT_HIGH2» — Сидит на на возвышенностях # 2
> «SIT_AT_TABLE» — Сидит на стуле, руки на столе
> «REPAIR_VEH_PRONE» — Лежит ремонтирует
> «REPAIR_VEH_KNEEL» — Сидит ремонтирует
> «REPAIR_VEH_STAND» — Соит ремонтирует
> «CUFFED» — На земле, руки за спиной, может не реагировать
>»KNEEL_TREAT1″ — лечение ран # 1
> «KNEEL_TREAT2» — лечение ран # 2
> «PRONE_INJURED» — Ранен, с винтовкой и не реагирует
> «PRONE_INJURED_U1» — Ранение # 1
> «PRONE_INJURED_U2» — Ранение # 2
> «DEAD» — Мертвое состояние, на земле
> «DEAD_AT_WALL» — Мертвое состояние, на стене


		
		>Additional arguments on 1:
			>0: STRING - animation name
			>1: NUMBER - animation number
		2: BOOL - smoothly in (If the animation can deal the unit will transition)
		3: STRING or NUMBER - (optional) gear option
			>"LIGHT" or 1 - no vest, no helmet
			>"MEDIUM" or 2 - no helmet
			>"FULL" or 3 - fully loaded
			>"ASIS" or 4 - no change
			>"RANDOM" or -1 - (default) randomize
		4: STRING - (optional) additional condition
		5: BOOL - (optional) debug mode (If enable the script will output the state on chat)
		
	Returns:
	None
*/

//
//	EARLY INIT
//
_origPos = getPosATL param [0] ;
_origDir = getDir param [0] ;
param [0] enableSimulation false ;

waitUntil {time != 0} ;
//
//	INITIALIZATION VALUES
//
params [
	["_unit",objNull,[objNull]],
	["_anim","STAND",["",[]]],
	["_smoothIn",true,[true]],
	["_loadOption",-1,["",0]],
	["_cond","false",[""]],
	["_debug",false,[false]]
] ;
_fnc_scriptName = "PLP_calmSoldier_3" ;
#define CHATLOG(ANY)	if (_debug) then {systemChat str ANY} ;

private ["_data","_anim","_index","_loadOption"] ;
if (typeName _anim == "ARRAY") then {
	_anim = param [1] select 0 ;
	_index = param [1] select 1 ;
} ;
if (typeName _loadOption == "STRING" and {_loadOption == "RANDOM"}) then {
	_loadOption = -1 ;
} ;

/*
	0: Option
	1: Weapon
	2: Pos-Dir Coef
	3: Custom Condition (Overwride the normal condition)
	4: In and out moves
	5: Ignore out moves when the unit is killed
	6: Custom Codes (Run at begin the execution)
	7: Ignore all executions for unreactable animation
	8: Custom Codes (Run at after the execution)
*/

//	-----------------------------------
//	BRING ANIMATION DATAS
//	-----------------------------------
#define GETVALUE(ANIM,SEL)	((ANIM call BIS_fnc_ambientAnimGetParams) param [SEL])
#define commonNon	"amovpercmstpsnonwnondnon"
#define commonRfl	"amovpercmstpslowwrfldnon"

switch (_anim) do {
	//
	//	STAND
	//
	case "STAND" : {
		_data = [
			[
				[
					GETVALUE("STAND",0)
				],
				[
					(GETVALUE("STAND2",0) - [commonRfl])
				]
			],
			[0,[1,2]],
			[4,["",commonRfl]]
		] ;
	} ;
	case "STAND_U" : {
		#define STNDSTR(NUM)	"AidlPercMstpSnonWnonDnon_G0"+str NUM
		_data = [
			[
				[
					GETVALUE("STAND_U1",0)
				],
				[
					GETVALUE("STAND_U2",0)
				],
				[
					GETVALUE("STAND_U3",0)
				],
				[
					["Acts_CivilIdle_1"]
				],
				[
					["Acts_CivilIdle_2"]
				],
				[
					[
						STNDSTR(1),
						STNDSTR(2),
						STNDSTR(3),
						STNDSTR(4),
						STNDSTR(5),
						STNDSTR(6)
					]
				]
			],
			[0,[1,2]],
			[1,false],
			[4,["","AmovPercMstpSlowWnonDnon"]]
		] ;
	} ;
	case "GUARD" : {
		_data = [
			[
				[
					GETVALUE("GUARD",0)
				]
			],
			[0,[3,2,2]],
			[1,false],
			[4,["","AmovPercMstpSlowWnonDnon"]]
		] ;
	} ;
	case "WATCH" : {
		_data = [
			[
				[
					GETVALUE("WATCH1",0)
				],
				[
					GETVALUE("WATCH2",0)
				]
			],
			[0,[3,2]],
			[4,["",commonRfl]]
		] ;
	} ;
	case "LEAN" : {
		_data = [
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[3,2]],
			[2,[[0,0,0],-45]],
			[4,["",commonRfl]]
		] ;
	} ;
	case "LEAN_ON_TABLE" : {
		_data = [
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[2,2,1]],
			[1,false],
			[4,["",commonRfl]]
		] ;
	} ;
	case "LISTEN_BRIEFING" : {
		_data = [
			[
				[
					GETVALUE("LISTEN_BRIEFING",0)
				]
			],
			[0,[3,2]],
			[1,false],
			[4,["",commonRfl]]
		] ;
	} ;
	case "TALKING" : {
		_data = [
			[
				[
					["acts_StandingSpeakingUnarmed"]
				],
				[
					["Acts_CivilTalking_1"]
				],
				[
					["Acts_CivilTalking_2"]
				]
			],
			[0,[1,2]],
			[1,false],
			[4,["",commonNon]]
		] ;
	} ;
	case "BRIEFING_POINT_LEFT" ;
	case "BRIEFING_POINT_RIGHT" ;
	case "BRIEFING_POINT_TABLE" ;
	case "BRIEFING" : {
		_data = [
			[
				[
					GETVALUE(_anim,0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		] ;
	} ;
	case "EXERCISE" : {
		_data = [
			#define KNEBEN commonNon+"_exercisekneeBendA"
			#define PUSHUP commonNon+"_exercisePushup"
			[
				[
					[
						KNEBEN,
						PUSHUP
					]
				],
				[
					[KNEBEN]
				],
				[
					[PUSHUP]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		] ;
	} ;
	
	//
	//	WARMUP
	//
	#define warmStr "Acts_AidlPercMstpSlowWrflDnon_warmup_"
	#define warmAry(num) [[warmStr+str num+"_loop"],[4,["",warmStr+str num+"_out"]]]
	#define warmPStr "Acts_AidlPercMstpSloWWpstDnon_warmup_"
	#define warmPAry(num) [[warmPStr+str num+"_loop"],[4,["",warmPStr+str num+"_out"]]]
	#define	warmUStr "Acts_AidlPercMstpSnonWnonDnon_warmup_"
	#define warmUAry(num) [[warmUStr+str num+"_loop"],[4,["",warmUStr+str num+"_out"]]]
	case "WARMUP" : {
		_data = [
			[
				[
					[warmStr + "01",warmStr + "02",warmStr + "03",warmStr + "04",warmStr + "05"]
				],
				warmAry(1),
				warmAry(2),
				warmAry(3),
				warmAry(4),
				warmAry(5)
			],
			[0,[3,2]],
			[4,["",commonRfl]]
		] ;
	} ;
	case "WARMUP_KNEEL" : {
		_data = [
			[
				warmAry(6),
				warmAry(7),
				warmAry(8)
			],
			[0,[3,2]]
		] ;
	} ;
	case "WARMUP_P" : {
		_data = [
			[
				warmPAry(1),
				warmPAry(2),
				warmPAry(3),
				warmPAry(5),
				warmPAry(6),
				warmPAry(7),
				warmPAry(8)
			],
			[0,[3,2]]
		] ;
	} ;
	case "WARMUP_KNEEL_P" : {
		_data = [
			[
				warmPAry(4)
			],
			[0,[3,2]]
		] ;
	} ;
	case "WARMUP_U" : {
		_data = [
			[
				warmUAry(1),
				warmUAry(2),
				warmUAry(3),
				warmUAry(7),
				warmUAry(8)
			],
			[0,[3,2]],
			[1,false]
		] ;
	} ;
	case "WARMUP_KNEEL_U" : {
		#define WARMSTR "Acts_AidlPercMstpSnonWnonDnon_warmup"
		_data = [
			[
				warmUAry(4),
				warmUAry(5),
				warmUAry(6)
			],
			[0,[3,2]],
			[1,false]
		] ;
	} ;
	
	//
	//	SIT
	//
	case "SIT" : {
		_data = [
			[
				[
					GETVALUE("SIT1",0)
				],
				[
					GETVALUE("SIT2",0)
				],
				[
					GETVALUE("SIT3",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.5],-0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow"]]
		] ;
	} ;
	case "SIT_U" : {
		_data = [
			[
				[
					GETVALUE("SIT_U1",0)
				],
				[
					GETVALUE("SIT_U2",0)
				],
				[
					GETVALUE("SIT_U3",0)
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,-0.5],-0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		] ;
	} ;
	case "SIT_HIGH" : {
		_data = [
			[
				[
					GETVALUE("SIT_HIGH1",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.6],140]],
			[4,["","AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow"]]
		] ;
	} ;
	case "SIT_HIGH2" : {
		_data = [
			[
				[
					GETVALUE("SIT_HIGH2",0)
				]
			],
			[0,[1,2]],
			[2,[[0,0,-0.9],0]],
			[4,["HubSittingHighB_in","HubSittingHighB_out"]],
			[6,{
				_this setDir 0 ;
				waitUntil {animationState _this != "HubSittingHighB_in"} ;
				_this setDir -20 ;
			}],
			[8,{
				_EH = _this addEventHandler ["AnimDone",{
					if ((param [1]) == "HubSittingHighB_out") then {
						(param [0]) switchMove commonRfl ;
					} ;
				}] ;
				waitUntil {animationState _this != "HubSittingHighB_out"} ;
				_this removeEventHandler ["AnimDone",_EH] ;
			}]
		] ;
	} ;
	case "SIT_LOW_U" ;
	case "SIT_LOW" : {
		#define	commonSit	"amovpsitmstpslowwrfldnon"
		#define	commFlat	"passenger_flatground_"
		_data = [
			[
				[
					GETVALUE("SIT_LOW",0) - [commonSit],
					[4,[commonRfl+"_"+commonSit,commonSit+"_"+commonRfl]]
				],
				[
					[commFlat+"1_Idle_Idling"]
				],
				[
					[commFlat+"3_Idle_Idling"]
				],
				[
					[commFlat+"crosslegs"]
				],
				[
					[commFlat+"leanleft"],
					[2,[[0,0.5,0],0]]
				],
				[
					[commFlat+"leanright"],
					[2,[[0,0.5,0],0]]
				]
			],
			[0,[1,1,2]],
			[1,if (_anim == "SIT_LOW_U") then {false} else {true}],
			[4,["",if (_anim == "SIT_LOW_U") then {"AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"} else {commonSit+"_"+commonRfl}]]
		] ;
	} ;
	case "SIT_LOW_U" : {
		#define	commFlatGen(NUM)	[["passenger_flatground_generic0"+str NUM]]
		_data = [
			[
				[
					GETVALUE("SIT_LOW_U",0),
					[4,["AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
				],
				commFlatGen(1),
				commFlatGen(2),
				commFlatGen(3),
				commFlatGen(4),
				commFlatGen(5)
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
		] ;
	} ;
	case "SIT_SAD1" ;
	case "SIT_SAD2" ;
	case "SIT_SAD" : {
		_data = [
			[
				[
					GETVALUE("SIT_SAD1",0)
				],
				[
					GETVALUE("SIT_SAD2",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,-0.3],180]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		] ;
	} ;
	case "SIT_LOW_SAD" : {
		_data = [
			[
				[
					["Acts_CivilShocked_1"]
				],
				[
					["Acts_CivilShocked_2"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPsitMstpSnonWnonDnon_"+commonNon+"_ground"]]
		] ;
	} ;

	case "SIT_AT_TABLE" : {
		_data = [
			[
				[
					GETVALUE("SIT_AT_TABLE",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,-0.5],0]],
			[4,["","AcrgPknlMstpSnonWnonDnon_"+commonNon+"_getOutLow"]]
		] ;
	} ;
	
	//
	//	KNEEL
	//
	case "KNEEL" : {
		#define KNLSTR "AidlPknlMstpSlowWrflDnon_G0"
		_data = [
			[
				[
					[KNLSTR + "1",KNLSTR + "2",KNLSTR + "3"]
				]
			],
			[0,[1,1,2]],
			[4,["AmovPknlMstpSlowWrflDnon","AmovPknlMstpSlowWrflDnon"]]
		]
	} ;	
	case "KNEEL_U" : {
		#define KNLSTR "AidlPknlMstpSnonWnonDnon_G0"
		_data = [
			[
				[
					[KNLSTR + "1",KNLSTR + "2",KNLSTR + "3"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["AmovPknlMstpSnonWnonDnon","AmovPknlMstpSnonWnonDnon"]]
		]
	} ;	
	
	//
	//	REPAIR VEHICLE
	//
	case "REPAIR_VEH_PRONE" : {
		_data = [
			[
				[
					GETVALUE("REPAIR_VEH_PRONE",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[2,[[0,0,0],-180]],
			[4,["","AinjPpneMstpSnonWnonDnon_rolltofront"]],
			[8,{_this playMove "AmovPpneMstpSnonWnonDnon"}]
		]
	} ;
	case "REPAIR_VEH_KNEEL" : {
		_data = [
			[
				[
					GETVALUE("REPAIR_VEH_KNEEL",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["","AmovPknlMstpSnonWnonDnon"]]
		]
	} ;
	case "REPAIR_VEH_STAND" : {
		_data = [
			[
				[
					GETVALUE("REPAIR_VEH_STAND",0)
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",commonNon]]
		]
	} ;
	
	case "CUFFED" : {
		_data = [
			#define	cuffStr "Acts_AidlPsitMstpSsurWnonDnon"
			[
				[
					[cuffStr+"01",cuffStr+"03",cuffStr+"04",cuffStr+"05"]
				]
			],
			[0,[1,1,2]],
			[1,false],
			[4,["",cuffStr+"_out"]],
			[3,{!alive _unit or {_unit getVariable ["PLP_calmSoldier_abort",false]}}]
		] ;
	} ;
	
	//
	//	INJURED HEALING AND DEAD STATES
	//
	case "PRONE_INJURED" : {
		_data = [
			[
				[
					GETVALUE("PRONE_INJURED",0)
				],
				[
					GETVALUE("PRONE_INJURED_U2",0)
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,0],180]],
			[3,{!alive _unit}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",0.5]}]
		] ;
	} ;
	case "PRONE_INJURED_AGONY" : {
			_data = [
			[
				[
					["Acts_CivilInjuredArms_1"],
					[6,{_this setHitPointDamage ["HitArms",0.5]}]
				],
				[
					["Acts_CivilInjuredChest_1"],
					[6,{_this setHitPointDamage ["HitBody",0.5]}]
				],
				[
					["Acts_CivilInjuredGeneral_1"],
					[6,{_this setHitPointDamage ["HitAbdomen",0.5]}]
				],
				[
					["Acts_CivilInjuredHead_1"],
					[6,{_this setHitPointDamage ["HitFace",0.5]}]
				],
				[
					["Acts_CivilInjuredLegs_1"],
					[6,{_this setHitPointDamage ["HitLegs",0.5]}]
				]
			],
			[0,[1,2]],
			[1,false],
			[2,[[0,0,0],180]],
			[3,{!alive _unit}],
			[4,["",""]]
		] ;
	} ;
	case "KNEEL_TREAT_U" ;
	case "KNEEL_TREAT" : {
		_data = [
			[
				[
					GETVALUE("KNEEL_TREAT",0)
				]
			],
			[0,[2]],
			[1,false],
			[4,["AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic","AinvPknlMstpSnonWnonDnon_medicEnd"]]
		]
	} ;
	case "KNEEL_TREAT2" : {
		_data = [
			[
				[
					GETVALUE("KNEEL_TREAT2",0)
				]
			],
			[0,[2]],
			[4,["Acts_TreatingWounded_in","Acts_TreatingWounded_out"]]
		]
	} ;
	case "DEAD" : {
		_data = [
			[
				[
					["KIA_gunner_standup01","KIA_gunner_static_low01","KIA_passenger_injured_medevac_truck03"]
				]
			],
			[0,[3,2]],
			[3,{true}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",1] ; _this setHitPointDamage ["HitHead",1]}],
			[7,true]
		] ;
	} ;
	case "DEAD_AT_WALL" : {
		_data = [
			[
				[
					["KIA_commander_sdv"]
				],
				[
					["KIA_driver_MRAP_03"],
					[2,[[0,0,0.1],0]]
				],
				[
					["KIA_driver_ugv_01"]
				],
				[
					["KIA_passenger_flatground_generic"],
					[2,[[0,0,0.1],0]]
				],
				[
					["KIA_passenger_low01"],
					[2,[[0,0,0.2],0]]
				]
			],
			[0,[3,2]],
			[3,{true}],
			[4,["",""]],
			[6,{_this setHitPointDamage ["HitBody",1] ; _this setHitPointDamage ["HitHead",1]}],
			[7,true]
		] ;
	} ;
	case default {
		["%1 is not available paramater",_anim] call BIS_fnc_error ;
	} ;
} ;
if (isNil "_data") exitWith {} ;	//TERMINATE THE SCRIPT WHEN DATA IS NOT DEFINED

//	-----------------------------------
//	PRE-EXECUTION: INITIALIZATION
//	-----------------------------------
private ["_lastData","_anim","_inMove","_outMove","_hasWeapon","_attachObj","_direction","_position","_condition","_ignoreAnim","_unreact","_afterExec"] ;

if (!isNil "_index") then {
	_lastData = (_data select 0) select _index ;
} else {
	_lastData = selectRandom (_data select 0) ;
} ;

_data deleteAt 0 ;
_anim = _lastData select 0 ;
_lastData = (_lastData + _data) ;

{	//	Bring datas from selected animation data
	if (_forEachIndex >= 1) then {
		_x params [
			"_index",
			"_value"
		] ;
		switch _index do {
			case 0 : {
				if (_loadOption == -1) then {
					_loadOption = (selectRandom _value) ;
				} ;
			} ;
			case 1 : {
				if (!_value) then {
					_unit removeWeapon primaryWeapon _unit ;
				} ;
			} ;
			case 2 : {
				_value params [
					"_pos",
					"_dir"
				] ;
				_position = _pos ;
				_direction = _dir ;
			} ;
			case 3 : {
				if (isNil "_condition") then {
					_condition = _value ;
				} ;
			} ;
			case 4 : {
				_inMove = (_value select 0) ;
				_outMove = (_value select 1) ;
			} ;
			case 5 : {
				_ignoreAnim = _value ;
			} ;
			case 6 : {
				if (typeName _value == "CODE") then {
					_unit spawn _value ;
				} else {
					[_unit,(_value param [1])] spawn (_value param [0])
				} ;
			} ;
			case 7 : {
				_unreact = _value ;
			} ;
			case 8 : {
				_afterExec = _value ;
			} ;
		} ;
	} ;
} forEach _lastData ;

//	-----------------------------------
//	SET DEFAULT IF THE VALUES NOT DEFINED
//	-----------------------------------
if (isNil "_loadOption") then {
	_loadOption = 2 ;
} ;
if (isNil "_hasWeapon") then {
	_hasWeapon = true ;
} ;
if (isNil "_position") then {
	_position = [0,0,0] ;
} ;
if (isNil "_direction") then {
	_direction = 0 ;
} ;
if (isNil "_condition") then {
	_condition = {!alive _unit or {getSuppression _unit != 0} or {_unit getVariable ["PLP_calmSoldier_abort",false]} or {_unit call BIS_fnc_enemyDetected}} ;
} ;
if (isNil "_inMove" or {isNil "_outMove"}) then {
	_inMove = "Stand" ;
	_outMove = "Stand" ;
} ;
if (isNil "_ignoreAnim") then {
	_ignoreAnim = true ;
} ;

//	-----------------------------------
//	PRE-EXECUTION UNIT SETTINGS
//	-----------------------------------
#define SWITCHMOVE_MP(ANIM)	([[_unit,ANIM],"switchMove",true,true] call BIS_fnc_MP)
#define PLAYMOVENOW_MP(ANIM)	([[_unit,ANIM],"playMoveNow",true,true] call BIS_fnc_MP)

//	Remove some equipments by order
if (!_hasWeapon) then {
	_unit removeWeapon primaryWeapon _unit ;
} ;
switch _loadOption do {
	case "ASIS" : {
		_loadOption = 4 ;
	} ;
	case "LIGHT" : {
		_loadOption = 1 ;
	} ;
	case "MEDIUM" : {
		_loadOption = 2 ;
	} ;
	case "FULL" : {
		_loadOption = 3 ;
	} ;
} ;

if (_loadOption <= 3) then {
	_unit unassignItem hmd _unit ;
	removeGoggles _unit ;
} ;
if (_loadOption <= 2) then {
	removeHeadgear _unit ;
} ;
if (_loadOption <= 1) then {
	removeVest _unit ;
	removeBackpack _unit ;
} ;

//	Attach the unit
if (count (synchronizedObjects _unit) != 0) then {
	_attachObj = ((synchronizedObjects _unit) select 0) ;
	_vehDir = getDir _attachObj ;
	_unit attachTo [_attachObj,(_attachObj worldToModel getPosATL _unit) vectorAdd _position] ;
	_unit setDir ((_origDir - _vehDir) + _direction) ;
} else {
	_attachDummy = "Logic" createVehicleLocal [0,0,0] ;
	_unit setPosATL _origPos ;
	_unit setDir _origDir ;
	_attachDummy setPosATL (_unit modelToWorld _position) ;
	_attachDummy setDir getDir _unit ;
	_unit attachTo [_attachDummy,[0,0,0]] ;
	_unit setDir _direction ;
} ;

param [0] enableSimulation true ;
if (!isNil "_unreact" and {_unreact}) exitWith {
	_unit disableConversation true ;
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;

//	EH initialization
_unit setVariable ["PLP_calmSoldier_anims",_anim] ;
_unit setVariable ["PLP_calmSoldier_animDoneCoef",0] ;
_unitEHDone = _unit addEventHandler ["AnimDone",{
	_unit = param [0] ;
	if ((_unit getVariable "PLP_calmSoldier_animDoneCoef") == 0) then {
		_unit setVariable ["PLP_calmSoldier_animDoneCoef",1] ;
	} else {
		_unit setVariable ["PLP_calmSoldier_animDoneCoef",0] ;
	} ;
}] ;

//	Make AI stop and start move
_unit setBehaviour "SAFE" ;
{_unit disableAI _x} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","FSM"] ;
if (_smoothIn and {_inMove != ""}) then {
	SWITCHMOVE_MP(_inMove) ;
} else {
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;
_unit setAnimSpeedCoef (0.8 + random 0.4) ;

//	Abandon some used value for memory release
{
	_x = nil ;
} forEach [_data,_inMove,_loadOption,_hasWeapon,_direction] ;

//	Main part
while {true} do {
	_nowCoef = (_unit getVariable "PLP_calmSoldier_animDoneCoef") ;
	waitUntil {[] call _condition or {!alive _unit} or {_nowCoef != (_unit getVariable "PLP_calmSoldier_animDoneCoef")}} ;
	if ([] call _condition) exitWith {} ;
	SWITCHMOVE_MP(selectRandom _anim) ;
} ;
CHATLOG((str param [1]) + " ended")
//	-----------------------------------
//	POST-EXECUTION: LEAVE THE ANIMATION
//	-----------------------------------

if (alive _unit) then {
	sleep (0.05 + random 0.2) ;
	_unit setDir 0 ;
	if (!isNil "_attachDummy") then {
		_attachDummy setPosATL (_attachDummy modelToWorld (_position vectorMultiply -1)) ;
		waitUntil {getDir _attachDummy == getDir _unit} ;
	} ;
} ;

CHATLOG("detach sequence")
detach _unit ;
if (!isNil "_attachDummy") then {
	deleteVehicle _attachDummy ;
} ;
_unit setBehaviour "AWARE" ;
{_unit enableAI _x} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","FSM"] ;

if (!isNil "_afterExec") then {
	_unit spawn _afterExec ;
} ;

//	Find loop and out
_loopAnim = "" ;
_playMove = false ;
#define 	ANIMBASE(ANIM)	((getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> ANIM >> "InterpolateTo")) + (getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> ANIM >> "ConnectTo")))
{
	if ((typeName _x == "STRING") and {(_x find _outMove != -1) or {(_x find "_loop") != -1}}) exitWith {
		if (toUpper _x find toUpper _outMove != -1) then {
			_playMove = true ;
		} else {
			_loopAnim = _x ;
			{
				if (typename _x == "STRING") then {
					if (toUpper _x find toUpper _outMove != -1) exitWith {
						_playMove = true ;
					} ;
				}
			} forEach ANIMBASE(_loopAnim) ;
		} ;
	}
} forEach ANIMBASE(animationState _unit) ;

if (alive _unit or {!_ignoreAnim}) then {
	if (_playMove) then {
		PLAYMOVENOW_MP(_loopAnim) ;
		PLAYMOVENOW_MP(_outMove) ;
	} else {
		SWITCHMOVE_MP(_outMove) ;
	} ;
	_nowCoef = (_unit getVariable "PLP_calmSoldier_animDoneCoef") ;
	waitUntil {_nowCoef != (_unit getVariable "PLP_calmSoldier_animDoneCoef")} ;
} ;

_unit setAnimSpeedCoef 1 ;
_unit removeEventHandler ["AnimDone",_unitEHDone] ;