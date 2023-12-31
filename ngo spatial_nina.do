

cd"/Users/love2/Desktop/data and codes-2"
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
drop if Region== ""
split Region, p(,)

forvalues r=1/10{
	replace Region`r'= "0" if Region`r' == ""
}
rename Region Region_old
reshape long Region, i(PID) j(r) 

drop if Region== "0"

replace	Region = "AHAFO" if	Region 	== "Ahafo"
replace	Region = "AHAFO" if	Region 	== "AHR"
replace	Region = "National" if	Region 	== "All"
replace	Region = "ASHANTI" if	Region 	== "AR"
replace	Region = "ASHANTI" if	Region 	== "Ashanti"
replace	Region = "BRONG AHAFO" if	Region 	== "BA"
replace	Region = "BONO EAST" if	Region 	== "BE"
replace	Region = "BONO" if	Region 	== "BR"
replace	Region = "BRONG AHAFO" if	Region 	== "Brong"
replace	Region = "GREATER ACCRA" if	Region 	== "COASTAL"
replace	Region = "CENTRAL" if	Region 	== "CR"
replace	Region = "EASTERN" if	Region 	== "East"
replace	Region = "EASTERN" if	Region 	== "ER"
replace	Region = "GREATER ACCRA" if	Region 	== "GA"
replace	Region = "National" if	Region 	== "GHANA"
replace	Region = "GREATER ACCRA" if	Region 	== "GR"
replace	Region = "National" if	Region 	== "national"
replace	Region = "NORTH EAST" if	Region 	== "NE"
replace	Region = "NORTHERN" if	Region 	== "Norther"
replace	Region = "NORTHERN" if	Region 	== "NORTHERN"
replace	Region = "NORTHERN" if	Region 	== "NR"
replace	Region = "NORTHERN" if	Region 	== "NS"
replace	Region = "SAVANNA" if	Region 	== "SAVANNAH"
replace	Region = "SAVANNA" if	Region 	== "SR"
replace	Region = "UPPER EAST" if	Region 	== "UE"
replace	Region = "UPPER WEST" if	Region 	== "UW"
replace	Region = "VOLTA" if	Region 	== "VR"
replace	Region = "WESTERN" if	Region 	== "WE"
replace	Region = "WESTERN" if	Region 	== "West"
replace	Region = "WESTERN NORTH" if	Region 	== "WN"
replace	Region = "WESTERN" if	Region 	== "WR"
replace	Region = "OTI" if	Region 	== "Oti"
replace	Region = "AHAFO" if	Region 	== " Ahafo"
replace	Region = "AHAFO" if	Region 	== " AHR"
replace	Region = "National" if	Region 	== " All"
replace	Region = "ASHANTI" if	Region 	== " AR"
replace	Region = "ASHANTI" if	Region 	== " Ashanti"
replace	Region = "BRONG AHAFO" if	Region 	== " BA"
replace	Region = "BONO EAST" if	Region 	== " BE"
replace	Region = "BONO" if	Region 	== " BR"
replace	Region = "BRONG AHAFO" if	Region 	== " Brong"
replace	Region = "GREATER ACCRA" if	Region 	== " COASTAL"
replace	Region = "CENTRAL" if	Region 	== " CR"
replace	Region = "EASTERN" if	Region 	== " East"
replace	Region = "EASTERN" if	Region 	== " ER"
replace	Region = "GREATER ACCRA" if	Region 	== " GA"
replace	Region = "National" if	Region 	== " GHANA"
replace	Region = "GREATER ACCRA" if	Region 	== " GR"
replace	Region = "National" if	Region 	== " national"
replace	Region = "NORTH EAST" if	Region 	== " NE"
replace	Region = "NORTHERN" if	Region 	== " Norther"
replace	Region = "NORTHERN" if	Region 	== " NORTHERN"
replace	Region = "NORTHERN" if	Region 	== " NR"
replace	Region = "NORTHERN" if	Region 	== " NS"
replace	Region = "SAVANNA" if	Region 	== " SAVANNAH"
replace	Region = "SAVANNA" if	Region 	== " SR"
replace	Region = "UPPER EAST" if	Region 	== " UE"
replace	Region = "UPPER WEST" if	Region 	== " UW"
replace	Region = "VOLTA" if	Region 	== " VR"
replace	Region = "WESTERN" if	Region 	== " WE"
replace	Region = "WESTERN" if	Region 	== " West"
replace	Region = "WESTERN NORTH" if	Region 	== " WN"
replace	Region = "WESTERN" if	Region 	== " WR"
replace	Region = "OTI" if	Region 	== " Oti"
replace	Region = "ASHANTI" if	Region 	== " AR"
replace	Region = "BRONG AHAFO" if	Region 	== " BAR"
replace	Region = "BONO EAST" if	Region 	== " BER"
replace	Region = "BONO" if	Region 	== " BR"
replace	Region = "CENTRAL" if	Region 	== " CR"
replace	Region = "EASTERN" if	Region 	== " ER"
replace	Region = "GREATER ACCRA" if	Region 	== " GA"
replace	Region = "NORTH EAST" if	Region 	== " NER"
replace	Region = "NORTHERN" if	Region 	== " NR"
replace	Region = "NORTHERN" if	Region 	== " NR."
replace	Region = "SAVANNA" if	Region 	== " SR"
replace	Region = "UPPER EAST" if	Region 	== " UER"
replace	Region = "UPPER WEST" if	Region 	== " UWR"
replace	Region = "VOLTA" if	Region 	== " VR"
replace	Region = "WESTERN NORTH" if	Region 	== " WNR"
replace	Region = "WESTERN" if	Region 	== " WR"
replace	Region = "ASHANTI" if	Region 	== "AR"
replace	Region = "ASHANTI" if	Region 	== "AR"
replace	Region = "ASHANTI" if	Region 	== "Ashanti and Eastern regions."
replace	Region = "EASTERN" if	Region 	== "Ashanti and Eastern regions."
replace	Region = "BRONG AHAFO" if	Region 	== "BAR"
replace	Region = "BONO EAST" if	Region 	== "BER"
replace	Region = "BONO" if	Region 	== "BR"
replace	Region = "BRONG AHAFO" if	Region 	== "Brong Ahafo Region"
replace	Region = "CENTRAL" if	Region 	== "CR"
replace	Region = "EASTERN" if	Region 	== "ER"
replace	Region = "GREATER ACCRA" if	Region 	== "GR"
replace	Region = "NORTH EAST" if	Region 	== "NER"
replace	Region = "NORTHERN" if	Region 	== "Northern Region"
replace	Region = "NORTHERN" if	Region 	== "NR"
replace	Region = "OTI" if	Region 	== "OR"
replace	Region = "UPPER EAST" if	Region 	== "Three Northern Regions in Ghana"
replace	Region = "UPPER WEST" if	Region 	== "Three Northern Regions in Ghana"
replace	Region = "NORTHERN" if	Region 	== "Three Northern Regions in Ghana"
replace	Region = "UPPER EAST" if	Region 	== "UER"
replace	Region = "UPPER WEST" if	Region 	== "UWR"
replace	Region = "WESTERN NORTH" if	Region 	== "WNR"

save "PID_regions.dta", replace
export excel using "PID_regions.xls", firstrow(variables) replace





*-------------------DID ODK




*----BR DISTRICT
clear all
set more off
import excel "/Users/love2/Desktop/data and codes-2/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_district") firstrow
save "did_dist.dta", replace

clear all
import excel "/Users/love2/Desktop/data and codes-2/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_geo") firstrow
save "did_geo.dta", replace

clear all
import excel "/Users/love2/Desktop/data and codes-2/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_region") firstrow
save "did_region.dta", replace

clear all
set more off
import excel "/Users/love2/Desktop/data and codes-2/AICCRA_CSA_mapping_Gh.xlsx", sheet("maintable") firstrow
save "did_main.dta", replace

merge m:m did using "did_geo.dta"
drop _merge
merge m:m did using "did_dist.dta"
drop _merge
merge m:m did using "did_region.dta"

save"DID_RAW.dta", replace

replace region_name = "NORTHERN" if region_name== "NORTHERNold"
replace region_name = "BONO" 	if region_name== "BRONG.AHAFO"
replace region_name = "WESTERN" if region_name== "WESTERNold"
replace region_name = "VOLTA" 	if region_name== "VOLTAold"


replace region_name = "1" if region_name == "AHAFO"
replace region_name = "2" if region_name == "ASHANTI"
replace region_name = "3" if region_name == "BONO"
replace region_name = "4" if region_name == "BONO.EAST"
replace region_name = "5" if region_name == "CENTRAL"
replace region_name = "6" if region_name == "EASTERN"
replace region_name = "7" if region_name == "GREATER.ACCRA"
replace region_name = "8" if region_name == "NORTH.EAST"
replace region_name = "9" if region_name == "NORTHERN"
replace region_name = "888" if region_name == "not.reported"
replace region_name = "10" if region_name == "OTI"
replace region_name = "11" if region_name == "SAVANNA"
replace region_name = "12" if region_name == "UPPER.EAST"
replace region_name = "13" if region_name == "UPPER.WEST"
replace region_name = "14" if region_name == "VOLTA"
replace region_name = "15" if region_name == "WESTERN"
replace region_name = "16" if region_name == "WESTERN.NORTH"

destring region_name, replace
label define region_name 1 "AHAFO" 2	"ASHANTI" 3 "BONO" 4	"BONO.EAST" 5	"CENTRAL" 6	"EASTERN" 7	"GREATER.ACCRA" 8	"NORTH.EAST" 9	"NORTHERN" 888	"not.reported" 10	"OTI" 11	"SAVANNA" 12	"UPPER.EAST" 13	"UPPER.WEST" 14	"VOLTA" 15	"WESTERN" 16	"WESTERN.NORTH "
label values region_name region

*-------------------------SYSTEM-----------------------------------------
*system
clear all
use "DID_RAW"
split csa_system, p(,)
forvalues r=1/5{
	replace csa_system`r'= "0" if csa_system`r'== ""
}
rename csa_system csa_system_old
list region_name if csa_system_old== "" 
drop if csa_system_old != "" & region_name== ""
drop if csa_system_old== ""
gen id = _n, before(did)
reshape long csa_system, i(did id) j(sys) 
drop if csa_system== "0"
replace csa_system = "1" if csa_system== "crop.production"
replace csa_system = "2" if csa_system== "Landless.Systems"
replace csa_system = "3" if csa_system== "Mixed.Systems"
replace csa_system = "4" if csa_system== "forestry"
replace csa_system = "5" if csa_system== "livestock.production"
replace csa_system = "6" if csa_system== "Fisheries.Aquaculture"

destring csa_system, replace
label define system 1"crop.production" 2"Landless.Systems" 3"Mixed.Systems" 4"forestry"5"livestock.production" 6"Fisheries.Aquaculture"
label values csa_system system
save "did_system.dta", replace
keep pid csa_system region_name
save "did_system_region.dta", replace

*clear all
*use "PID_regions.dta", replace
*do "Encoded CSA Systems.do"
*reshape long csa_system, i(PID Region) j(sys) 
*drop if csa_system== "0"

*forvalues r=1/6{
*	replace csa_system`r' = "0" if csa_system`r'== ""
*}

*rename csa_system csa_system_original
*reshape long csa_system, i(id sys) j(s) 
*drop if csa_system== "0"
*duplicates drop pid csa_system social, force
*save "did_system_social_long.dta", replace


*save "PID_system.dta", replace

*keep PID csa_system Region
*rename PID pid
*rename Region region_name
*append using "did_system_region.dta", force
*do "edit_regions.do"
*export excel using "pid_system_region.xls", replace firstrow(variables)



***-------------------CSA region long-------------------------------------------
clear all
use "did_system.dta"
drop if csa_region== ""
split csa_region, p(,)
forvalues r=1/23{
	replace csa_region`r' = "0" if csa_region`r'== ""
}

rename csa_region csa_region_original
reshape long csa_region, i(did id sys) j(csa_r) 
drop if csa_region== "0"
save "csa_region_long.dta", replace

*----------------------Social wide with yes/no--------------------------------
clear all
set more off
use "did_system.dta"

split social, p(,)

global soc "adaptation learning use access adoption"


gen change_strategies = 0, after(social)
foreach soc in $soc {
	gen `soc' = 0, after(social)
	label variable `soc'"social benefit is: `soc'"
}

forvalues r=1/6 {
	foreach soc in $soc{
		replace `soc' = 1 if social`r'== "`soc'"
		replace change_strategies 	= 1 if social`r'== "change.strategies"
		replace adaptation 			= 1 if social`r'== "adaptation"
		replace learning 			= 1 if social`r'== "learning"
		replace use 				= 1 if social`r'== "use"
		replace access 				= 1 if social`r'== "access"
		replace adoption 			= 1 if social`r'== "adoption"
		
	}
}
save "did_system.dta", replace

*----------------------Social long--------------------------------

forvalues r=1/6{
	replace social`r' = "0" if social`r'== ""
}

rename social social_original
reshape long social, i(id sys) j(s) 
drop if social== "0"
duplicates drop pid csa_system social, force
replace social = "1" if social == "adaptation"
replace social = "2" if social == "adoption"
replace social = "3" if social == "change.strategies"
replace social = "4" if social == "learning"
replace social = "5" if social == "access"
replace social = "6" if social == "use"

destring social, replace

label define soc 1 "adaptation" 2 "adoption" 3	"change.strategies" 4	"learning" 5	"access" 6	"use" 
label values social soc


save "Region_project_system_social_long.dta", replace


*--------------------Environmental----------------------------
clear all
use "did_system.dta"
split environmental, p(,)

*----------------wide format with yes/no
global env"soil.retention erosion.control nutrient.ratain nutrient.enhance water.supply nutrient.apply cover.land.restoration vegetation water.retention"
global envv"soil_retention erosion_control nutrient_ratain nutrient_enhance water_supply nutrient_apply cover_land_restoration vegetation water_retention"

foreach envv in $envv{
	gen `envv'=0, after(environmental)
	label variable `envv'"environmental benefit is: `envv'"
}


forvalues r=1/9 {
	foreach env in $env{
replace water_supply 		= 1 if environmental`r'== "water.supply"
replace erosion_control 	= 1 if environmental`r'== "erosion.control"
replace soil_retention 		= 1 if environmental`r'== "soil.retention"
replace nutrient_ratain 	= 1 if environmental`r'== "nutrient.ratain"
replace nutrient_enhance 	= 1 if environmental`r'== "nutrient.enhance"
replace nutrient_apply 		= 1 if environmental`r'== "nutrient.apply"
replace cover_land_restoration = 1 if environmental`r'== "cover.land.restoration"
replace vegetation 			= 1 if environmental`r'== "vegetation"
replace water_supply 		= 1 if environmental`r'== "water.supply"
replace water_retention 	= 1 if environmental`r'== "water.retention"
	}
}
save "did_system.dta", replace 


*-------------long fornat for summarised mapping
forvalues r=1/9{
	replace environmental`r' = "0" if environmental`r'== ""
}

rename environmental environmental_original
reshape long environmental, i(did id sys region_name) j(csa_r) 
drop if environmental== "0"
duplicates drop pid csa_system environmental, force
replace environmental = "1" if environmental == "land.restoration"
replace environmental = "2" if environmental == "water.supply"
replace environmental = "3" if environmental == "nutrient.enhance"
replace environmental = "4" if environmental == "nutrient.ratain"
replace environmental = "5" if environmental == "soil.retention"
replace environmental = "6" if environmental == "water.retention"
replace environmental = "7" if environmental == "erosion.control"
replace environmental = "8" if environmental == "vegetation.cover"
replace environmental = "9" if environmental == "nutrient.apply"

destring environmental, replace


label define env 1 "land.restoration" 2 "wat.supply" 3	"nut.enhance " 4	"nut.ratain" 5	"soil.retain" 6	"water.retain" 7	"erosion.c" 8	"vegetation.c" 9	"nut.apply" 
label values environmental env
save "Region_project_system_environmental_long.dta", replace



*----------------CSA community wide------------
split csa_level, p(,)

****
global level"community"

foreach level in $level {
	gen csa_`level' = 0, after(csa_level)
	label variable csa_`level'"csa is reported at is: `level'"
}
forvalues r=1/3 {
	foreach level in $level{
		replace csa_`level' = 1 if csa_level`r'== "`level'"
	}
}

save "did_system.dta", replace 

*---CSA->DISTRICTS long------------------------

split csa_district, p(,)
drop if csa_district== ""
forvalues r=1/22{
	replace csa_district`r' = "0" if csa_district`r'== ""
}

rename csa_district csa_district_original
reshape long csa_district, i(did br_region_rowid district_id district_name) j(csa) 
drop if csa_district== "0"
save "csa_district_long.dta", replace

*---DISTRICTS->regions long----------------


forvalues r=1/20{
	replace district`r' = "0" if district`r'== ""
}

rename district district_original
reshape long district, i(did br_region_rowid region_id region_name) j(d) 
drop if district== "0"
save "project_district_long.dta", replace


clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_geo") firstrow
save "geo.dta", replace



rename region region_original
reshape long region, i(did) j(r) 
drop if region== "0"

gen PID = pid, after(pido)
replace PID = pido if pid== ""
export excel using "did_regions.xls", replace
keep PID region
export delimited using "regions_reported_in_documents.csv", replace
rename region Region


do "manage.do"

append using "project_region.dta", force

export delimited using "region_name_projects.csv", replace











