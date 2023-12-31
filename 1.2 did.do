*----BR DISTRICT
clear all
set more off
import excel "data/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_district") firstrow
save "data/did_dist.dta", replace

clear all
import excel "data/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_geo") firstrow
save "data/did_geo.dta", replace

clear all
import excel "data/AICCRA_CSA_mapping_Gh.xlsx", sheet("br_region") firstrow
save "data/did_region.dta", replace

clear all
set more off
import excel "data/AICCRA_CSA_mapping_Gh.xlsx", sheet("maintable") firstrow
save "data/did_main.dta", replace

merge m:m did using "data/did_geo.dta"
drop _merge
merge m:m did using "data/did_dist.dta"
drop _merge
merge m:m did using "data/did_region.dta"

replace org_type = "1" if org_type == "gvt"
replace org_type = "2" if org_type == "ngo"
destring org_type, replace
label define org 1 "government" 2 "ngo"
label values org_type org
replace pid = pido if pid == ""
save "data/DID_RAW_wide.dta", replace

*-------------------------did manage the regions-------------------------
do "do/did_regions_edit.do"
do "do/destring_regions.do"

save "data/DID_regions_wide.dta", replace