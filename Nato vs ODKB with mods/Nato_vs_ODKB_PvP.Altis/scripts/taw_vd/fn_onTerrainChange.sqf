/*
	File: fn_onTerrainChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the players terraingrid when called.
30 - none
50 - smoothest, less lag (none)
25 - default in multiplayer
12.5 - default in singleplayer
6.25 - more distance (200%)
3.125 - bumpiest, higher lag (500%)
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {};
	
switch (_type) do
{
	case "none": {if(isNil "tawvd_disablenone") then {setTerrainGrid 25;};};
	case "low": {setTerrainGrid 12.5;};
	case "norm": {setTerrainGrid 6.25;};
	case "high": {setTerrainGrid 3.125;};
};