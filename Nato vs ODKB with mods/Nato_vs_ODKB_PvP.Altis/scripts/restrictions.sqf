/*

Author: wildw1ng
Contributor: Quiksilver
Editor: Your name here

Quiksilver notes:

	The more restrictions, the more performance-costly, as it is monitoring constantly whether players have weapons they shouldn't have.
	Item restrictions (explosives, rangefinders, uav terminals, etc.) have to be considered in a different manner. As of ArmA 1.16, don't bother trying to restrict
	items using the below setup, it doesn't work.

_________________________________________________*/

#define AT_MSG "Only AT and AA Soldiers may use this weapon system. Launcher removed."
#define SNIPER_MSG "Only Snipers may use this weapon system. Sniper rifle removed."
#define AUTOTUR_MSG "You are not allowed to use this weapon system, Backpack removed."
#define UAV_MSG "Only officer at Lieutenant rank may use UAV terminal. Item removed."
#define Designator_MSG "Only officer at Lieutenant rank may use Laser Designator. Item removed."
#define Attachements_MSG "Only Lieutenent can use such expensive items as thermal optics.";
//UAV_MSG = localize "str_UAV_terminal_cannot";
while { true } do {
waitUntil {alive Player};
	//------------------------------------- Launchers

	if ((player hasWeapon "launch_NLAW_F") || (player hasWeapon "launch_B_Titan_F") || (player hasWeapon "launch_O_Titan_F") || (player hasWeapon "launch_I_Titan_F") || (player hasWeapon "launch_B_Titan_short_F") || (player hasWeapon "launch_O_Titan_short_F") || (player hasWeapon "launch_I_Titan_short_F") || (player hasWeapon "rhs_weap_fgm148") || (player hasWeapon "rhs_weap_fim92") || (player hasWeapon "rhs_weap_igla")) then
	{
		if ((playerSide == west && typeOf player != "B_soldier_LAT_F" && typeOf player != "B_recon_LAT_F" && typeOf player != "B_soldier_AT_F" && typeOf player != "rhsusf_army_ucp_javelin"  && typeOf player != "rhsusf_army_ucp_aa") || (playerside == east && typeOf player != "O_soldier_LAT_F" && typeOf player != "rhs_vdv_aa" && typeOf player != "rhs_vdv_at") || (playerside == resistance && typeOf player != "I_soldier_LAT_F")) then
		{
			player removeWeapon (secondaryWeapon player);
			titleText [AT_MSG, "PLAIN", 3];
		};
	};

	//------------------------------------- Sniper Rifles

	if ((player hasWeapon "srifle_GM6_F") || (player hasWeapon "srifle_GM6_LRPS_F") || (player hasWeapon "srifle_LRR_F") || (player hasWeapon "srifle_GM6_SOS_F") || (player hasWeapon "srifle_GM6_camo_F") || (player hasWeapon "srifle_GM6_camo_SOS_F") || (player hasWeapon "srifle_GM6_camo_LRPS_F") || (player hasWeapon "srifle_LRR_camo_F") || (player hasWeapon "srifle_LRR_camo_LRPS_F") || (player hasWeapon "srifle_LRR_camo_SOS_F") || (player hasWeapon "srifle_LRR_LRPS_F") || (player hasWeapon "srifle_LRR_SOS_F")) then
	{
		if ((playerSide == west && typeOf player != "rhsusf_army_ucp_sniper") || (playerside == east && typeOf player != "rhs_vdv_marksman")) then
		{
			player removeWeapon (primaryWeapon player);
			titleText [SNIPER_MSG, "PLAIN", 3];
		};
	};

	//------------------------------------- UAV

	_uavOperator = ["rhs_vdv_officer","rhsusf_army_ucp_teamleader"];
   	_uavRestricted = ["B_UavTerminal","O_UavTerminal","I_UavTerminal"];
    If ( ! isNil {assignedItems player}) then 
    { _assignedItems = assignedItems player;
	if (({"B_UavTerminal" == _x} count _assignedItems) > 0) then 
		{
		if (({player isKindOf _x} count _uavOperator) < 1) then {
		player unassignItem "B_UavTerminal";
		player removeItem "B_UavTerminal";
		titleText [UAV_MSG,"PLAIN",3];
		};
	};
	if (({"O_UavTerminal" == _x} count _assignedItems) > 0) then 
		{
		if (({player isKindOf _x} count _uavOperator) < 1) then {
		player unassignItem "O_UavTerminal";
		player removeItem "O_UavTerminal";
		titleText [UAV_MSG,"PLAIN",3];
		};
	};
	if (({"I_UavTerminal" == _x} count _assignedItems) > 0) then 
		{
		if (({player isKindOf _x} count _uavOperator) < 1) then {
		player unassignItem "I_UavTerminal";
		player removeItem "I_UavTerminal";
		titleText [UAV_MSG,"PLAIN",3];
		};
	};
    };
if ( player hasWeapon "Laserdesignator") then 
{ 
	if ((typeOf Player != "rhs_vdv_officer_armored") && (typeOf Player != "rhsusf_army_ucp_teamleader")) then 
	{
	Player removeWeapon "Laserdesignator";
	titleText [Designator_MSG,"PLAIN",3];
	};
	
};
//_restrictedAttachments = ["optic_Nightstalker","optic_tws","optic_tws_mg"];  
if (("optic_Nightstalker" in PrimaryWeaponItems player) && (Rank Player != "MAJOR") && (Rank Player != "COLONEL")) then
{
	player removePrimaryWeaponItem "optic_Nightstalker";
	titleText ["Nightstalker item is not allowed below Major Rank!","PLAIN",3];
};

if (("optic_tws" in PrimaryWeaponItems player) && (Rank Player != "CAPTAIN") && (Rank Player != "MAJOR") && (Rank Player != "COLONEL")) then
{
	player removePrimaryWeaponItem "optic_tws";
	titleText ["TWS item is not allowed below Captain rank!","PLAIN",3];
};

if (("optic_tws_mg" in PrimaryWeaponItems player) && (Rank Player != "LIEUTENANT") && (Rank Player != "CAPTAIN") && (Rank Player != "MAJOR") && (Rank Player != "COLONEL")) then
{
	player removePrimaryWeaponItem "optic_tws_mg";
	titleText ["TWS Mg item is not allowed below Lieutenant rank!","PLAIN",3];
};
	//------------------------------------- turret backpacks

	_backpackRestricted = [
		"O_Mortar_01_support_F",
		"I_Mortar_01_support_F",
		"B_Mortar_01_support_F",
		"I_Mortar_01_weapon_F",
		"O_Mortar_01_weapon_F",
		"B_Mortar_01_weapon_F",
		"I_UAV_01_backpack_F",
		"B_HMG_01_A_weapon_F",
		"O_HMG_01_A_weapon_F",
		"I_HMG_01_A_weapon_F",
		"B_GMG_01_A_weapon_F",
		"O_GMG_01_A_weapon_F",
		"I_GMG_01_A_weapon_F",
		"B_GMG_01_A_high_weapon_F",
		"I_GMG_01_A_high_weapon_F",
		"O_GMG_01_A_high_weapon_F",
		"B_HMG_01_A_high_weapon_F",
		"O_HMG_01_A_high_weapon_F",
		"I_HMG_01_A_high_weapon_F",
		"O_GMG_01_A_high_weapon_F",
		"I_GMG_01_A_high_weapon_F",
		"B_GMG_01_A_high_weapon_F",
		"I_AT_01_weapon_F",
		"B_AT_01_weapon_F",
		"O_AT_01_weapon_F",
		"I_AA_01_weapon_F",
		"O_AA_01_weapon_F",
		"B_AA_01_weapon_F"
	];

	if (backpack player in _backpackRestricted) then {
		removeBackpack player;
		titleText [AUTOTUR_MSG, "PLAIN", 3];
	};
	sleep 5;
    
};
