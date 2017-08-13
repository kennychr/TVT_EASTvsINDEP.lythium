/*
 * Author: Christiansen
 * Adds simulated intel to passed unit
 *
 * Arguments:
 * 0: _unit <object>
 * 1: _marker <string>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [OBB,_somemarker] call AW_fnc_addIntel;
 *
 * Public: [Yes/No]
 */
params ["_unit","_marker"];
//debug
hint format ["Unit:%1 :: Marker:%2",_unit,_marker];

//_unit addEventHandler["ContainerOpened", { hint format ["Intel found at location:%1",_marker] }];
_unit setVariable ["IntelMark", _marker, true];
_action = ["grab_intel", "Grab Intel", "", {

  _u = _this select 0;_marker = _u getVariable "IntelMark";hint format["%1 does not wish to brofist.", _marker];
  _marker setMarkerColor "ColorGreen";
  IntelFound = IntelFound + 1;
  ActiveIntelZones = ActiveIntelZones - 1;
  }, {true}] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
