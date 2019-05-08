class CfgPatches {
    class ifa3_camp_tiger {
        author = "PIONEER";
        authors[] = {
            "PIONEER", "Soviet"
        };
        url = "https://imbrigade.ru/";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.7;
        requiredAddons[] = {
            "WW2_TerrainsI44_c_Worlds_I44_Merderet_V3_c", "WW2_TerrainsI44_c_Worlds_I44_Core_c"
        };
    };
};
class CfgMissions {
    class Campaigns {
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
class CfgDebriefing {
    class end1 {
        title = "$STR_ifa3_tiger_end1";
        subtitle = "";
        description = "";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {
            0.0, 0.3, 0.6, 1
        };
    };
    class ifa3_camp_tiger_debrif_loser_kill_player {
        title = "$STR_ifa3_tiger_kill_player";
        subtitle = "";
        description = "";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {
            0.0, 0.3, 0.6, 1
        };
    };
    class ifa3_camp_tiger_debrif_loser_jip {
        title = "$STR_ifa3_tiger_loser_jip";
        subtitle = "";
        description = "";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {
            0.0, 0.3, 0.6, 1
        };
    };
    class ifa3_camp_tiger_kill_tiger {
        title = "$STR_ifa3_tiger_kill_tiger";
        subtitle = "";
        description = "";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {
            0.0, 0.3, 0.6, 1
        };
    };
};
class CfgSounds {
    sounds[] = {};
	
    class ifa3_tiger_s_morze {
        name = "ifa3_tiger_s_morze";
        sound[] = {ifa3_camp_tiger\s\morze.ogg, db + 0, 1.0};
        titles[] = {0, ""};
    };
};
class CfgMusic {
    tracks[] = {};
    class ifa3_tiger_m_intro {
        name = "ifa3_tiger_m_intro";
        sound[] = {ifa3_camp_tiger\m\intro.ogg, db + 0, 1.0};
    };
    class ifa3_tiger_m_win {
        name = "ifa3_tiger_m_win";
        sound[] = {ifa3_camp_tiger\m\win.ogg, db + 0, 1.0};
    };
};
class CfgIdentities {
    class ifa3_tiger_pers_s1 {
        name = "$STR_ifa3_tiger_s1";
        face = "LIB_WhiteHead_18_Camo";
        glasses = "none";
        speaker = "male01ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_s2 {
        name = "$STR_ifa3_tiger_s2";
        face = "LIB_WhiteHead_09_Dirt";
        glasses = "none";
        speaker = "male02ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_s3 {
        name = "$STR_ifa3_tiger_s3";
        face = "LIB_WhiteHead_04_Dirt";
        glasses = "none";
        speaker = "male03ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_s4 {
        name = "$STR_ifa3_tiger_s4";
        face = "LIB_WhiteHead_05_Dirt";
        glasses = "none";
        speaker = "male04ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_s5 {
        name = "$STR_ifa3_tiger_s5";
        face = "LIB_WhiteHead_12_Dirt";
        glasses = "none";
        speaker = "male05ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_of {
        name = "$STR_ifa3_tiger_of";
        face = "LIB_WhiteHead_12_Dirt";
        glasses = "none";
        speaker = "male05ger";
        pitch = 1.0;
    };
    class ifa3_tiger_pers_solder {
        name = "$STR_ifa3_tiger_solder";
        face = "WhiteHead_11";
        glasses = "none";
        speaker = "male05ger";
        pitch = 1.0;
    };
};

class CfgWorlds {
    class I44World;
    class I44_Merderet: I44World {
        class Names {
            class Merd_ChefDuPont {
                name = "";
            };
            class Merd_Castle {
                name = "";
            };
            class Merd_Castle_2 {
                name = "";
            };
            class Merd_Village_1 {
                name = "";
            };
            class Merd_Village_2 {
                name = "";
            };
            class Merd_Village_3 {
                name = "";
            };
            class Merd_Wall {
                name = "";
            };
            class Merd_Penis {
                name = "";
            };
            class Merd_Cabane {
                name = "";
            };
        };
    };

    class MCN_Neaville: I44World {
        description = "$STR_ifa3_tiger_mod_nel_island";
        pictureMap = "ifa3_camp_tiger\t\viler.paa";
        class Names {

            class morinieres {
                name = "";
            };
            class neaville {
                name = "$STR_ifa3_tiger_mod_nel";
            };
            class chateuvieux {
                name = "";
            };
            class Hill_93 {
                name = "";
            };
            class Hill_92 {
                name = "";
            };
            class Hill_91 {
                name = "";
            };
            class camp {
                name = "";
            };
            class TroisPetitsPains {
                name = "";
            };
            class lecarrefourjoyeuse {
                name = "";
            };
            class pierrejulien {
                name = "";
            };
            class LaFermeDeLapadite {
                name = "";
            };
            class Ladurandiere {
                name = "";
            };
            class legasseau {
                name = "";
            };
            class LaHauteFresnaye {
                name = "";
            };
            class ChateauDeBraye {
                name = "";
            };
            class ChateaudeTeiless {
                name = "";
            };
            class LeCarrefourTriste {
                name = "";
            };
            class ChateauDeGondry {
                name = "";
            };
        };
    };

    class I44_Merderet_V3: I44_Merderet {
        description = "$STR_ifa3_tiger_mod_nel_road";
        pictureMap = "ifa3_camp_tiger\t\road.paa";
    };
};