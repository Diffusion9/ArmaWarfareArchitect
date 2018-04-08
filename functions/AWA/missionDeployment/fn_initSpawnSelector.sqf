/*
	AWA_fnc_initSpawnSelector
	by:	Diffusion9

	Locate the authorized admin, and initiate the spawn selection process.
*/

//	IF SERVER (DOES NOT NEED TO RUN ON CLIENTS)
private ["_readyAdmin"];
if isServer then {
	//	WAIT UNTIL AN AUTHORIZED ADMIN IS READY
	waitUntil {
		//	CHECK EACH PLAYER FOR THE CONDITIONS
		{
			if (name _x in ["Diffusion9"]) exitWith {_readyAdmin = _x};
		} forEach allPlayers;
		!isNil "_readyAdmin"
	};
	//	INITIATE ON-SCREEN SELECTION PROCESS FOR THE ADMIN WHEN READY
	waitUntil {!(isNull _readyAdmin) && time > 1};
	[_readyAdmin, true, "Select a Deployment Location"] call AWA_fnc_setPlayerStasis;
	
	//	OPEN THE MAP AND ENABLE MAP CLICK HANDLER.
	{
		openMap true;
		uiSleep 3;
		[player, false, "Select a Deployment Location"] call AWA_fnc_setPlayerStasis;
		onMapSingleClick {
			onMapSingleClick "";
			openMap false;
			//	PROCESS THE SELECTED POSITION ON THE SERVER.
			[_pos] remoteExec ["AWA_fnc_procDeploymentPos", 2];
		};		
	} remoteExec ["bis_fnc_call", _readyAdmin];
};
