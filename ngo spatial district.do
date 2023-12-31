clear all
set more off
cd "D:\OneDrive - CGIAR\AICCRA\RIOS Resource Investment Optimization System\mapping CSA"
import excel "Organizational mapping.xlsx", sheet("NGOs mostly revised") firstrow

drop if District == ""
split District, p(,)
forvalues r=1/37{
	replace District`r'= "0" if District`r' == ""
}
rename District District_old
reshape long District, i(PID) j(r) 
drop if District == "0"

rename District District_managed
gen District = "0", after(District_managed)