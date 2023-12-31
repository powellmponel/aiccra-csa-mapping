global sys "cropproduction	MixedSystems	forestry	livestockproduction	LandlessSystems	FisheriesAquaculture	Agroforestry"

foreach s in $sys {
gen `s' = 0, after(System)
label variable `s' "System: `s'"
}

replace	MixedSystems	 =1 if System == "Agricultural systems"
replace	Agroforestry	 =1 if System == "Agroforestry"
replace	FisheriesAquaculture	 =1 if System == "Aquaculture"
replace	cropproduction	 =1 if System == "Crop production, Fishing and Forestry"
replace	forestry	 =1 if System == "Crop production, Fishing and Forestry"
replace	FisheriesAquaculture	 =1 if System == "Crop production, Fishing and Forestry"
replace	cropproduction	 =1 if System == "Crop Prodcution"
replace	cropproduction	 =1 if System == "Crop Prodcution/  packaging"
replace	cropproduction	 =1 if System == "Crop production"
replace	FisheriesAquaculture	 =1 if System == "Crop Production, Aquaculture, Fishery"
replace	cropproduction	 =1 if System == "Crop Production, Aquaculture, Fishery"
replace	FisheriesAquaculture	 =1 if System == "Crop Production, Aquaculture, Fishery"
replace	cropproduction	 =1 if System == "Crop Production, Forestry"
replace	forestry	 =1 if System == "Crop Production, Forestry"
replace	forestry	 =1 if System == "Crop Production, Forestry"
replace	cropproduction	 =1 if System == "crop production, livestock production"
replace	cropproduction	 =1 if System == "Crop/Livestock Production"
replace	livestockproduction	 =1 if System == "Crop/Livestock Production"
replace	LandlessSystems	 =1 if System == "Education"
replace	LandlessSystems	 =1 if System == "Environment management"
replace	MixedSystems	 =1 if System == "FARMING SYSTEMS"
replace	cropproduction	 =1 if System == "Fertilizer"
replace	cropproduction	 =1 if System == "Fertilizer Production"
replace	LandlessSystems	 =1 if System == "Financial"
replace	FisheriesAquaculture	 =1 if System == "Fish production"
replace	MixedSystems	 =1 if System == "food system risk management"
replace	forestry	 =1 if System == "Forestry"
replace	MixedSystems	 =1 if System == "infrastructural development"
replace	MixedSystems	 =1 if System == "infrastructures"
replace	cropproduction	 =1 if System == "irrigation"
replace	cropproduction	 =1 if System == "land and water management"
replace	cropproduction	 =1 if System == "Land Development and Rice Cultivation Technology"
replace	cropproduction	 =1 if System == "land management"
replace	MixedSystems	 =1 if System == "land use systems"
replace	MixedSystems	 =1 if System == "landscale"
replace	cropproduction	 =1 if System == "landscape management"
replace	livestockproduction	 =1 if System == "Livestock Production"
replace	livestockproduction	 =1 if System == "Livestock Production"
replace	cropproduction	 =1 if System == "mushroom production"
replace	MixedSystems	 =1 if System == "natural sciences"
replace	MixedSystems	 =1 if System == "sustainable development"
replace	cropproduction	 =1 if System == " cashew, honey"
replace	LandlessSystems	 =1 if System == "sustainable development"
replace	LandlessSystems	 =1 if System == "technical and vocaitional training"
replace	LandlessSystems	 =1 if System == "technologies, information services and policies"

foreach s in $sys{
tostring `s', format(%17.0g)	replace
}

replace	cropproduction	 = "crop.production" if 	cropproduction	 == "1"
replace	MixedSystems	 = "Mixed.Systems" if 	MixedSystems	 == "1"
replace	forestry	 = "forestry" if 	forestry	 == "1"
replace	livestockproduction	 = "livestock.production" if 	livestockproduction	 == "1"
replace	LandlessSystems	 = "Landless.Systems" if 	LandlessSystems	 == "1"
replace	FisheriesAquaculture	 = "Fisheries.Aquaculture" if 	FisheriesAquaculture	 == "1"
replace	Agroforestry	 = "Agroforestry" if 	Agroforestry	 == "1"

rename	cropproduction	csa_system1
rename	MixedSystems	csa_system2
rename	forestry	csa_system3
rename	livestockproduction	csa_system4
rename	LandlessSystems	csa_system5
rename	FisheriesAquaculture	csa_system6
rename	Agroforestry	csa_system7

forvalues r=1/7{
	replace csa_system`r'= "0" if csa_system`r' == ""
}




