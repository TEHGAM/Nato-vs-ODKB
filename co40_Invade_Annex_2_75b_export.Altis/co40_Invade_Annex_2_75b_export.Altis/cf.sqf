_unit = _this select 0;

if(isNull _unit) exitWith {};

if((_unit isKindOf "B_Heli_Light_01_F")) then
{
	_unit setObjectTexture [0, "cf\cf6.paa"];
	
};

if((_unit isKindOf "B_Heli_Light_01_armed_F")) then
{
	_unit setObjectTexture [0, "cf\cf6.paa"];
	
};

if((_unit isKindOf "I_Heli_Transport_02_F")) then
{
	_unit setObjectTexture [0, "cf\cf2.paa"];
	_unit setObjectTexture [1, "cf\cf2.paa"];
        _unit setObjectTexture [2, "cf\cf2.paa"];
};



if((_unit isKindOf "I_Plane_Fighter_03_CAS_F")) then
{
	_unit setObjectTexture [0, "cf\cf2.paa"];
	_unit setObjectTexture [1, "cf\cf2.paa"];
        
};

if((_unit isKindOf "I_Plane_Fighter_03_AA_F")) then
{
	_unit setObjectTexture [0, "cf\cf2.paa"];
	_unit setObjectTexture [1, "cf\cf2.paa"];
        
};