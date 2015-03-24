// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};





enableSentences false;	// does this go here or 



// ЗАПУСКАЕТСЯ ТОЛЬКО НА СЕРВЕРЕ

if (isServer) then
{
call compile preprocessFile "=BTC=_TK_punishment\=BTC=_tk_init.sqf";
call compile preprocessFile "scripts\vehicle\fastrope\zlt_fastrope.sqf";
_null = [] execVM "scripts\misc\clearBodies.sqf";														// spawn area bodies clean (performance costly)
[] execVM "module_performance\init.sqf";

};


// ЗАПУСКАЕТСЯ ТОЛЬКО  НА КЛИЕНТЕ !!!!!!!!!!!!!!!!!!!!!!!!!!!

if (!isServer) then
{



//------------------------------------------------ Wait until player is initialized

if (!isDedicated) then {
	waitUntil {!isNull player && isPlayer player};
	sidePlayer = side player;
};

call compile preprocessFile "scripts\grenadeStop.sqf";
_null = [] execVM "scripts\misc\clearItems.sqf";
//------------------------------------------------- Wait until player is alive

if (!isServer) exitWith {
	while {true} do {
		waitUntil {sleep 1; !alive player};
		waitUntil {sleep 1; alive player};
	};
};

// ------------------------------------------------ Other useful stuff



call compile preprocessFile "IgiLoad\IgiLoadInit.sqf";
//_null1 = [] execVM "scripts\restrictions.sqf"; //Работает только на клиенте. На сервере не запускать. На карте поставил во флаге.
call compile preprocessFile "scripts\jump.sqf";
call compile preprocessFile "=BTC=_logistic\=BTC=_logistic_init.sqf";
enableSaving [false, false];		
call compile preprocessFile "scripts\player\init.sqf";
call compile preprocessFile "scripts\transport\init.sqf";
call compile preprocessFile "scripts\taw_vd\fn_tawvdInit.sqf";
call compile preprocessFile  "scripts\tgfastrope\tgfastrope_init.sqf";
//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf"; //временно запускали вместо AGM -  BTC_Revive
enableSentences false;			// does this go here or initPlayerlocal.sqf?	

//Отключенная локальная шняга.
//call compile preprocessFile "taw_vd\init.sqf";
//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// BTC revive
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

};



//Запускается и на сервере и на клиенте.
// _transportSqf = [] execVM "scripts\transport\init.sqf";
// _transportInit = [] execVM "scripts\player\init.sqf";
