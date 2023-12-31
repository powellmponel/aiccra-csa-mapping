clear all
set more off

cd "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\data and codes"

import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_district") firstrow
drop if district_name == ""
drop if csa_district == ""

split csa_district, p(,)

forvalues r=1/22{
	replace csa_district`r' = "0" if csa_district`r' == ""
}

rename csa_district csa_district_original
reshape long csa_district, i(did br_region_rowid district_id district_name) j(csa) 
drop if csa_district == "0"
save "csa_district_long.dta", replace


clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("br_region") firstrow
drop if region_name == ""
drop if district == ""

split district, p(,)

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

clear all
import excel "AICCRA_CSA_mapping_Gh.xlsx", sheet("maintable") firstrow

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

split environmental, p(,)



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

split csa_level, p(,)

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

split region, p(,)
forvalues r=1/20{
	replace region`r' = "0" if region`r' == ""
}

save "did.dta", replace
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

export delimited using "region_projects.csv", replace