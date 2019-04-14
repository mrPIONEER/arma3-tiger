class CfgPatches  {
	class ifa3_camp_tiger  {
		author = "[IMB]PIONEER";
		authors[] = {"[IMB]PIONEER"};
		url = "https://imbrigade.ru/";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.7;
		requiredAddons[] = {};
	};
};
class CfgMissions  {
	class Campaigns  {
		class ifa3_camp_tiger_vus {
			directory = "ifa3_camp_tiger\campaign";
		};
	};
	class MPMissions {
		class ifa3_coop_tiger {
			briefingName = "$STR_CAMP_ifa3_tiger";
			class ifa3_coop_tiger_1_mis {
				briefingName = "$STR_ifa3_tiger_mis1_coop";
				directory = "ifa3_camp_tiger\campaign\missions\ifa3_tiger_mis_1.I44_Merderet_V3";
			};
			class ifa3_coop_tiger_2_mis {
				briefingName = "$STR_ifa3_tiger_mis2_coop";
				directory = "ifa3_camp_tiger\campaign\missions\ifa3_tiger_mis_2.MCN_Neaville";
			};			
			class ifa3_coop_tiger_3_mis {
				briefingName = "$STR_ifa3_tiger_mis3_coop";
				directory = "ifa3_camp_tiger\campaign\missions\ifa3_tiger_mis_3.MCN_Neaville";
			};
			class ifa3_coop_tiger_4_mis {
				briefingName = "$STR_ifa3_tiger_mis4_coop";
				directory = "ifa3_camp_tiger\campaign\missions\ifa3_tiger_mis_4.MCN_Neaville";
			};
			class ifa3_coop_tiger_5_mis {
				briefingName = "$STR_ifa3_tiger_mis5_coop";
				directory = "ifa3_camp_tiger\campaign\missions\ifa3_tiger_mis_5.MCN_Neaville";
			};
		};	
	};
};
class CfgDebriefing 
{
	class end1 
	{
	title = "$STR_ifa3_tiger_end1"; 
	subtitle = ""; 
	description = ""; 
	pictureBackground = ""; 
	picture = "b_inf"; 
	pictureColor[] = {0.0,0.3,0.6,1}; 
	};	
	class ifa3_camp_tiger_debrif_loser_kill_player 
	{
	title = "$STR_ifa3_tiger_kill_player"; 
	subtitle = ""; 
	description = ""; 
	pictureBackground = ""; 
	picture = "b_inf"; 
	pictureColor[] = {0.0,0.3,0.6,1}; 
	};
	class ifa3_camp_tiger_debrif_loser_jip 
	{
	title = "$STR_ifa3_tiger_loser_jip"; 
	subtitle = ""; 
	description = ""; 
	pictureBackground = ""; 
	picture = "b_inf"; 
	pictureColor[] = {0.0,0.3,0.6,1}; 
	};	
	class ifa3_camp_tiger_kill_tiger 
	{
	title = "$STR_ifa3_tiger_kill_tiger"; 
	subtitle = ""; 
	description = ""; 
	pictureBackground = ""; 
	picture = "b_inf"; 
	pictureColor[] = {0.0,0.3,0.6,1}; 
	};		
};
class CfgSounds
{
	sounds[] = {};
	class ifa3_tiger_s_morze
	{
		name = "ifa3_tiger_s_morze";
		sound[] = {ifa3_camp_tiger\s\morze.ogg, db + 0, 1.0};
		titles[] = {0, ""};
	};

	#define TEXT(I) \
	class STR_ifa3_tiger_##I \
	{ \
	name = $STR_ifa3_tiger_##I##; \
	sound[] = {\ifa3_camp_tiger\s\STR_ifa3_tiger_##I.ogg, db + 0, 1.0}; \
	titles[] = {0, ""}; \
	};

	TEXT(mis1_say1)
	TEXT(mis1_say2)
	TEXT(mis1_say3)
	TEXT(mis1_say4)
	TEXT(mis1_say5)
	TEXT(mis1_say6)
	TEXT(mis1_say7)
	TEXT(mis1_say8)
	TEXT(mis1_say9)
	TEXT(mis1_say10)
	TEXT(mis1_say11)
	TEXT(mis1_say12)
	TEXT(mis1_say13)
	TEXT(mis1_say14)
	TEXT(mis1_say15)
	TEXT(mis1_say16)
	TEXT(mis1_say17)
	TEXT(mis1_say17_1)
	TEXT(mis1_say18)
	TEXT(mis1_say19)
	TEXT(mis1_say20)
	TEXT(mis1_say21)
	TEXT(mis1_say22)
	TEXT(mis1_say23)
	TEXT(mis1_say24)
	TEXT(mis1_say25)
	TEXT(mis1_say26)
	TEXT(mis2_say1)
	TEXT(mis2_say2)
	TEXT(mis2_say3)
	TEXT(mis2_say4)
	TEXT(mis2_say5)
	TEXT(mis2_say6)
	TEXT(mis2_say7)
	TEXT(mis2_say8)
	TEXT(mis2_say9)
	TEXT(mis2_say10)
	TEXT(mis2_say11)
	TEXT(mis2_say12)
	TEXT(mis2_say13)
	TEXT(mis2_say14)
	TEXT(mis2_say15)
	TEXT(mis2_say16)
	TEXT(mis2_say17)
	TEXT(mis2_say18)
	TEXT(mis2_say19)
	TEXT(mis3_say1)
	TEXT(mis3_say2)
	TEXT(mis3_say3)
	TEXT(mis3_say4)
	TEXT(mis3_say5)
	TEXT(mis3_say6)
	TEXT(mis4_say1)
	TEXT(mis4_say2)
	TEXT(mis4_say3)
	TEXT(mis4_say4)
	TEXT(mis4_say5)
	TEXT(mis4_say6)
	TEXT(mis4_say7)
	TEXT(mis4_say8)
	TEXT(mis4_say9)
	TEXT(mis4_say10)
	TEXT(mis4_say11)
	TEXT(mis4_say12)
	TEXT(mis4_say13)
	TEXT(mis4_say14)
	TEXT(mis4_say15)
	TEXT(mis4_say16)
	TEXT(mis4_say17)
	TEXT(mis5_say1)
	TEXT(mis5_say2)
	TEXT(mis5_say3)
	TEXT(mis5_say4)
	TEXT(mis5_say5)
	TEXT(mis5_say6)
	TEXT(mis5_say7)
	TEXT(mis5_say8)
	TEXT(mis5_say9)
	

};
class CfgMusic
{
	tracks[] = {};
	class ifa3_tiger_m_intro
	{
		name = "ifa3_tiger_m_intro";
		sound[] = {ifa3_camp_tiger\m\intro.ogg, db + 0, 1.0};
	};
	class ifa3_tiger_m_win
	{
		name = "ifa3_tiger_m_win";
		sound[] = {ifa3_camp_tiger\m\win.ogg, db + 0, 1.0};
	};
};
class CfgIdentities
{
     class ifa3_tiger_pers_s1
     {
            name = "$STR_ifa3_tiger_s1";
            face = "LIB_WhiteHead_18_Camo";
            glasses="none";
            speaker = "male01ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_s2
     {
            name = "$STR_ifa3_tiger_s2";
            face = "LIB_WhiteHead_09_Dirt";
            glasses="none";
            speaker = "male02ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_s3
     {
            name = "$STR_ifa3_tiger_s3";
            face = "LIB_WhiteHead_04_Dirt";
            glasses="none";
            speaker = "male03ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_s4
     {
            name = "$STR_ifa3_tiger_s4";
            face = "LIB_WhiteHead_05_Dirt";
            glasses="none";
            speaker = "male04ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_s5
     {
            name = "$STR_ifa3_tiger_s5";
            face = "LIB_WhiteHead_12_Dirt";
            glasses="none";
            speaker = "male05ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_of
     {
            name = "$STR_ifa3_tiger_of";
            face = "LIB_WhiteHead_12_Dirt";
            glasses="none";
            speaker = "male05ger";
            pitch = 1.0;
     };
     class ifa3_tiger_pers_solder
     {
            name = "$STR_ifa3_tiger_solder";
            face = "WhiteHead_11";
            glasses="none";
            speaker = "male05ger";
            pitch = 1.0;
     };	 
};