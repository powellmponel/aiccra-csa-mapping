clear all
set more off

import excel "Organizational mapping.xlsx", sheet("Government Mostly revised") firstrow

save "Project_region_gvt.dta", replace


drop if Region == ""

split Region, p(,)

forvalues r=1/8{
	replace Region`r'= "0" if Region`r'==""
}

foreach r in Region2 Region1  Region3  Region5  Region7   Region4  Region6  Region8 {
replace	`r'= "AHAFO" if `r' == "Ahafo"
replace	`r'= "AHAFO" if `r' == "AHR"
replace	`r'= "National" if `r' == "All"
replace	`r'= "ASHANTI" if `r' == "AR"
replace	`r'= "ASHANTI" if `r' == "Ashanti"
replace	`r'= "BRONG AHAFO" if `r' == "BA"
replace	`r'= "BONO EAST" if `r' == "BE"
replace	`r'= "BONO" if `r' == "BR"
replace	`r'= "BRONG AHAFO" if `r' == "Brong"
replace	`r'= "GREATER ACCRA" if `r' == "COASTAL"
replace	`r'= "CENTRAL" if `r' == "CR"
replace	`r'= "EASTERN" if `r' == "East"
replace	`r'= "EASTERN" if `r' == "ER"
replace	`r'= "GREATER ACCRA" if `r' == "GA"
replace	`r'= "National" if `r' == "GHANA"
replace	`r'= "GREATER ACCRA" if `r' == "GR"
replace	`r'= "National" if `r' == "national"
replace	`r'= "NORTH EAST" if `r' == "NE"
replace	`r'= "NORTHERN" if `r' == "Norther"
replace	`r'= "NORTHERN" if `r' == "NORTHERN"
replace	`r'= "NORTHERN" if `r' == "NR"
replace	`r'= "NORTHERN" if `r' == "NS"
replace	`r'= "SAVANNA" if `r' == "SAVANNAH"
replace	`r'= "SAVANNA" if `r' == "SR"
replace	`r'= "UPPER EAST" if `r' == "UE"
replace	`r'= "UPPER WEST" if `r' == "UW"
replace	`r'= "VOLTA" if `r' == "VR"
replace	`r'= "WESTERN" if `r' == "WE"
replace	`r'= "WESTERN" if `r' == "West"
replace	`r'= "WESTERN NORTH" if `r' == "WN"
replace	`r'= "WESTERN" if `r' == "WR"
replace	`r'= "OTI" if `r' == "Oti"

replace	`r'= "AHAFO" if `r' == " Ahafo"
replace	`r'= "AHAFO" if `r' == " AHR"
replace	`r'= "National" if `r' == " All"
replace	`r'= "ASHANTI" if `r' == " AR"
replace	`r'= "ASHANTI" if `r' == " Ashanti"
replace	`r'= "BRONG AHAFO" if `r' == " BA"
replace	`r'= "BONO EAST" if `r' == " BE"
replace	`r'= "BONO" if `r' == " BR"
replace	`r'= "BRONG AHAFO" if `r' == " Brong"
replace	`r'= "GREATER ACCRA" if `r' == " COASTAL"
replace	`r'= "CENTRAL" if `r' == " CR"
replace	`r'= "EASTERN" if `r' == " East"
replace	`r'= "EASTERN" if `r' == " ER"
replace	`r'= "GREATER ACCRA" if `r' == " GA"
replace	`r'= "National" if `r' == " GHANA"
replace	`r'= "GREATER ACCRA" if `r' == " GR"
replace	`r'= "National" if `r' == " national"
replace	`r'= "NORTH EAST" if `r' == " NE"
replace	`r'= "NORTHERN" if `r' == " Norther"
replace	`r'= "NORTHERN" if `r' == " NORTHERN"
replace	`r'= "NORTHERN" if `r' == " NR"
replace	`r'= "NORTHERN" if `r' == " NS"
replace	`r'= "SAVANNA" if `r' == " SAVANNAH"
replace	`r'= "SAVANNA" if `r' == " SR"
replace	`r'= "UPPER EAST" if `r' == " UE"
replace	`r'= "UPPER WEST" if `r' == " UW"
replace	`r'= "VOLTA" if `r' == " VR"
replace	`r'= "WESTERN" if `r' == " WE"
replace	`r'= "WESTERN" if `r' == " West"
replace	`r'= "WESTERN NORTH" if `r' == " WN"
replace	`r'= "WESTERN" if `r' == " WR"
replace	`r'= "OTI" if `r' == " Oti"
}

destring ExistingTechnologiesYesNo, replace
rename Region Region_select
reshape long Region, i(PID) j(r) 
drop if Region == "0"
drop District

export delimited using "Project_regions_gvt.csv", replace
