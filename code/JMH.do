cd "/Users/hascherj/Dropbox/Mac/Documents/rp-workshop/code"
cd "../data/tidy"
use child, clear
replace sex =  strlower(sex)
gen female = -1
replace female = 1 if sex == "f" | sex == "female"
replace female = 0 if sex == "m" | sex == "male"
drop sex
replace yob = . if yob==9999
/*
replace grade = . if grade < 0
*/
save child_clean, replace

use mother, clear
codebook
