clear all
cd "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\data and codes"
set mem 2000
*-----------PID MERGE RAW
*------------PID REGIONS LONG
do "do/1.1 pid.do"
*-----------DID MERGE
*-----------DID manage the regions WIDE-------------------------
do "do/1.2 did.do"
*-------------------------SYSTEM merge PID and DID--------------------------------
do "do/2.1 pid_did system.do"
***-------------------CSA region long-------------------------------------------
do "do/3.1 csa_region_did.do"
*---------------------CSA district long--------------------------------
do "do/3.2 csa_district_did long.do"
*----------------------Social wide with yes/no--------------------------------
do "do/4.1 social_wide_did.do"
*----------------------Social long--------------------------------
do "do/4.2 social_long did.do"
*--------------------Environmental wide format with yes/no----------------------------
do "do/5.1 environmental_wide did.do"
*-------------long fornat for summarised mapping
do "do/5.2 environmental_long did.do"
*----------------CSA community wide------------
do "do/6.0 community_level_csa.do"










