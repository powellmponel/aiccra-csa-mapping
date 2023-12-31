clear all
set more off
use "data/did_system.dta"

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


save "data/Region_project_system_social_long.dta", replace

export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\reports\datasets\CSA_social_feasibility_long.csv", replace