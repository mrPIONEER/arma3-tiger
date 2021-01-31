/*
	Создание источника света лампы. 
	
	[this] call PL_fnc_Lanterns
*/

params ["_lampa"];

private["_pos", "_light", "_brightness", "_color", "_ambient", "_intensity", "_attenuation"];

// large mild light
_pos = getPosATL _lampa;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 0.25];

_light = createVehicle["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
_light setPosATL _pos;

_brightness = 1.0;

_color = [1, 0.85, 0.6];
_ambient = [0, 0, 0];

_intensity = 500;
_attenuation = [6, 6, 6, 6];

_light setLightBrightness _brightness;
_light setLightColor _color;
_light setLightIntensity _intensity;
_light setLightAttenuation _attenuation;
_light setLightDayLight false;

// small sharp light
_pos = getPosATL _lampa;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 0.25];

_light = createVehicle["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
_light setPosATL _pos;
_brightness = 10.0;

_color = [0, 0, 0];
_ambient = [1, 0.85, 0.6];

_intensity = 750;
_attenuation = [0, 0, 0, 30.0];

_light setLightBrightness _brightness;
_light setLightAmbient _ambient;
_light setLightIntensity _intensity;
_light setLightAttenuation _attenuation;
_light setLightDayLight false;