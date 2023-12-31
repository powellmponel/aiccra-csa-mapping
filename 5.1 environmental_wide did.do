clear all
use "data/did_system.dta"
split environmental, p(,)

*----------------
global env"soil.retention erosion.control nutrient.ratain nutrient.enhance water.supply nutrient.apply cover.land.restoration vegetation water.retention"
global envv"soil_retention erosion_control nutrient_ratain nutrient_enhance water_supply nutrient_apply cover_land_restoration vegetation water_retention"

foreach envv in $envv{
	gen `envv'=0, after(environmental)
	label variable `envv'"environmental benefit is: `envv'"
}


forvalues r=1/9 {
	foreach env in $env{
replace water_supply 		= 1 if environmental`r'== "water.supply"
replace erosion_control 	= 1 if environmental`r'== "erosion.control"
replace soil_retention 		= 1 if environmental`r'== "soil.retention"
replace nutrient_ratain 	= 1 if environmental`r'== "nutrient.ratain"
replace nutrient_enhance 	= 1 if environmental`r'== "nutrient.enhance"
replace nutrient_apply 		= 1 if environmental`r'== "nutrient.apply"
replace cover_land_restoration = 1 if environmental`r'== "cover.land.restoration"
replace vegetation 			= 1 if environmental`r'== "vegetation"
replace water_supply 		= 1 if environmental`r'== "water.supply"
replace water_retention 	= 1 if environmental`r'== "water.retention"
	}
}
save "data/did_system.dta", replace 