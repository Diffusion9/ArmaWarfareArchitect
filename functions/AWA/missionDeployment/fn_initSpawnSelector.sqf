/*
	AWA_fnc_initSpawnSelector
	by:	Diffusion9

	Locate the authorized admin, and initiate the spawn selection process.
*/

private ["_readyAdmin"];
if isServer then {
	//	WAIT UNTIL AN AUTHORIZED ADMIN IS READY
	waitUntil {
		{if (name _x in ["Diffusion9"]) exitWith {_readyAdmin = _x}} forEach allPlayers;
		!isNil "_readyAdmin"
	};
	uiSleep 4;

	//	EXEC MAP OPENING ON SELECTED CLIENT
	remoteExec ["AWA_fnc_openMapSelector", _readyAdmin];
};
