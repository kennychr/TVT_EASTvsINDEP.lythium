_mapSize = call BIS_fnc_mapSize;
_mapHalf = _mapSize / 2;
mapCenter = [_mapHalf,_mapHalf,0];
//Task integer
i_guer = 0;
i_op = 0;
//Intel vars
IntelMarkers = [];
ActiveIntelZones = 0;
IntelFound = 0;//hint format ["IntelAmountC:%1",IntelFound]
//GameVars
DestroyedCachesNeeded = "CycleAmount" call BIS_fnc_getParamValue;
DestroyedCaches = 0;


//Start ze machiiiiiiines(add waitExec later)

IntelFSM = execFSM "Machines\intelMachine.fsm";
CacheFSM = execFSM "Machines\cacheMachine.fsm";
