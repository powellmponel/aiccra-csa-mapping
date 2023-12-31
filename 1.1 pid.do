*-----------PID MERGE RAW
clear all
set more off
import excel "data/Organizational mapping.xlsx", sheet("Government Mostly revised") firstrow
destring ExistingTechnologiesYesNo, replace
gen org_type = 1, before(ImplementingAgencies)
do "do/org_type_edit.do"
save "data/PID_RAW_wide.dta", replace
clear all
set more off
import excel "data/Organizational mapping.xlsx", sheet("NGOs mostly revised") firstrow
gen org_type = 2, before(ImplementingAgencies)
label define org 1 "government" 2 "ngo"
label values org_type org
append using "data/PID_RAW_wide.dta", force
save "data/PID_RAW_wide.dta", replace

*------------PID REGIONS LONG
clear all
set more off
use "data/PID_RAW_wide.dta"
drop if Region== ""
split Region, p(,)

forvalues r=1/10{
	replace Region`r'= "0" if Region`r' == ""
}
rename Region Region_old
reshape long Region, i(PID) j(r) 

drop if Region== "0"
do "do/pid_regions_edit.do"
rename Region region_name
do "do/destring_regions.do"
save "data/PID_regions_wide.dta", replace