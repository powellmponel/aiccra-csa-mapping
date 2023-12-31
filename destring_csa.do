replace csa_district = "1" if csa_district == "Agrisilviculture.system"
replace csa_district = "2" if csa_district == "Agrisilvopastoral.system"
replace csa_district = "3" if csa_district == "agroforestry"
replace csa_district = "4" if csa_district == "agropastoral"
replace csa_district = "5" if csa_district == "Alley.cropping"
replace csa_district = "6" if csa_district == "animal.manure"
replace csa_district = "7" if csa_district == "Boundary.planting"
replace csa_district = "8" if csa_district == "cereal.legume.integration"
replace csa_district = "9" if csa_district == "Chemical.Fertilizer"
replace csa_district = "10" if csa_district == "Conservation.tillage"
replace csa_district = "11" if csa_district == "Cover.Cropping"
replace csa_district = "12" if csa_district == "crop.rotation"
replace csa_district = "13" if csa_district == "Crop.rotations.incorporating.legumes"
replace csa_district = "14" if csa_district == "dams"
replace csa_district = "15" if csa_district == "green.manures"
replace csa_district = "16" if csa_district == "Integrated.crop.livestock.farming"
replace csa_district = "17" if csa_district == "Integrated.soil.crop.water.management"
replace csa_district = "18" if csa_district == "Manual.pump.irrigation"
replace csa_district = "19" if csa_district == "Mixed.cropping."
replace csa_district = "20" if csa_district == "Mulching"
replace csa_district = "21" if csa_district == "Multi.purpose.tree.planting."
replace csa_district = "22" if csa_district == "No.tillage"
replace csa_district = "23" if csa_district == "Organic.amendment"
replace csa_district = "24" if csa_district == "organic.fertilizer"
replace csa_district = "25" if csa_district == "Ploughing.crop.residues.into.soil"
replace csa_district = "26" if csa_district == "pools"
replace csa_district = "27" if csa_district == "Reserviors"
replace csa_district = "28" if csa_district == "residue.incorporation"
replace csa_district = "29" if csa_district == "Rowline.planting."
replace csa_district = "30" if csa_district == "silvopastoral.system"
replace csa_district = "31" if csa_district == "solar.pump.irrigation"
replace csa_district = "32" if csa_district == "Solar.pumps"
replace csa_district = "33" if csa_district == "Sprinkler.and.drip.irrigation"
replace csa_district = "34" if csa_district == "Strip.cropping"

destring csa_district, replace

label define c 1"Agrisilviculture.system"	2"Agrisilvopastoral.system"	3"agroforestry"	4"agropastoral"	5"Alley.cropping"	6"animal.manure"	7"Boundary.planting"	8"cereal.legume.integration"	9"Chemical.Fertilizer"	10"Conservation.tillage"	11"Cover.Cropping"	12"crop.rotation"	13"Crop.rotations.incorporating.legumes"	14"dams"	15"green.manures"	16"Integrated.crop.livestock.farming"	17"Integrated.soil.crop.water.management"	18"Manual.pump.irrigation"	19"Mixed.cropping."	20"Mulching"	21"Multi.purpose.tree.planting."	22"No.tillage"	23"Organic.amendment"	24"organic.fertilizer"	25"Ploughing.crop.residues.into.soil"	26"pools"	27"Reserviors"	28"residue.incorporation"	29"Rowline.planting."	30"silvopastoral.system"	31"solar.pump.irrigation"	32"Solar.pumps"	33"Sprinkler.and.drip.irrigation"	34"Strip.cropping"
label values csa_district c