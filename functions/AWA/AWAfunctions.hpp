class AWA {
    class General {
        file = "functions\AWA\general";
        class setPlayerStasis {};       //  Disables the target player.
    };
    class MissionDeployment {
        file = "functions\AWA\missionDeployment";
        class initSpawnSelector {};     //  Activates the map selector for the admin, when the mission starts.
        class openMapSelector {};       //  Opens the map selector for the player. Remote function.
        class procDeploymentPos {};     //  Processes the spawn position selected by the admin in initSpawnSelector.
    };
};
