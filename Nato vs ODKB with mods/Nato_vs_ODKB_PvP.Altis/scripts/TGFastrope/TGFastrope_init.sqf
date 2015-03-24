// Fastrope script with rope animation and physics. Can shoot while fastroping (if forced by player).
// Input - vehicle (helicopter)
random1 = 1;

while {true} do
{
sleep 5;
_helicopter = _this select 0;
WaitUntil {sleep 5; vehicle Player isKindOf "Helicopter"};
if (vehicle Player isKindOf "Helicopter") then
	{
	_fastrope_action = (vehicle player) getVariable "fastrope_action";
    (vehicle player) removeAction _fastrope_action;
    _fastrope_action = vehicle Player addAction ["Fastrope","scripts\TGfastrope\TGEject.sqf"];
    (vehicle player) setVariable ["fastrope_action",_fastrope_action];
	}
Else
{
//systemChat "Its not a helicopter err. scripts\TGFastrope_init.sqf";
};
    
};
//WaitUntil {sleep 5; vehicle Player = Player};