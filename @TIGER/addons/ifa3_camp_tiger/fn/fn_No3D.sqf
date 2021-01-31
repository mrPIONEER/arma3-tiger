/*
  Автор: PIONEER
  Игрок не сможет воспользоваться 3-им видом
  
  [] spawn PL_fnc_No3D
  
  1 - false\true отключение 3д вида в технике (опционально)
*/

if (!isDedicated && hasInterface) then {

params [["_vehicle",false]];

// переменная для отключение скрипта
pl_camera3D_on = true;

if (_vehicle) then {

while {pl_camera3D_on} do {
waitUntil {cameraOn == vehicle player and (cameraView == "External" or cameraView == "GROUP")};
player switchCamera "Internal";
uisleep 0.1;
};

} else {

while {pl_camera3D_on} do {
waitUntil {cameraOn == player and (cameraView == "External" or cameraView == "GROUP")};
player switchCamera "Internal";
uisleep 0.1;
};

};

};