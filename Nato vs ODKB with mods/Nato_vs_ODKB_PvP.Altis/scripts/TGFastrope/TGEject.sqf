_rope0 = Player getVariable "myRope";
ropedestroy _rope0;
If (player == Driver vehicle player) exitWith {SystemChat "Pilot can`t eject from the helicopter! "};
If (player == Gunner vehicle player) exitWith {SystemChat "Gunner can`t eject from the helicopter! "};
If (player == Commander vehicle player) exitWith {SystemChat "Commander can`t eject from the helicopter! "};
Player action ["Eject", vehicle Player];
//Player switchMove "Acts_SittingWounded_breath";

//If !(isNull ( Player getVariable "myRope")) then 
//	{
	
//	};
_rope0 = ropeCreate [vehicle Player, [(1.5 * random1), 2, -1], Player, [0, -0.02, 1.2], 10, 5, true];
random1 = random1 * (-1);
Player setVariable ["myRope", _rope0];
_z = ((position vehicle Player select 2) + 5);
if (_z > 45) then {_z = 45;}; //rope cannot be more than 45meters 
ropeUnwind [_rope0, 2.7, _z, true]; 

_prepare = Player getVariable "prepare"; 
//If ! isNull (_prepare) then 
//	{
	Player removeAction _prepare;
//	};
	
_prepare = Player addAction 
[ "Prepare for combat", 
	{
	vehicle Player ropeDetach (Player getVariable "myRope"); 
	Player removeAction (Player getVariable "prepare"); 
	Player switchmove "";
	}
];
Player setVariable ["prepare", _prepare];
_ropeCut = Player GetVariable "ropeCut";
//If ! isNull (_ropeCut) then 
//	{
	Player removeAction _ropeCut;
//	};
_ropeCut = Player addAction 
["Cut Rope", 
	{
	//Ropecut [Player getVariable "myRope", 8,false]; 
	ropeunwind [(player getVariable "myRope"), 6, - 50, true];
    sleep 10;
	ropedestroy (Player getVariable "myRope"); 
	Player removeAction (Player getVariable "ropeCut");
	sleep 30;
	ropedestroy Player getVariable "myRope";
	}
];
player SetVariable ["ropeCut", _ropeCut];
