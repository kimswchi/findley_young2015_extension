************************************************************************
* Replication Materials for JOP paper: Recurrence of War models        *
* "Spoilers, Terrorism, and the Resolution of Civil Wars"              *
* Date: 5/18/15														   *
* Authors: Michael G. Findley and Joseph K. Young                      * 
************************************************************************

***************
*All terrorism*
***************
clear
set more off

*Recurrence data
use recurrence_main.dta, clear

*merge with yearly terrorism casualties data
joinby year cowcode using gtd_cas_year_lagged.dta, unmatched(master)

*replace missing values with 0 (assuming no casualties) (log (0 + 1) = 0)
replace lnterr_civcas_year = 0 if missing(lnterr_civcas_year)
replace lnterr_totcas_year = 0 if missing(lnterr_totcas_year)

*Set the data for survival analysis
stset pdur, id(warnumb) f(pcens)

*Model 4
streg smterrorWarRelated lpopns ethfrac ln_gdpen inst2 regd4 absent lnterr_civcas_year, dist(lognormal) nolog robust
streg smterrorWarRelated lpopns ethfrac ln_gdpen inst2 regd4 absent lnterr_totcas_year, dist(lognormal) nolog robust

*******************
*Suicide terrorism*
*******************

clear
set more off

use recurrence_main.dta, clear

joinby year cowcode using suicide_cas_year_lagged.dta, unmatched(master)

replace lnsui_civcas_year = 0 if missing(lnsui_civcas_year)
replace lnsui_totcas_year = 0 if missing(lnsui_totcas_year)

stset pdur, id(warnumb) f(pcens)

streg smterrorWarRelated lpopns ethfrac ln_gdpen inst2 regd4 absent lnsui_civcas_year, dist(lognormal) nolog robust
streg smterrorWarRelated lpopns ethfrac ln_gdpen inst2 regd4 absent lnsui_totcas_year, dist(lognormal) nolog robust
