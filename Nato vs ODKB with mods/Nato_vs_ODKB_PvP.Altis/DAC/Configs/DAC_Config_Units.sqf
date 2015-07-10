//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// REDFOR (A3)
  case 0:
  {
    _Unit_Pool_S = ["rhs_vdv_engineer","rhs_pilot","rhs_vdv_officer_armored","rhs_vdv_medic","rhs_vdv_medic","rhs_vdv_machinegunner","rhs_vdv_sergeant","rhs_vdv_machinegunner","rhs_vdv_machinegunner","rhs_vdv_medic","rhs_vdv_aa","rhs_vdv_engineer","rhs_vdv_engineer","rhs_vdv_aa","rhs_vdv_at","rhs_vdv_at","rhs_vdv_at","rhs_vdv_officer_armored","rhs_vdv_officer_armored"];
    _Unit_Pool_V = ["rhs_gaz66_ammo_vmf","rhs_btr80_vdv","rhs_tigr_vdv","rhs_bmp2d_vdv","RHS_Ural_MSV_01"];
    _Unit_Pool_T = ["rhs_prp3_vdv","rhs_bmp2d_vdv","rhs_t72bd_tv","rhs_bmd2m","rhs_t80ue1","rhs_zsu234_aa"];
	_Unit_Pool_A = ["RHS_Mi24V_vvs","RHS_Mi8MTV3_vdv","RHS_Ka52_vvsc"];
  };
//-------------------------------------------------------------------------------------------------
// BLUFOR (A3)
  case 1:
  {
    _Unit_Pool_S = ["rhsusf_army_ucp_engineer","rhsusf_airforce_jetpilot","rhsusf_army_ucp_squadleader","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_medic","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_aa","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_medic","rhsusf_army_ucp_engineer","rhsusf_army_ucp_medic","rhsusf_army_ucp_medic","rhsusf_army_ucp_javelin","rhsusf_army_ucp_javelin","rhsusf_army_ucp_aa","rhsusf_army_ucp_sniper","rhsusf_army_ucp_teamleader"];
    _Unit_Pool_V = ["M1126_ICV_M2_DG1_NOSLATWOOD","M1135_ATGMV_DG1_NOSLATWOOD","B_MRAP_01_hmg_F"];
    _Unit_Pool_T = ["RHS_M2A2_wd","RHS_M2A2_wd","RHS_M6","rhsusf_m1a2sep1tuskiid_usarmy","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
    _Unit_Pool_A = ["B_Heli_Attack_01_F","RHS_UH60M_MEV_d","RHS_AH1Z","RHS_AH64D"];
  };
//-------------------------------------------------------------------------------------------------
// Independent (A3)
  case 2:
  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
  };
//-------------------------------------------------------------------------------------------------
// Civilians (A3)
  case 3:
  {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_A = [];
  };

//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray