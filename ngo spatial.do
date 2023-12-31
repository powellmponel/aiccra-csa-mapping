

cd "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\data and codes"
set mem 2000

*-----------PID MERGE RAW
clear all
set more off
import excel "Organizational mapping.xlsx", sheet("Government Mostly revised") firstrow
destring ExistingTechnologiesYesNo, replace
save "PID_RAW.dta", replace
clear all
set more off
import excel "Organizational mapping.xlsx", sheet("NGOs mostly revised") firstrow
append using "PID_RAW.dta", force
export excel using "PID_RAW.xls", firstrow(variables) replace
save "PID_RAW.dta", replace

*------------PID REGIONS
drop if Region == ""
split Region, p(,)

forvalues r=1/10{
	replace Region`r'= "0" if Region`r'==""
}
rename Region Region_old
reshape long Region, i(PID) j(r) 

drop if Region == "0"
replace Region = "NATIONAL" 	if Region == "All Regions"
replace Region = "UPPER WEST" 	if Region == " UW SR"
replace Region = "BRONG AHAFO" 	if Region == "BRONG AHAFO"
replace Region = "BONO" 		if Region == "BONO EAST"
replace Region = "NORTHERN" 	if Region == "NORTH EAST"
replace Region = "BRONG AHAFO" 	if Region == "AHAFO"
replace Region = "WESTERN NORTH" if Region == "WESTERN NORTH"
replace Region = "NORTHERN" 	if Region == "NORTHERN GHANA"
replace Region = "UPPER EAST" 	if Region == " Upper East"
replace Region = "UPPER WEST" 	if Region == " Upper West"
replace Region = "BRONG AHAFO" 	if Region == " Brong Ahafo"
replace Region = "NATIONAL" 	if Region == "National"
replace Region = "UPPER WEST" 	if Region == "UW and NR"
replace Region = "NORTHERN" 	if Region == "Northern savannah"
replace Region = "UPPER EAST" 	if Region == " Sudan savannah"
replace Region = "NATIONAL" 	if Region == "Ghana"
replace Region = "BRONG AHAFO" if Region == "AhR"
replace Region = "BRONG AHAFO" if Region == " AhR"
replace Region = "UPPER WEST" 	if Region == "Upper West Region"
replace Region = "ASHANTI" 		if Region == "AR "
replace Region = "BRONG AHAFO" if Region == "BR"
replace Region = "GREATER ACCRA" if Region == "GR"

replace Region = "ASHANTI" if Region == "ASHANTI"
replace Region = "BONO" if Region == " Brong Ahafo"
replace Region = "BONO" if Region == "AHAFO"
replace Region = "BONO" if Region == "BRONG AHAFO"
replace Region = "BONO" if Region == "BRONG.AHAFO"
replace Region = "NORTHERN" if Region == " Sudan savannah"
replace Region = "NORTHERN" if Region == "NORTHERN GHANA"
replace Region = "NORTHERN" if Region == "Northern Region"
replace Region = "NORTHERN" if Region == "Northern savannah"
replace Region = "NORTHERN" if Region == "NORTHERNold"
replace Region = "NORTHERN" if Region == "UW and NR"
replace Region = "UPPER EAST" if Region == " Upper East"
replace Region = "UPPER WEST" if Region == " Upper West"
replace Region = "UPPER WEST" if Region == " UW SR"
replace Region = "VOLTA" if Region == "VOLTAold"
replace Region = "WESTERN" if Region == "WESTERNold"
replace	Region = "AHAFO" if	Region 	 == "Ahafo"
replace	Region = "AHAFO" if	Region 	 == "AHR"
replace	Region = "National" if	Region 	 == "All"
replace	Region = "ASHANTI" if	Region 	 == "AR"
replace	Region = "ASHANTI" if	Region 	 == "Ashanti"
replace	Region = "BRONG AHAFO" if	Region 	 == "BA"
replace	Region = "BONO EAST" if	Region 	 == "BE"
replace	Region = "BONO" if	Region 	 == "BR"
replace	Region = "BRONG AHAFO" if	Region 	 == "Brong"
replace	Region = "GREATER ACCRA" if	Region 	 == "COASTAL"
replace	Region = "CENTRAL" if	Region 	 == "CR"
replace	Region = "EASTERN" if	Region 	 == "East"
replace	Region = "EASTERN" if	Region 	 == "ER"
replace	Region = "GREATER ACCRA" if	Region 	 == "GA"
replace	Region = "National" if	Region 	 == "GHANA"
replace	Region = "GREATER ACCRA" if	Region 	 == "GR"
replace	Region = "National" if	Region 	 == "national"
replace	Region = "NORTH EAST" if	Region 	 == "NE"
replace	Region = "NORTHERN" if	Region 	 == "Norther"
replace	Region = "NORTHERN" if	Region 	 == "NORTHERN"
replace	Region = "NORTHERN" if	Region 	 == "NR"
replace	Region = "NORTHERN" if	Region 	 == "NS"
replace	Region = "SAVANNA" if	Region 	 == "SAVANNAH"
replace	Region = "SAVANNA" if	Region 	 == "SR"
replace	Region = "UPPER EAST" if	Region 	 == "UE"
replace	Region = "UPPER WEST" if	Region 	 == "UW"
replace	Region = "VOLTA" if	Region 	 == "VR"
replace	Region = "WESTERN" if	Region 	 == "WE"
replace	Region = "WESTERN" if	Region 	 == "West"
replace	Region = "WESTERN NORTH" if	Region 	 == "WN"
replace	Region = "WESTERN" if	Region 	 == "WR"
replace	Region = "OTI" if	Region 	 == "Oti"
replace	Region = "AHAFO" if	Region 	 == " Ahafo"
replace	Region = "AHAFO" if	Region 	 == " AHR"
replace	Region = "National" if	Region 	 == " All"
replace	Region = "ASHANTI" if	Region 	 == " AR"
replace	Region = "ASHANTI" if	Region 	 == " Ashanti"
replace	Region = "BRONG AHAFO" if	Region 	 == " BA"
replace	Region = "BONO EAST" if	Region 	 == " BE"
replace	Region = "BONO" if	Region 	 == " BR"
replace	Region = "BRONG AHAFO" if	Region 	 == " Brong"
replace	Region = "GREATER ACCRA" if	Region 	 == " COASTAL"
replace	Region = "CENTRAL" if	Region 	 == " CR"
replace	Region = "EASTERN" if	Region 	 == " East"
replace	Region = "EASTERN" if	Region 	 == " ER"
replace	Region = "GREATER ACCRA" if	Region 	 == " GA"
replace	Region = "National" if	Region 	 == " GHANA"
replace	Region = "GREATER ACCRA" if	Region 	 == " GR"
replace	Region = "National" if	Region 	 == " national"
replace	Region = "NORTH EAST" if	Region 	 == " NE"
replace	Region = "NORTHERN" if	Region 	 == " Norther"
replace	Region = "NORTHERN" if	Region 	 == " NORTHERN"
replace	Region = "NORTHERN" if	Region 	 == " NR"
replace	Region = "NORTHERN" if	Region 	 == " NS"
replace	Region = "SAVANNA" if	Region 	 == " SAVANNAH"
replace	Region = "SAVANNA" if	Region 	 == " SR"
replace	Region = "UPPER EAST" if	Region 	 == " UE"
replace	Region = "UPPER WEST" if	Region 	 == " UW"
replace	Region = "VOLTA" if	Region 	 == " VR"
replace	Region = "WESTERN" if	Region 	 == " WE"
replace	Region = "WESTERN" if	Region 	 == " West"
replace	Region = "WESTERN NORTH" if	Region 	 == " WN"
replace	Region = "WESTERN" if	Region 	 == " WR"
replace	Region = "OTI" if	Region 	 == " Oti"
replace	Region = "ASHANTI" if	Region 	 == " AR"
replace	Region = "BRONG AHAFO" if	Region 	 == " BAR"
replace	Region = "BONO EAST" if	Region 	 == " BER"
replace	Region = "BONO" if	Region 	 == " BR"
replace	Region = "CENTRAL" if	Region 	 == " CR"
replace	Region = "EASTERN" if	Region 	 == " ER"
replace	Region = "GREATER ACCRA" if	Region 	 == " GA"
replace	Region = "NORTH EAST" if	Region 	 == " NER"
replace	Region = "NORTHERN" if	Region 	 == " NR"
replace	Region = "NORTHERN" if	Region 	 == " NR."
replace	Region = "SAVANNA" if	Region 	 == " SR"
replace	Region = "UPPER EAST" if	Region 	 == " UER"
replace	Region = "UPPER WEST" if	Region 	 == " UWR"
replace	Region = "VOLTA" if	Region 	 == " VR"
replace	Region = "WESTERN NORTH" if	Region 	 == " WNR"
replace	Region = "WESTERN" if	Region 	 == " WR"
replace	Region = "ASHANTI" if	Region 	 == "AR"
replace	Region = "ASHANTI" if	Region 	 == "AR "
replace	Region = "ASHANTI" if	Region 	 == "Ashanti and Eastern regions."
replace	Region = "EASTERN" if	Region 	 == "Ashanti and Eastern regions."
replace	Region = "BRONG AHAFO" if	Region 	 == "BAR"
replace	Region = "BONO EAST" if	Region 	 == "BER"
replace	Region = "BONO" if	Region 	 == "BR"
replace	Region = "BRONG AHAFO" if	Region 	 == "Brong Ahafo Region"
replace	Region = "CENTRAL" if	Region 	 == "CR"
replace	Region = "EASTERN" if	Region 	 == "ER"
replace	Region = "GREATER ACCRA" if	Region 	 == "GR"
replace	Region = "NORTH EAST" if	Region 	 == "NER"
replace	Region = "NORTHERN" if	Region 	 == "Northern Region"
replace	Region = "NORTHERN" if	Region 	 == "NR"
replace	Region = "OTI" if	Region 	 == "OR"
replace	Region = "UPPER EAST" if	Region 	 == "Three Northern Regions in Ghana"
replace	Region = "UPPER WEST" if	Region 	 == "Three Northern Regions in Ghana"
replace	Region = "NORTHERN" if	Region 	 == "Three Northern Regions in Ghana"
replace	Region = "UPPER EAST" if	Region 	 == "UER"
replace	Region = "UPPER WEST" if	Region 	 == "UWR"
replace	Region = "WESTERN NORTH" if	Region 	 == "WNR"
replace Region = "BRONG AHAFO" 	if Region 	== "AHAFO"
replace Region = "NORTHERN" 	if Region 	== "Northern Ghana"
replace Region = "WESTERN" 		if Region 	== "WESTERN NORTH"
drop if Region == "No"
drop if Region == "nil"
drop if Region == "(old regions)"
replace Region = "NATIONAL" if Region == "National"
replace Region = "SAVANNA" 		if Region == "SAVANNAH ECOLOGICAL ZONES"
*replace Region = "" 			if Region == ""		
save "PID_regions.dta", replace
export excel using "PID_regions.xls", firstrow(variables) replace





*-------------------DID ODK
clear all
set more off
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_district") firstrow
save "did_dist.dta", replace

clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_geo") firstrow
save "did_geo.dta", replace

clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_region") firstrow
save "did_region.dta", replace

clear all
set more off
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("maintable") firstrow
save "did_main.dta", replace

merge m:m did using "did_geo.dta"
drop _merge
merge m:m did using "did_dist.dta"
drop _merge
merge m:m did using "did_region.dta"

save "DID_RAW.dta", replace


*PID REGIONs
clear all
set more off
use "DID_RAW.dta"
keep pid region_name
rename pid PID
rename region_name Region
replace Region = "WESTERN NORTH" if Region == "WESTERN.NORTH"
replace Region = "WESTERN" if Region == "WESTERNold"
replace Region = "VOLTA" if Region == "VOLTAold"
replace Region = "UPPER WEST" if Region == "UPPER.WEST"
replace Region = "UPPER EAST" if Region == "UPPER.EAST"
replace Region = "NORTHERN" if Region == "NORTHERNold"
replace Region = "NORTH EAST" if Region == "NORTH.EAST"
replace Region = "GREATER ACCRA" if Region == "GREATER.ACCRA"
replace Region = "BRONG AHAFO" if Region == "BRONG.AHAFO"
replace Region = "BONO EAST" if Region == "BONO.EAST"
replace Region = "BRONG AHAFO" if Region == "AHAFO"
drop if Region == "not.reported"
replace Region = "CENTRAL" if Region == "COASTAL COMMUNITIES"
drop if Region == ""

save "did_region.dta", replace

clear all
use "PID_regions.dta"
keep PID Region
append using "did_region.dta"
drop if Region == ""
drop if PID == ""
duplicates drop PID Region, force
replace Region = "ASHANTI" in 312
save "PID_DID_Regions.dta", replace


*-------------------------SYSTEM-----------------------------------------
*system
clear all
use "DID_RAW"
split csa_system, p(,)
forvalues r=1/5{
	replace csa_system`r'= "0" if csa_system`r' == ""
}
rename csa_system csa_system_old
list region_name if csa_system_old == "" 
drop if csa_system_old != "" & region_name == ""
drop if csa_system_old == ""
gen id = _n, before(did)
reshape long csa_system, i(did id) j(sys) 
drop if csa_system == "0"
save "did_system.dta", replace
keep pid csa_system region_name
save "did_system_region.dta", replace

clear all
use "PID_regions.dta", replace
do "Encoded CSA Systems.do"
reshape long csa_system, i(PID Region) j(sys) 
drop if csa_system == "0"

save "PID_system.dta", replace

keep PID csa_system Region
rename PID pid
rename Region region_name
append using "did_system_region.dta", force
do "edit_regions.do"
export excel using "pid_system_region.xls", replace firstrow(variables)



***-------------------CSA region long-------------------------------------------
clear all
use "did_system.dta"
drop if csa_region == ""
split csa_region, p(,)
forvalues r=1/23{
	replace csa_region`r' = "0" if csa_region`r' == ""
}

rename csa_region csa_region_original
reshape long csa_region, i(did id sys) j(csa_r) 
drop if csa_region == "0"
save "csa_region_long.dta", replace

*----------------------Social wide with yes/no--------------------------------
clear all
use "did_system.dta"

split social, p(,)

global soc "adaptation learning use access adoption"

gen change_strategies = 0, after(social)
foreach soc in $soc {
	gen `soc' = 0, after(social)
	label variable `soc' "social benefit is: `soc'"
}

forvalues r=1/6 {
	foreach soc in $soc{
		replace `soc' = 1 if social`r' == "`soc'"
		replace change_strategies = 1 if social`r' == "change.strategies"
	}
}
save "did_system.dta", replace
*--------------------Environmental----------------------------
clear all
use "did_system_region.dta"
split environmental, p(,)

*----------------wide format with yes/no
global env "soil.retention erosion.control nutrient.ratain nutrient.enhance water.supply nutrient.apply cover.land.restoration vegetation water.retention"
global envv "soil_retention erosion_control nutrient_ratain nutrient_enhance water_supply nutrient_apply cover_land_restoration vegetation water_retention"

foreach envv in $envv{
	gen `envv'=0, after(environmental)
	label variable `envv' "environmental benefit is: `envv'"
}


forvalues r=1/9 {
	foreach env in $env{
replace water_supply 		= 1 if environmental`r' == "water.supply "
replace erosion_control 	= 1 if environmental`r' == "erosion.control "
replace soil_retention 		= 1 if environmental`r' == "soil.retention"
replace nutrient_ratain 	= 1 if environmental`r' == "nutrient.ratain"
replace nutrient_enhance 	= 1 if environmental`r' == "nutrient.enhance"
replace nutrient_apply 		= 1 if environmental`r' == "nutrient.apply"
replace cover_land_restoration = 1 if environmental`r' == "cover.land.restoration"
replace vegetation 			= 1 if environmental`r' == "vegetation "
replace water_supply 		= 1 if environmental`r' == "water.supply "
replace water_retention 	= 1 if environmental`r' == "water.retention"
	}
}
save "did_system.dta", replace 


*-------------long fornat for summarised mapping

forvalues r=1/9{
	replace environmental`r' = "0" if environmental`r' == ""
}

rename environmental environmental_original
reshape long environmental, i(did region_name) j(csa_r) 
drop if environmental == "0"
save "environmental_long.dta", replace

*----------------CSA community wide------------
split csa_level, p(,)

****
global level "community"

foreach level in $level {
	gen csa_`level' = 0, after(csa_level)
	label variable csa_`level' "csa is reported at is: `level'"
}
forvalues r=1/3 {
	foreach level in $level{
		replace csa_`level' = 1 if csa_level`r' == "`level'"
	}
}

save "did_system.dta", replace 

*---CSA->DISTRICTS long------------------------

split csa_district, p(,)
drop if csa_district == ""
forvalues r=1/22{
	replace csa_district`r' = "0" if csa_district`r' == ""
}

rename csa_district csa_district_original
reshape long csa_district, i(did br_region_rowid district_id district_name) j(csa) 
drop if csa_district == "0"
save "csa_district_long.dta", replace

*---DISTRICTS->regions long----------------


forvalues r=1/20{
	replace district`r' = "0" if district`r' == ""
}

rename district district_original
reshape long district, i(did br_region_rowid region_id region_name) j(d) 
drop if district == "0"
save "project_district_long.dta", replace


clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_geo") firstrow
save "geo.dta", replace



rename region region_original
reshape long region, i(did) j(r) 
drop if region == "0"

gen PID = pid, after(pido)
replace PID = pido if pid == ""
export excel using "did_regions.xls", replace
keep PID region
export delimited using "regions_reported_in_documents.csv", replace
rename region Region


do "manage.do"

append using "project_region.dta", force

export delimited using "region_name_projects.csv", replace











