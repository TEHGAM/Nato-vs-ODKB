_zone = _this select 0; 
//zone is first agrument in this script. Try [triggername] execVM "scripts\bobcat\boxZone.sqf"
_bobcat1 = list _zone select 0; 
// selecting vehicle moved in this trigger area


if (vehicle _bobcat1 isKindof "B_APC_Tracked_01_CRV_F") then 
	
{

_action = _bobcat1 getVariable "Bobcataction";
_bobcat1 vehicleChat("loading Vehicle Box");
_bobcat1 removeAction _action;
_bobcat1 setFuel 0;
	sleep 1;
_bobcat1 vehiclechat "40% done";
sleep 2;
_bobcat1 vehiclechat "75% done";
sleep 3;
_action = _bobcat1 addAction ["<t color='#FF8000'>Drop vehicle ammobox.</t>","scripts\bobcat\dropResupplyBox.sqf", _bobcat1];
_bobcat1 setVariable ["Bobcataction", _action1];
_bobcat1 vehiclechat "100% done. Ready";
_bobcat1 setFuel 1;
cratercleaner = [7, _bobcat1] execVM "scripts\bobcat\groundWorks.sqf";
} ELSE
{ _bobcat1 vehiclechat "Sorry there no any crane. Only Bobcat type Vehicle supported to load a box."};
	