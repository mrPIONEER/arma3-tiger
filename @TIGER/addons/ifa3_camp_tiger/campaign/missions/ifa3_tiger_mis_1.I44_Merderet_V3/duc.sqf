
[] spawn {
waitUntil {s1 distance tank3 > 50};
ataka_blue=true;
// Вейпоинты для групп вермахта
sleep 500;
// Спавн самолета и потом удаление
_this_air = createCenter resistance;
_center_0 = _this_air;
_group_air = createGroup _center_0;
_p47 = createVehicle ["LIB_P47",getmarkerpos "air1", [], 0, "FLY"];
"LIB_US_Pilot" createUnit [getmarkerPos  "air1", _group_air,"this moveindriver _p47"];
_wp = _group_air addWaypoint [getmarkerpos "air2",50];
_wp setWaypointType "SAD";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointFormation "LINE";
sleep 500;
_wp2 = _group_air addWaypoint [getmarkerpos "air3",50];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "NORMAL";
_wp2 setWaypointFormation "LINE";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} foreach units this"];
};