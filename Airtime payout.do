clear
use "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS/YEP BDS AND GRANT_BL.dta"


	//gen airtime payment dates)
		gen survey_date = dofc(submissiondate)
				format  survey_date %td
				la var survey_date "Date of interview submission - Short date"
				keep  if survey_date>date("05/03/2020", "DMY") & survey_date<date("07/03/2020", "DMY")			
				
keep sec6_pri_phon accgift accgiftnum accgiftnumnewcon accgiftnumnew resp_id2 youthname giftnumcomp submissiondate survey_date sec1b_studyconsent sec7_interv_status sec7_interv_status_oth

drop if sec1b_studyconsent!=1 | sec7_interv_status !=1

gen final_giftnumber=sec6_pri_phon if accgiftnum==1

replace final_giftnumber=accgiftnumnew if accgiftnum==0

//save "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS\Airtime_payout/Airtime_payout_$S_DATE.dta", replace

export delimited "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS\Airtime_payout/BDS_Airtime_payout_$S_DATE.csv", replace

//backcheck
clear 

use "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS/BACKCHECK_YEP BDS AND GRANT_BL.dta"

	//gen airtime payment dates)
		gen survey_date = dofc(submissiondate)
				format  survey_date %td
				la var survey_date "Date of interview submission - Short date"
				keep  if survey_date>date("05/03/2020", "DMY") & survey_date<date("07/03/2020", "DMY")			
			
keep sec6_pri_phon accgiftnum accgiftnumnewcon accgiftnumnew resp_id2 youthname giftnumcomp submissiondate survey_date sec1b_studyconsent sec7_interv_status sec7_interv_status_oth

drop if sec1b_studyconsent!=1 | sec7_interv_status !=1

gen final_giftnumber=sec6_pri_phon if accgiftnum==1

replace final_giftnumber=accgiftnumnew if accgiftnum==0

//save "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS\Airtime_payout/Backcheck_Airtime_payout_$S_DATE.dta", replace

export delimited "X:\Box Sync\IPA_KEN_Projects\IPA_KEN_KYEOP_20095AA\07&08 Questionnaires & Data\02 Baseline [2020]\05_data\02_survey\1_BDS\Airtime_payout/BDS_Backcheck_Airtime_payout_$S_DATE.csv", replace


