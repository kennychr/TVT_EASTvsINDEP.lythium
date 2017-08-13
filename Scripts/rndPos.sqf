/*
Description		:Random placement of unit\object
Usage					:[OBJECT,RADIUS,MINBUILDINGPOS] execVM "scripts\rndPos.sqf"; [ -Object to run on,-Radius to search,-Minumum posistion in a house to deem it viable ]
Author(s)			:Orginal from BIS Forum, rewritten by Christiansen.
Date					:13. Aug 2015
Last Modified	:17. Aug 2015
*/

params ["_obj","_radius","_minBuildingPos"];
private ["_obj","_radius","_minBuildingPos","_randomPos","_houseArray","_houseNumber","_x","_house","_y"];

_randomPos = getpos _obj;
_houseArray = nearestObjects [_randomPos,["House"], _radius];
sleep 1;
_houseNumber =  count _houseArray;
_x = 0;
while {_x <= _houseNumber} do

		{
		_house = _houseArray select _x;
		waitUntil {!isNil "_house"};
		if (format ["%1", _house buildingPos _minBuildingPos] != "[0,0,0]") exitWith {_y = 0; while { format ["%1", _house buildingPos _y ] != "[0,0,0]"} do { _y = _y + 1}; _y = _y - 1; _obj setPos (_house buildingPos (ceil random _y));};
		_x = _x + 1;
		sleep 0.1;
		};
