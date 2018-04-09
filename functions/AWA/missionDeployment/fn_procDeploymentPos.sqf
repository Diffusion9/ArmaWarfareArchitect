/*
	AWA_fnc_procDeploymentPos
	by:	Diffusion9

	After the spawn position has been selected, setup the area and deploy it as appropriate.
	When completed, teleport all players to the position.
*/

params [["_pos", [0,0,0]]];

//	SPAWN THE BASE COMPOSITION.
["TacticalOperationsCenter_0_0", _pos, [0,0,0], 0] call LARs_fnc_spawnComp;

"Constructing Tactical Operations Center..." remoteExec ["Hint", allPlayers];
uiSleep 7;

//	RUN FUNCTION TO ENABLE, AND TELEPORT ALL PLAYERS TO BASE.
{
	_x setPos (_pos vectorDiff [0,10,0]);
	uiSleep 0.10;
	[_x, false] call AWA_fnc_setPlayerStasis;
	uiSleep 0.25;
} forEach allPlayers;
