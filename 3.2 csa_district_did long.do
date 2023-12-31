clear all
set more off
use "data/did_system.dta"
split csa_district, p(,)
drop if csa_district== ""
forvalues r=1/22{
	replace csa_district`r' = "0" if csa_district`r'== ""
}
rename csa_district csa_district_original
gen case_id = _n
reshape long csa_district, i(case_id) j(csa) 
drop if csa_district== "0"

do "do/destring_csa.do"
do "do/destring_district.do"
keep case_id did pid org_type csa_system region_name district_name csa_district

*structural reclassification
gen	tree_based		= ., after(csa_district)
gen manure 			= ., after(csa_district)
gen mixed_cropping 	= ., after(csa_district)
gen ca 				= ., after(csa_district)
gen irrigation 		= ., after(csa_district)

global tree 	"3	1	4	30	2	21	7"
global manure 	"6 20 23 24 25 28"
global cropping "5 8 12 13 19 34"
global ca 		"10 11 12 13 15 20 22"
global irr 		"14 18 26 27 31 32 33"
foreach t in $tree{
	replace tree_based = 1 if csa_district == `t'
}
foreach m in $manure{
	replace manure = 1 if csa_district == `m'
}
foreach mc in $cropping{
	replace mixed_cropping = 1 if csa_district == `mc'
}
foreach ca in $ca{
	replace ca = 1 if csa_district == `ca'
} 
foreach i in $irr{
	replace irrigation = 1 if csa_district == `i'
}


*functional reclassification
global sr "1 2 3 4 5 7 8 10 11 15 19 20 21 22 30 34"
global sn "1 2 3 4 6 8 9 10 12 13 15 21 23 24 25 28 30"
global wc "1 2 3 4 10 11 14 18 20 21 22 26 27 31 32 33"
gen soil_reten = ., after(csa_district)
gen soil_nutri = ., after(csa_district)
gen water_cons = ., after(csa_district)

foreach i in $sr{
	replace soil_reten = 1 if csa_district == `i'
}
foreach i in $sn{
	replace soil_nutri = 1 if csa_district == `i'
}
foreach i in $wc{
	replace water_cons = 1 if csa_district == `i'
}

save "data/csa_district_long.dta", replace
export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\reports\datasets\csa_district.csv", replace

*---DISTRICTS->regions long----------------


*forvalues r=1/20{
*	replace district`r' = "0" if district`r'== ""
*}

*rename district district_original
*reshape long district, i(did br_region_rowid region_name) j(d) 
*drop if district== "0"
*save "data/project_district_long.dta", replace
*export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping *CSA\CSA Mapping share\datasets\csa_district.csv", replace
