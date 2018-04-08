params ["_player", "_oldPlayer", "_respawn", "_respawnDelay"];

//	WAIT FOR PLAYER TO INITIALIZE
waitUntil {!(isNull player)};

//	DISABLE VOICE AND SUBS
oldSubs = showSubtitles false;
_player setSpeaker "NoVoice";
[_player, "NoVoice"] remoteExecCall ["setSpeaker", 0];

//	DISABLE SQUAD COMMAND BAR, AND VEH DIRECTION UI
showHUD [true, true, true, true, false, true, false, true];
