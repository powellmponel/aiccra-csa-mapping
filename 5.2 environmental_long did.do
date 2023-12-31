clear all
set more off
use "data/did_system.dta"

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
save "data/Region_project_system_environmental_long.dta", replace
export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\reports\datasets\CSA_environmental_feasibility_long.csv", replace
