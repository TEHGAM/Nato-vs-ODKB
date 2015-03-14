// Fastrope script with rope animation and physics. Can shoot while fastroping (if forced by player).
// Input - vehicle (helicopter)

_helicopter = _this select 0;
WaitUntil {sleep 5; vehicle Player isKindOf "Helicopter"};
if (vehicle Player isKindOf "Helicopter") then
	{
	vehicle Player addAction ["Fastrope","scripts\TGfastrope\TGEject.sqf"];
	}
Else
{
systemChat "Its not a helicopter err. scripts\TGFastrope_init.sqf";
};
//WaitUntil {sleep 5; vehicle Player = Player};