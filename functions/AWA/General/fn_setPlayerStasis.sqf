/*

	AWA_fnc_setPlayerStasis
	by:	Diffusion9
	Created: 2018-04-08

	Turns the target player's screen black, hides, and disables simulation.

	_player		OBJECT		Target player.	
	_state		BOOLEAN		True: Disable the player \ False: Enable the player.
	_text		STRING		Text to display on screen.

*/

params [["_player", objNull], ["_state", false], ["_text", ""]];

private ["_type"];
if _state then {
	_type = "BLACK OUT";
	//	ZERO-OUT VELOCITY
	[_player,[0,0,0]] remoteExec ["setVelocity", 0];

	//	MOVE TO MAP CENTRE
	_player setPos [(worldsize / 2),((worldsize / 2) + 1000),0];
} else {
	_type = "BLACK IN";
};

//	MODIFY SCREEN STATE
// "AWA_playerStasisLayerName" cutText [_text, _type, 0.001, true, false];

//	MODIFY SIM & VISIBILITY STATE
[_player, !_state] remoteExec ["enableSimulationGlobal", 2];
[_player, _state] remoteExec ["hideObjectGlobal", 2];
