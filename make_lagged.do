clear
set more off

*GTD monthly casualty data (all terrorism)
use gtd_cas_month.dta, clear

*lag by one month
replace month = month + 1

*save
save gtd_cas_month_lagged.dta

*GTD yearly casualty data (all terrorism)
use gtd_cas_year.dta, clear

*lag by one year
replace year = year + 1

save gtd_cas_year_lagged.dta

*SAD monthly casualty data (suicide terrorism)
use suicide_cas_month.dta, clear

replace month = month + 1

save suicide_cas_month_lagged.dta

*SAD yearly casualty data (suicide terrorism)
use suicide_cas_year.dta, clear

replace year = year + 1

save suicide_cas_year_lagged.dta
