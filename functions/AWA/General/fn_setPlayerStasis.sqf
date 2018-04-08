/*

	AWA_fnc_setPlayerStasis
	by:	Diffusion9
	Created: 2018-04-08

	Turns the target player's screen black, hides, and disables simulation.

	_player		OBJECT		Target player.	
	_state		BOOLEAN		True: Disable the player \ False: Enable the player.
	_text		STRING		Text to display on screen.

*/

params [["_player", player], ["_state", false], ["_text", ""]];

//	DEFINE THE SCREEN LAYER
_playerStateLayer = "AWA_stasisLayer" call BIS_fnc_rscLayer;

private ["_type"];
if _state then {
	_type = "BLACK OUT";
} else {
	_type = "BLACK IN";
};

//	MODIFY SCREEN STATE
[_playerStateLayer, [_text,_type,0.001]] remoteExec ["cutText", _player];

//	ZERO-OUT VELOCITY
[_player,[0,0,0]] remoteExec ["setVelocity", 0];

//	MOVE TO MAP CENTRE
_player setPos [(worldsize / 2),((worldsize / 2) + 1000),0];

//	MODIFY SIM & VISIBILITY STATE
[_player, !_state] remoteExec ["enableSimulationGlobal", 2];
[_player, _state] remoteExec ["hideObjectGlobal", 2];
