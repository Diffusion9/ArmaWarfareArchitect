/*
	AWA_fnc_openMapSelector
	by:	Diffusion9

	Opens the map, and sets the map click action to deploy a composition.

*/

waitUntil {! (isNull player) && time > 10};
openMap true;
uiSleep 5;
//	To Do: Add playerstasis change here.
onMapSingleClick {
	onMapSingleClick "";
	openMap false;
	//	PROCESS THE SELECTED POSITION ON THE SERVER.	
	[_pos] remoteExec ["AWA_fnc_procDeploymentPos",2];
	//	RE-STASIS THE ADMIN.
	// [player, true] call AWA_fnc_setPlayerStasis;
};
