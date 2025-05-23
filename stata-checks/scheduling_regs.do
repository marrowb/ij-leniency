#delimit; 
version 14.0;
capture log close;
clear;
set more off; //allow log to be outputted without requiring keypresses;
set logtype text;
set linesize 120;

log using ij_assignment.log, replace; *start log file;
cd "/home/shuba/Desktop/sipa/a. cond-emp-res/dgp/";
pwd;

/*

import delimited hsg_scheduling_2022.csv;


reghdfe assigned caseload time_to_next no_cases, absorb(scheduled_month_year);


reghdfe assigned caseload time_to_next previously_assigned no_cases, absorb(scheduled_month_year);

reghdfe assigned caseload time_to_next previously_assigned length_of_proceedings no_cases, absorb(scheduled_month_year);

reghdfe assigned caseload time_to_next previously_assigned no_cases length_of_proceedings custody_d casepriority__uc family, absorb(scheduled_month_year);


clear;
*/
import delimited hsg_schedules_2022_2025.csv;


gen date_var = date(scheduled_date, "YMD");


gen month_year = mofd(date_var);


format month_year %tm;

reghdfe assigned caseload time_to_next previously_assigned no_cases, absorb(month_year);

reghdfe assigned caseload time_to_next previously_assigned length_of_proceedings no_cases, absorb(month_year);

reghdfe assigned caseload time_to_next previously_assigned no_cases length_of_proceedings custody_d casepriority__uc family, absorb(month_year);


reghdfe assigned caseload time_to_next no_cases lawyer, absorb(month_year);

reghdfe assigned caseload time_to_next no_cases lang_sp lang_eng, absorb(month_year);

reghdfe assigned caseload time_to_next no_cases nat_ve nat_mx nat_ho nat_es nat_cu, absorb(month_year);

log close;
