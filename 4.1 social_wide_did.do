clear all
set more off
use "data/did_system.dta"

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
save "data/did_system.dta", replace
