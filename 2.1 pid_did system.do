*--------------DID system
clear all
use "data/DID_regions_wide.dta"
split csa_system, p(,)
forvalues r=1/5{
	replace csa_system`r'= "0" if csa_system`r'== ""
}
rename csa_system csa_system_old
list region_name if csa_system_old== "" 
drop if csa_system_old != "" & region_name== .
drop if csa_system_old== ""
gen id = _n, before(did)
reshape long csa_system, i(did id) j(sys) 
drop if csa_system== "0"
do "do/destring system.do"
destring csa_system, replace
replace csa_system = 3 if csa_system == 7
label define system 1"crop.production" 2"Landless.Systems" 3 "Mixed.Systems" 4 "forestry" 5 "livestock.production" 6 "Fisheries.Aquaculture" 
label values csa_system system

save "data/did_system.dta", replace
*keep pid org_type csa_system region_name
save "data/did_org_system_region.dta", replace

*------------------PID system    --------------------
clear all
use "data/PID_regions_wide.dta"
do "do/Encoded CSA Systems.do"
reshape long csa_system, i(PID Region r) j(sys) 
drop if csa_system== "0"
rename PID pid
do "do/destring system.do"
destring csa_system, replace
replace csa_system = 3 if csa_system == 7
label define system  1 "crop.production" 2 "Landless.Systems" 3 "Mixed.Systems" 4 "forestry" 5 "livestock.production" 6 "Fisheries.Aquaculture"
label values csa_system system
*keep pid org_type csa_system region_name

append using "data/did_org_system_region.dta"

duplicates drop pid org_type csa_system region_name, force
do "do/destring_pid.do"
save "data/region_org_system.dta", replace
export excel using "data/region_org_system.xls", replace firstrow(variables)

