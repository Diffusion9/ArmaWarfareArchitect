//	SERVER PARAMS
setViewDistance 2000;												//	View distance.
{_x disableTIEquipment true;} forEach (allMissionObjects "All");	//	Disable thermals until necessary.
{_x disableNVGEquipment true;} forEach (allMissionObjects "All");	//	Disable NVGs until necessary.
enableEngineArtillery false;										//	Disable auto-calculated artillery.

//	DEDICATED SERVER OR PLAYER-HOST:
if isServer then {
	//	INIT FIRST-TIME SPAWN SELECTOR FOR ADMIN
	call AWA_fnc_initSpawnSelector;
};
