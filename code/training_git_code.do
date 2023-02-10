* GIT TRAINING

* setting directories 
local rhome "/Users/galvezsk/Documents/GitHub/rp-workshop/rp-workshop-skg"
local rdata "/Users/galvezsk/Documents/GitHub/rp-workshop/rp-workshop-skg/data"

*import delimited "`rdata'/tidy/mother_survey.csv", clear
use "`rdata'/tidy/child", clear


replace sex= strupper(sex)
gen sex_binary=1 if sex=="FEMALE"| sex=="F"
replace sex_binary=0 if sex_binary==.

label define gender 1 "Female" 0 "Male" 
label values sex_binary gender

drop sex 
rename sex_binary sex

save "`rdata'/analysis/child_skg.dta", replace
