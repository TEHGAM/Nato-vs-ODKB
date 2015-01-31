// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};





enableSentences false;	// does this go here or 







call compile preprocessFile "taw_vd\init.sqf";
call compile preprocessFile "restrictions.sqf";
call compile preprocessFile "=BTC=_TK_punishment\=BTC=_tk_init.sqf";
call compile preprocessFile "IgiLoad\IgiLoadInit.sqf";
call compile preprocessFile "grenadeStop.sqf";
call compile preprocessFile "scripts\jump.sqf";

call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// BTC revive
call compile preprocessFile "scripts\grenadeStop.sqf";
call compile preprocessFile "scripts\vehicle\fastrope\zlt_fastrope.sqf";
// call compile preprocessFile "scripts\player\init.sqf";
// call compile preprocessFile "scripts\transport\init.sqf";

// _null2 = [] execVM "scripts\grenadeStop.sqf"; 									// spawn protection
// _igiload = execVM "IgiLoad\IgiLoadInit.sqf"; // Транспортировка грузов Мохавком или грузовиками (контейнеры и квадроциклы, подводная лодка.
// _null1 = [] execVM "outlw_magRepack\MagRepack_init_sv.sqf";								// Repack Magazines by Ctrl+R						

// _null3 = [] execVM "scripts\jump.sqf";											// jump action
// [["scripts\player\init.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
// [["scripts\transport\init.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP; //Транспортировка подвесом.
// _transportSqfcore = [] execVM "scripts\player\init.sqf"; //Транспортировка подвесом без предкомпиляции ядро.
// _transportSqf = [] execVM "scripts\transport\init.sqf"; //Транспортировка подвесом без предкомпиляции.
									// diary tabs
// _null = [] execVM "scripts\vehicle\fastrope\zlt_fastrope.sqf";					// heli rope	
// _null = [] execVM "scripts\misc\playerMarkers.sqf";								// blufor map tracker


//------------------------------------------------ Wait until player is initialized

if (!isDedicated) then {
	waitUntil {!isNull player && isPlayer player};
	sidePlayer = side player;
};

//------------------------------------------------- Wait until player is alive

if (!isServer) exitWith {
	while {true} do {
		waitUntil {sleep 1; !alive player};
		waitUntil {sleep 1; alive player};
	};
};

// ------------------------------------------------ Other useful stuff
call compile preprocessFile "=BTC=_logistic\=BTC=_logistic_init.sqf";

enableSaving [false, false];		
enableSentences false;			// does this go here or initPlayerlocal.sqf?	

_null = [] execVM "scripts\misc\clearBodies.sqf";														// spawn area bodies clean (performance costly)
_null = [] execVM "scripts\misc\clearItems.sqf";
[] execVM "module_performance\init.sqf";



// _transportSqf = [] execVM "scripts\transport\init.sqf";
// _transportInit = [] execVM "scripts\player\init.sqf";
