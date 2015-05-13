call compile preprocessFile "scripts\tgfastrope\tgfastrope_init.sqf";
call compile preprocessFile "scripts\jump.sqf";
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// BTC revive