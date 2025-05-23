#delimit; 
version 14.0;
capture log close;
clear;
set more off; //allow log to be outputted without requiring keypresses;
set logtype text;
set linesize 120;

log using stata1.log, replace; *start log file;
cd "/home/shuba/Desktop/sipa/a. cond-emp-res/dgp/";
pwd;

import delimited ready_for_fe.csv;
duplicates drop hearing_date hearing_time ij_code, force;

reghdfe asylum_grant, absorb(year_month ij_fe_simple=ij_code);
summarize ij_fe_simple;


reghdfe asylum_grant caseload time_to_next no_cases, absorb(year_month ij_fe_controls=ij_code);summarize ij_fe_controls;

graph twoway (scatter ij_fe_controls ij_fe_simple,
            msymbol(Oh) msize(small) mcolor(blue%50)
            title("IJ Fixed Effects (FEs) Estimates - Houston S. Gessner")
            xtitle("IJ FEs (IJ + time)")
            ytitle("IJ FEs (IJ & Time; Scheduling Controls)")
            legend(label(1 "Estimates") order(1 2)) 
       )
       (function y=x, range(ij_fe_simple)
            lcolor(black) lpattern(dash) lwidth(thin)
            yvarlab("45-degree line (y=x)")
       ) 
       , scheme(s1color);
       
graph export fe_comparison_HSG.png, replace;




tab ij_code, gen(judge_);


desc judge_*;


reghdfe asylum_grant judge_2-judge_15, absorb(year_month);

reghdfe asylum_grant judge_*, nocons absorb(year_month);

summarize ij_fe_simple;

log close;
