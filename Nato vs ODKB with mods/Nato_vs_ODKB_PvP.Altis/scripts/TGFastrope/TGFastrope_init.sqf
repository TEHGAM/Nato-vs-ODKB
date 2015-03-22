// Fastrope script with rope animation and physics. Can shoot while fastroping (if forced by player).
// Input - vehicle (helicopter)
random1 = (-1); //for symmetric rope creaion on helicopters.

While {true} do
{
_helicopter = _this select 0;
sleep 5;
WaitUntil {sleep 5; vehicle Player isKindOf "Helicopter"};
if (vehicle Player isKindOf "Helicopter") then
	{
	
	_heliRope = (vehicle Player) getVariable "helirope";
	(vehicle Player) removeAction _heliRope;
	//if (vehicle player ropeCount < 2) then
	//	{
	_helirope = vehicle Player addAction ["Fastrope","scripts\TGfastrope\TGEject.sqf"];
	vehicle Player setVariable ["helirope",_heliRope];
	//	};
	}
Else
{
systemChat "Its not a helicopter err. scripts\TGFastrope_init.sqf";
};

};
//WaitUntil {sleep 5; vehicle Player = Player};