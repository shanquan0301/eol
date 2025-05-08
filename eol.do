clear 
clear matrix
set more off
capture log close _all
 
* Set data path
global path_data_orig = "D:\OneDrive - King's College London\KCL\Global HRS EOL\path_data_orig"
global path_data = "D:\OneDrive - King's College London\KCL\Global HRS EOL\path_data"
global path_results = "D:\OneDrive - King's College London\KCL\Global HRS EOL\results"
 
log using "D:\OneDrive - King's College London\KCL\Global HRS EOL\results\log_HRS EOL", replace
 
use "${path_data_orig}/dat_eol.dta", replace

**# Figure 1
//This code uses the United States (USA) as an example. To run analyses for other countries, simply replace "USA" with "EU", "South Korea", "Mexico", "China", or "England" in the relevant parts of the code.
ci proportions help_adl_iadl_ if country == "USA", wald
ci proportions help_adl_iadl_formal if country == "USA", wald  
ci proportions help_adl_iadl_informal if country == "USA", wald 
ci proportions help_adl_iadl_informal_spouse  if country == "USA", wald 
ci proportions help_adl_iadl_informal_child if country == "USA", wald 
ci proportions help_adl_iadl_informal_relative if country == "USA", wald 
ci proportions help_adl_iadl_infor_nonrelat if country == "USA", wald 

ci proportions help_adl_3mo_ if country == "USA", wald  
ci proportions help_adl_formal if country == "USA", wald  
ci proportions help_adl_informal_ if country == "USA", wald  
ci proportions help_adl_informal_spouse  if country == "USA", wald  
ci proportions help_adl_informal_child if country == "USA", wald  
ci proportions help_adl_informal_relative if country == "USA", wald  
ci proportions help_adl_informal_nonrelative if country == "USA", wald  

ci proportions help_iadl_3mo_ if country == "USA", wald  
ci proportions help_iadl_formal if country == "USA", wald  
ci proportions help_iadl_informal_ if country == "USA"
ci proportions help_iadl_informal_spouse  if country == "USA", wald  
ci proportions help_iadl_informal_child if country == "USA", wald  
ci proportions help_iadl_informal_relative if country == "USA", wald  
ci proportions help_iadl_informal_nonrelative if country == "USA", wald  

//Note: ELSA does not collect information on informal or formal care received for ADLs, nor does it collect this information for IADLs.


**# place of death_Figure2
//Uses the United States (USA) as an example. To run analyses for other countries, simply replace "USA" with "EU", "South Korea", "Mexico", "China", or "England" in the relevant parts of the code.
//ADL/IADL
bysort death_nursing: ci proportions help_adl_iadl_ if country == "USA", wald
tabulate help_adl_iadl_ death_nursing if country == "USA", chi2 column

bysort death_nursing: ci proportions help_adl_iadl_informal if country == "USA", wald

bysort death_nursing: ci proportions help_adl_iadl_formal if country == "USA", wald 

bysort death_nursing: ci proportions help_adl_3mo_ if country == "USA", wald

bysort death_nursing: ci proportions help_adl_informal_ if country == "USA", wald

bysort death_nursing: ci proportions help_adl_formal if country == "USA", wald

bysort death_nursing: ci proportions help_iadl_3mo_ if country == "USA", wald

bysort death_nursing: ci proportions help_iadl_informal_ if country == "USA", wald

bysort death_nursing: ci proportions help_iadl_formal if country == "USA", wald


**# Regressions
//Uses the United States (USA) as an example. To run analyses for other countries, simply replace "USA" with "EU", "South Korea", "Mexico", or "China" in the relevant parts of the code.
logistic help_adl_iadl_ i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADLIADL9_ if country == "USA" 
logistic help_adl_iadl_informal i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADLIADL9_ if country == "USA"
logistic help_adl_iadl_formal i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADLIADL9_ if country == "USA"

logistic help_adl_3mo_ i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADL5_ if country == "USA"
logistic help_adl_informal_ i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADL5_ if country == "USA"
logistic help_adl_formal i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year ADL5_ if country == "USA"

logistic help_iadl_3mo_ i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year IADL4_ if country == "USA"
logistic help_iadl_informal_ i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year IADL4_ if country == "USA"
logistic help_iadl_formal i.death_nursing ib(1).rural i.married i.num_childg2 i.ltc_insurance i.edu age i.gender i.chronicg i.death_year IADL4_ if country == "USA"


**# rural-urban residence_Figure 3
//Uses the United States (USA) as an example. To run analyses for other countries, simply replace "USA" with "EU", "South Korea", "Mexico", "China", or "England" in the relevant parts of the code

bysort rural: ci proportions help_adl_iadl_ if country == "USA", wald

bysort rural: ci proportions help_adl_iadl_informal if country == "USA", wald

bysort rural: ci proportions help_adl_iadl_formal if country == "USA", wald

bysort rural: ci proportions help_adl_3mo_ if country == "USA", wald

bysort rural: ci proportions help_adl_informal_ if country == "USA", wald

bysort rural: ci proportions help_adl_formal if country == "USA", wald

bysort rural: ci proportions help_iadl_3mo_ if country == "USA", wald

bysort rural: ci proportions help_iadl_informal_ if country == "USA", wald

bysort rural: ci proportions help_iadl_formal if country == "USA", wald


**# marrital status_Figure 4
//Uses the United States (USA) as an example.
bysort married: ci proportions help_adl_iadl_ if country == "USA", wald

bysort married: ci proportions help_adl_iadl_informal if country == "USA", wald

bysort married: ci proportions help_adl_iadl_formal if country == "USA", wald

bysort married: ci proportions help_adl_3mo_ if country == "USA", wald

bysort married: ci proportions help_adl_informal_ if country == "USA", wald

bysort married: ci proportions help_adl_formal if country == "USA", wald

bysort married: ci proportions help_iadl_3mo_ if country == "USA", wald

bysort married: ci proportions help_iadl_informal_ if country == "USA", wald

bysort married: ci proportions help_iadl_formal if country == "USA", wald


**# having children or not_Figure 5
//Uses the United States (USA) as an example.
bysort num_childg2: ci proportions help_adl_iadl_ if country == "USA", wald

bysort num_childg2: ci proportions help_adl_iadl_informal if country == "USA", wald

bysort num_childg2: ci proportions help_adl_iadl_formal if country == "USA", wald

bysort num_childg2: ci proportions help_adl_3mo_ if country == "USA", wald

bysort num_childg2: ci proportions help_adl_informal_ if country == "USA", wald

bysort num_childg2: ci proportions help_adl_formal if country == "USA", wald

bysort num_childg2: ci proportions help_iadl_3mo_ if country == "USA", wald

bysort num_childg2: ci proportions help_iadl_informal_ if country == "USA", wald

bysort num_childg2: ci proportions help_iadl_formal if country == "USA", wald



**#  LTCI Figure in appendix
//Uses the United States (USA) as an example.
//Only HRS and SHARE have the long-term care insurance
bysort ltc_insurance: ci proportions help_adl_iadl_ if country == "USA", wald

bysort ltc_insurance: ci proportions help_adl_iadl_informal if country == "USA", wald

bysort ltc_insurance: ci proportions help_adl_iadl_formal if country == "USA", wald

bysort ltc_insurance: ci proportions help_adl_3mo_ if country == "USA", wald

bysort ltc_insurance: ci proportions help_adl_informal_ if country == "USA", wald

bysort ltc_insurance: ci proportions help_adl_formal if country == "USA", wald

bysort ltc_insurance: ci proportions help_iadl_3mo_ if country == "USA", wald

bysort ltc_insurance: ci proportions help_iadl_informal_ if country == "USA", wald

bysort ltc_insurance: ci proportions help_iadl_formal if country == "USA", wald


**# Tables in appendix. 
//Uses the United States (USA) as an example. To run analyses for other countries, simply replace "USA" with "EU", "China", or "England" in the relevant parts of the code.
ci proportions help_dress_3mo if country == "USA", wald 
ci proportions help_bathe_3mo if country == "USA", wald  
ci proportions help_eat_3mo if country == "USA", wald 
ci proportions help_getbed_3mo if country == "USA", wald 
ci proportions help_toilet_3mo if country == "USA", wald 

ci proportions help_meal_3mo if country == "USA", wald  
ci proportions help_shop_3mo if country == "USA", wald  
ci proportions help_phone_3mo if country == "USA", wald  
ci proportions help_medication_3mo if country == "USA", wald  