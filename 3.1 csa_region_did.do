clear all
use "data/did_system.dta"

drop if csa_region== ""
split csa_region, p(,)
forvalues r=1/23{
	replace csa_region`r' = "0" if csa_region`r'== ""
}

rename csa_region csa_region_original
reshape long csa_region, i(did id sys) j(csa_r) 
drop if csa_region== "0"
save "data/csa_region_long.dta", replace
export delimited using "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA\CSA Mapping share\reports\datasets\csa_region.csv", replace


*------ merge region and district, then removeduplicates for regional level CSAs
