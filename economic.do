*global econ "budget cost.benefit expenditure profit value"

replace economic = "1" if economic == "budget"
replace economic = "2" if economic == "cost.benefit"
replace economic = "3" if economic == "expenditure"
replace economic = "4" if economic == "profit"
replace economic = "5" if economic == "value"

destring economic , replace
label define ec 1 "budget" 2 "cost.benefit" 3 "expenditure" 4 "profit" 5 "value"
label values economic ec

destring economic_value, replace