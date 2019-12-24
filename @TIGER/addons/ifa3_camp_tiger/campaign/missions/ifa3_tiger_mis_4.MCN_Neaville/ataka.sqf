// 0 сек, разведка

_brit = [] spawn {
// Атака
kom_brit_araka_1_car1 setpos getmarkerpos "ataka_sever";
kom_brit_araka_1_car2 setpos getmarkerpos "ataka_sever_1";
kom_brit_araka_1_car3 setpos getmarkerpos "ataka_sever_2";
sleep 2;
[kom_brit_araka_1_car1,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_1_car2,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_1_car3,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

sleep 300;

// АРТА
[s1,20,200] exec "ifa3_camp_tiger\f\obstrel.sqs";

// Атака 2
kom_brit_araka_2_car1 setpos getmarkerpos "ataka_vostok";
kom_brit_araka_2_car2 setpos getmarkerpos "ataka_vostok_1";
kom_brit_araka_2_car3 setpos getmarkerpos "ataka_vostok_2";

sleep 2;
[kom_brit_araka_3,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

kom_brit_araka_2_car4 setpos getmarkerpos "ataka_sever";
kom_brit_araka_2_car5 setpos getmarkerpos "ataka_sever_1";
kom_brit_araka_2_car6 setpos getmarkerpos "ataka_sever_2";

sleep 2;
[kom_brit_araka_2_car4,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_2_car5,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_2_car6,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

sleep 300;
// АРТА
[s1,20,200] exec "ifa3_camp_tiger\f\obstrel.sqs";

// Атака 3
kom_brit_araka_3_car1 setpos getmarkerpos "ataka_sever";
kom_brit_araka_3_car2 setpos getmarkerpos "ataka_sever_1";
kom_brit_araka_3_car3 setpos getmarkerpos "ataka_sever_2";
sleep 2;
[kom_brit_araka_3,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

kom_brit_araka_3_car4 setpos getmarkerpos "ataka_vostok";
kom_brit_araka_3_car5 setpos getmarkerpos "ataka_vostok_1";
kom_brit_araka_3_car6 setpos getmarkerpos "ataka_vostok_2";
sleep 2;
[kom_brit_araka_3_car4,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_3_car5,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_3_car6,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 

sleep 2;
kom_brit_araka_3_car7 setpos getmarkerpos "ataka_zapad";
kom_brit_araka_3_car8 setpos getmarkerpos "ataka_zapad_1";
kom_brit_araka_3_car9 setpos getmarkerpos "ataka_zapad_2";
sleep 2;
[kom_brit_araka_3_car7,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_3_car8,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[kom_brit_araka_3_car9,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf";
};

_ger = [] spawn {
sleep 300; 
ger_pw_1 setpos getmarkerpos "ger_1";
ger_pw_2 setpos getmarkerpos "ger_2";
ger_pw_3 setpos getmarkerpos "ger_3";
sleep 2;
ger_pw_car1 setpos getmarkerpos "ger_7";
ger_pw_car2 setpos getmarkerpos "ger_8";
sleep 2;
[ger_pw_1,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[ger_pw_2,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"; 
[ger_pw_3,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf";
[ger_pw_4,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf";

sleep 300;

ger_pw_5 setpos getmarkerpos "ger_1";
ger_pw_6 setpos getmarkerpos "ger_2";
ger_pw_7 setpos getmarkerpos "ger_3";
ger_pw_8 setpos getmarkerpos "ger_4";
ger_pw_9 setpos getmarkerpos "ger_5";
ger_pw_10 setpos getmarkerpos "ger_5";
ger_pw_9 setpos getmarkerpos "ger_5";
ger_pw_9 setpos getmarkerpos "ger_5";
ger_pw_car3 setpos getmarkerpos "ger_7";
ger_pw_car4 setpos getmarkerpos "ger_8";
sleep 2;

{[_x,"zona_ups","noslow"] execVM "ifa3_camp_tiger\f\UPS.sqf"} foreach [
ger_pw_5,
ger_pw_6,
ger_pw_7,
ger_pw_8,
ger_pw_9,
ger_pw_10,
ger_pw_car3,
ger_pw_car4
];

};
