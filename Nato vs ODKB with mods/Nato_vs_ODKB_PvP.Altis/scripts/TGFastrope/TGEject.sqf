Player action ["Eject", vehicle Player];
//Player switchMove "Acts_SittingWounded_breath";

//If !(isNull ( Player getVariable "myRope")) then 
//	{
	_rope0 = Player getVariable "myRope";
	ropedestroy _rope0; 
//	};
_rope0 = ropeCreate [vehicle Player, [1.5, 2, -1], Player, [0, -0.02, 0.2], 10, 5, true];
Player setVariable ["myRope", _rope0];
ropeUnwind [_rope0, 2.7, (position vehicle Player select 2) + 5, true]; 

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
	//ropeUnwind [(Player getVariable "myRope"), -4, 45, true]; 
	Player removeAction (Player getVariable "ropeCut");
	sleep 30;
	ropedestroy Player getVariable "myRope";
	}
];
player SetVariable ["ropeCut", _ropeCut];
