clear all
set more off
use "data/did_system.dta"

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

save "data/did_system.dta", replace 
export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\reports\datasets\system_social_environmental.csv", replace
