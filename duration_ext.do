***************
*All terrorism*
***************
clear
set more off

*load duration data
use duration_main.dta

*merge with monthly terrorism casualties data
joinby year month cowcode using gtd_cas_month.dta, unmatched(master)

*replace missing values with 0 (assume no casualties) (log(0 + 1) = 0)
replace lnterr_civcas_month = 0 if missing(lnterr_civcas_month)
replace lnterr_totcas_month = 0 if missing(lnterr_totcas_month)

*Set the data for survival analysis
stset warmonths, id(warnumber) f(warend)

* Model 2
streg smterrorwarrelated logpop elf  lngdp uppsalaMaxed logbattledeaths mountains guarantee lnterr_civcas_month, dist(lognormal) nolog robust
streg smterrorwarrelated logpop elf  lngdp uppsalaMaxed logbattledeaths mountains guarantee lnterr_totcas_month, dist(lognormal) nolog robust

*******************
*Suicide terrorism*
*******************
clear
set more off

use duration_main.dta

joinby year month cowcode using suicide_cas_month.dta, unmatched(master)

replace lnsui_civcas_month = 0 if missing(lnsui_civcas_month)
replace lnsui_totcas_month = 0 if missing(lnsui_totcas_month)

stset warmonths, id(warnumber) f(warend)

streg smterrorwarrelated logpop elf  lngdp uppsalaMaxed logbattledeaths mountains guarantee lnsui_civcas_month, dist(lognormal) nolog robust
streg smterrorwarrelated logpop elf  lngdp uppsalaMaxed logbattledeaths mountains guarantee lnsui_totcas_month, dist(lognormal) nolog robust
