// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};





enableSentences false;	// does this go here or 


DAC_Basic_Value = 0;execVM "DAC\DAC_Config_Creator.sqf"; // Dynamic AI Creator

// ЗАПУСКАЕТСЯ ТОЛЬКО НА СЕРВЕРЕ

if (isServer) then
{
call compile preprocessFile "=BTC=_TK_punishment\=BTC=_tk_init.sqf";
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

//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf"; //временно запускали вместо AGM -  BTC_Revive
//Отключенная локальная шняга.
//call compile preprocessFile "scripts\taw_vd\fn_tawvdInit.sqf"; //not need to start it
//_null = [] execVM "scripts\tgfastrope\tgfastrope_init.sqf"; //onMap
//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// BTC revive
// call compile preprocessFile "scripts\player\init.sqf";	//on map
// call compile preprocessFile "scripts\transport\init.sqf"; //on map
//call compile preprocessFile "IgiLoad\IgiLoadInit.sqf"; //onmap
//_null1 = [] execVM "scripts\restrictions.sqf"; //Работает только на клиенте. На сервере не запускать. На карте поставил во флаге.
// _null = [] execVM "scripts\vehicle\fastrope\zlt_fastrope.sqf";					// heli rope	
// _null = [] execVM "scripts\misc\playerMarkers.sqf";								// blufor map tracker

};



//Запускается и на сервере и на клиенте.
// _transportSqf = [] execVM "scripts\transport\init.sqf";
// _transportInit = [] execVM "scripts\player\init.sqf";
