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

import delimited MIA_fe_ready.csv;
duplicates drop hearing_date hearing_time ij_code, force;

keep if ij_code == "CPN" | ij_code == "RTK" | ij_code == "MNN" | ///
       ij_code == "JDD" | ij_code == "TSA" | ij_code == "MCH" | ///
       ij_code == "MGM" | ij_code == "MAU" | ij_code == "SEM" | ///
       ij_code == "LTB" | ij_code == "CRE" | ij_code == "RSO" | ///
       ij_code == "DRH" | ij_code == "RDM" | ij_code == "DML" | ///
       ij_code == "MCA" | ij_code == "LIH" | ij_code == "AEM" | ///
       ij_code == "LRJ" | ij_code == "IRO" | ij_code == "ALB" | ///
       ij_code == "MKN" | ij_code == "JEB" | ij_code == "LME" | ///
       ij_code == "JRA" | ij_code == "MWA" | ij_code == "SGA";
       
reghdfe asylum_grant, absorb(year_month ij_fe_simple=ij_code);
summarize ij_fe_simple;


reghdfe asylum_grant caseload time_to_next no_cases, absorb(year_month ij_fe_controls=ij_code);summarize ij_fe_controls;

graph twoway (scatter ij_fe_controls ij_fe_simple,
            msymbol(Oh) msize(small) mcolor(blue%50)
            title("IJ Fixed Effects (FEs) Estimates - Miami")
            xtitle("IJ FEs (IJ + time)")
            ytitle("IJ FEs (IJ & Time; Scheduling Controls)")
            legend(label(1 "Estimates") order(1 2)) 
       )
       (function y=x, range(ij_fe_simple)
            lcolor(black) lpattern(dash) lwidth(thin)
            yvarlab("45-degree line (y=x)")
       ) 
       , scheme(s1color);
       
graph export fe_comparison_MIA.png, replace;


log close;
