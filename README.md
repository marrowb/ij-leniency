# IJ Random Assignment
Probably best to start by reading the full paper: [IJ_Leniency_in_Asylum_Outcomes.pdf]("./IJ_Leniency_in_Asylum_Outcomes.pdf").

## Paper Summary
This research examines the randomness of immigration judge (IJ) assignment in US asylum cases and its impact on asylum outcomes. The study finds that while judge assignment is not purely random, it is systematically influenced by administrative factors related to caseload distribution. These scheduling controls significantly alter estimates of judge-specific leniency, suggesting that traditional assessments based solely on approval rates may mischaracterize judges as unusually strict or lenient. The research demonstrates that accounting for these administrative selection mechanisms is crucial for accurately evaluating judicial behavior in asylum adjudication.

## File Guide
- [IJ_Leniency_in_Asylum_Outcomes.pdf]("./IJ_Leniency_in_Asylum_Outcomes.pdf") - Full research paper
- [ data.zip ]("./data.zip") - Contains all datasets used in the analysis:
  - Scheduling records for Houston S. Gessner Court (2022-2025)
  - Asylum application decisions with scheduling controls for Houston, Boston, Chicago, and Miami courts
- [ figures/ ](./figures/) - Contains all visualizations used in the paper
- [ json/ ](./json/) - Reference data and lookup tables
- [ code_key.md ]("./code_key.md") - Full code key for the EOIR Database
- [Scheduling Dataset Generator]("./generate_scheduling_dataset.ipynb")
- [Application Dataset Generator]("./generate_asylum_application_data.ipynb")
- [Scheduling Regressions]("./scheduling_regressions.ipynb")
- [ stata-checks/ ]("./stata-checks/") - STATA code for validation checks. Application regressions are run in STATA.


# Data
There are two types of data schemas here. 
1. Scheduling records for Houston S. Gessner Court from February 11, 2022 through February 28, 2025.
2. Asylum application decisions with scheduling controls for decisions at Houston S. Gessner, Boston, Chicago, and Miami immigration courts.

A full code key for the EOIR Database can be found [here](./code_key.md).

## Scheduling Records
### Column Key

| Column Name             | Data Type | Description                                                                                                       |
| ----------------------- | --------- | ----------------------------------------------------------------------------------------------------------------- |
| (Unnamed)               | Integer   | Row index                                                                                                         |
| Unnamed: 0              | Integer   | Secondary row index                                                                                               |
| idnschedule             | Integer   | The primary key for tbl_schedule (Schedule Table Index)                                                           |
| idncase                 | Integer   | The primary key for A_tblCase (Case Table Index)                                                                  |
| idnproceeding           | Integer   | The primary key for B_tblProceeding (Proceeding Table Index)                                                      |
| assigned_judge          | String    | Name of the judge assigned to the case                                                                            |
| scheduled_date          | String    | The date of the scheduled hearing                                                                                 |
| scheduled_time          | String    | The time at which the scheduled hearing begins                                                                    |
| scheduled_datetime      | Date      | Combined date and time of scheduled hearing                                                                       |
| hearing_date            | String    | The date of the scheduled hearing (alternative format)                                                            |
| hearing_time            | String    | The time at which the scheduled hearing begins (alternative format)                                               |
| judge                   | String    | Alternative representation of judge name                                                                          |
| caseload                | Integer   | Number of cases assigned to the judge                                                                             |
| family_size             | Integer   | Number of people in the family case                                                                               |
| hearing_datetime        | Date      | Combined date and time of hearing                                                                                 |
| assigned_hearing        | Date      | Date when the hearing was assigned                                                                                |
| next_assigned_hearing   | Date      | Date of the judge's next assigned hearing                                                                         |
| time_to_next            | Float     | Time until next hearing                                                                                           |
| assigned                | Integer   | Binary indicator if case is assigned                                                                              |
| no_cases                | Integer   | Number of cases                                                                                                   |
| nat                     | String    | Nationality code representing the nationality of the immigrant                                                    |
| lang                    | String    | Code representing the primary language spoken by the immigrant                                                    |
| e_28_date               | Date      | The date the immigrant's attorney or representative filed the EOIR-28 form                                        |
| date_of_entry           | String    | Date the immigrant entered the United States                                                                      |
| c_birthdate             | String    | immigrant's birth month & year                                                                                    |
| gender                  | String    | Sex of the immigrant                                                                                              |
| lpr                     | String    | Indicates whether the immigrant is a lawful permanent resident                                                    |
| lawyer                  | Integer   | Binary indicator if immigrant has a lawyer                                                                        |
| osc_date                | String    | The date the Department of Homeland Security issued the charging document to the immigrant                        |
| casetype_AOC            | Integer   | Binary indicator for Asylum Only Case                                                                             |
| casetype_CFR            | Integer   | Binary indicator for Credible Fear Review                                                                         |
| casetype_DEP            | Integer   | Binary indicator for Deportation (legacy case)                                                                    |
| casetype_REC            | Integer   | Binary indicator for Recission                                                                                    |
| casetype_RFR            | Integer   | Binary indicator for Reasonable Fear Review                                                                       |
| casetype_RMV            | Integer   | Binary indicator for Removal proceedings                                                                          |
| casetype_WHO            | Integer   | Binary indicator for Withholding Only proceedings                                                                 |
| custody_D               | Integer   | Binary indicator for Detained custody status                                                                      |
| custody_N               | Integer   | Binary indicator for Never Detained custody status                                                                |
| custody_R               | Integer   | Binary indicator for Released custody status                                                                      |
| casepriority__UC        | Integer   | Binary indicator for case priority code unaccompanied minor                                                       |
| crim__N                 | Integer   | Binary indicator for non-criminal charge                                                                          |
| crim__Y                 | Integer   | Binary indicator for criminal charge (CRIM_IND field)                                                             |
| length_of_proceedings   | Integer   | Length of the case proceedings in days                                                                            |
| lang_AR                 | Integer   | Binary indicator for Arabic language                                                                              |
| lang_ENG                | Integer   | Binary indicator for English language                                                                             |
| lang_MAN                | Integer   | Binary indicator for Mandarin language                                                                            |
| lang_SP                 | Integer   | Binary indicator for Spanish language                                                                             |
| lang_TU                 | Integer   | Binary indicator for Turkish language                                                                             |
| lang_other              | Integer   | Binary indicator for other languages                                                                              |
| nat_CU                  | Integer   | Binary indicator for Cuban nationality                                                                            |
| nat_ES                  | Integer   | Binary indicator for El Salvadoran nationality                                                                    |
| nat_HO                  | Integer   | Binary indicator for Honduran nationality                                                                         |
| nat_MX                  | Integer   | Binary indicator for Mexican nationality                                                                          |
| nat_VE                  | Integer   | Binary indicator for Venezuelan nationality                                                                       |
| nat_other               | Integer   | Binary indicator for other nationalities                                                                          |
| previous_assigned_judge | String    | Judge code for the judge most recently assigned to an individual hearing at the court                             |
| previously_assigned     | Integer   | Binary indicator if judge assigned to current scheduling record is the same as the most recently assigned judge.  |
| family                  | Integer   | Binary indicator if case involves a family                                                                        |
| scheduled_year          | Integer   | Year component of scheduled hearing date                                                                          |
| scheduled_half_year     | String    | Half-year component of scheduled hearing date                                                                     |
| scheduled_quarter       | String    | Quarter component of scheduled hearing date                                                                       |
| scheduled_month_year    | String    | Month and year component of scheduled hearing date                                                                |

### Summary Statistics
|                       | count     | mean        | std         | min          | 25%         | 50%         | 75%         | max         |
| --------------------- | --------- | ----------- | ----------- | ------------ | ----------- | ----------- | ----------- | ----------- |
| caseload              | 343157.00 | 728.84      | 483.45      | 0.00         | 206.00      | 799.00      | 1088.00     | 1720.00     |
| family_size           | 343157.00 | 1.54        | 1.33        | 1.00         | 1.00        | 1.00        | 2.00        | 34.00       |
| time_to_next          | 343157.00 | 33226634.29 | 20493383.25 | -33536700.00 | 13982940.00 | 35695200.00 | 50087700.00 | 88211940.00 |
| assigned              | 343157.00 | 0.07        | 0.26        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| no_cases              | 343157.00 | 0.08        | 0.27        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| lawyer                | 343157.00 | 0.74        | 0.44        | 0.00         | 0.00        | 1.00        | 1.00        | 1.00        |
| casetype_AOC          | 343157.00 | 0.00        | 0.04        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casetype_CFR          | 343157.00 | 0.01        | 0.07        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casetype_DEP          | 343157.00 | 0.00        | 0.04        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casetype_REC          | 343157.00 | 0.00        | 0.01        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casetype_RFR          | 343157.00 | 0.00        | 0.02        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casetype_RMV          | 343157.00 | 0.99        | 0.12        | 0.00         | 1.00        | 1.00        | 1.00        | 1.00        |
| casetype_WHO          | 343157.00 | 0.00        | 0.07        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| custody_D             | 343157.00 | 0.01        | 0.10        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| custody_N             | 343157.00 | 0.72        | 0.45        | 0.00         | 0.00        | 1.00        | 1.00        | 1.00        |
| custody_R             | 343157.00 | 0.27        | 0.44        | 0.00         | 0.00        | 0.00        | 1.00        | 1.00        |
| casepriority__AWC/ATD | 343157.00 | 0.00        | 0.06        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casepriority__AWC/D   | 343157.00 | 0.00        | 0.01        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casepriority__CR      | 343157.00 | 0.00        | 0.05        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casepriority__RBC/D   | 343157.00 | 0.00        | 0.06        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| casepriority__UC      | 343157.00 | 0.03        | 0.16        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| crim__N               | 343157.00 | 0.98        | 0.15        | 0.00         | 1.00        | 1.00        | 1.00        | 1.00        |
| crim__Y               | 343157.00 | 0.01        | 0.10        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| length_of_proceedings | 343157.00 | 1047.70     | 1180.20     | 0.00         | 351.00      | 588.00      | 1247.00     | 13795.00    |
| lang_AR               | 343157.00 | 0.01        | 0.08        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| lang_ENG              | 343157.00 | 0.06        | 0.23        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| lang_MAN              | 343157.00 | 0.01        | 0.10        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| lang_SP               | 343157.00 | 0.86        | 0.34        | 0.00         | 1.00        | 1.00        | 1.00        | 1.00        |
| lang_TU               | 343157.00 | 0.01        | 0.09        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| lang_other            | 343157.00 | 0.06        | 0.23        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_CU                | 343157.00 | 0.16        | 0.37        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_ES                | 343157.00 | 0.12        | 0.32        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_HO                | 343157.00 | 0.15        | 0.36        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_MX                | 343157.00 | 0.09        | 0.28        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_VE                | 343157.00 | 0.19        | 0.39        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| nat_other             | 343157.00 | 0.29        | 0.45        | 0.00         | 0.00        | 0.00        | 1.00        | 1.00        |
| previously_assigned   | 343157.00 | 0.18        | 0.38        | 0.00         | 0.00        | 0.00        | 0.00        | 1.00        |
| family                | 343157.00 | 0.28        | 0.45        | 0.00         | 0.00        | 0.00        | 1.00        | 1.00        |
| scheduled_year        | 343157.00 | 2023.04     | 0.88        | 2022.00      | 2022.00     | 2023.00     | 2024.00     | 2025.00     |

## Asylum Application Decisions

### Column Key

| Column Name           | Data Type | Description                                                                                                                      |
| --------------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------- |
| (Unnamed)             | Integer   | Row index                                                                                                                        |
| idncase               | Integer   | The primary key for A_tblCase (Case Table Index)                                                                                 |
| idnproceeding         | Integer   | The primary key for B_tblProceeding (Proceeding Table Index)                                                                     |
| appl_dec              | String    | The code that represents the immigration judge's decision on the application for relief (Court Application IJ Decision)          |
| ij_code               | String    | The code that represents the immigration judge assigned to the case                                                              |
| hearing_date          | String    | The date of the scheduled hearing                                                                                                |
| hearing_time          | String    | The time at which the scheduled hearing begins                                                                                   |
| idnschedule           | Integer   | The primary key for tbl_schedule (Schedule Table Index)                                                                          |
| caseload              | Integer   | The number of cases on the judge's docket at the time of scheduling.                                                             |
| time_to_next          | Float     | The time in dauy from the current scheduling records scheduling date and time and the judge's next available hearing date        |
| no_cases              | Float     | A dummy variable indicator for whether the judge is active at the immigration court or not at the time of the scheduling record. |
| previously_assigned   | Float     | A dummy variable indicating whether the judge was assigned to the most recent individual hearing scheduled at the court.         |
| length_of_proceedings | Integer   | Time in days between the scheduling date and time and the date the case was docketed at the court.                               |
| asylum_granted        | Float     | A binary variable equal to 1 if asylum was granted                                                                               |
| year                  | Integer   | Year component of the hearing date                                                                                               |
| quarter               | Integer   | Quarter component of the hearing date                                                                                            |
| year_quarter          | String    | Combined year and quarter                                                                                                        |
| month                 | Integer   | Month component of the hearing date                                                                                              |
| year_month            | String    | Combined year and month                                                                                                          |
### Summary Statistics


|       | caseload    | time_to_next | no_cases    | previously_assigned |
| ----- | ----------- | ------------ | ----------- | ------------------- |
| count | 2167.000000 | 2167.000000  | 2167.000000 | 2167.000000         |
| mean  | 744.592063  | 2.308277     | 0.000923    | 0.458699            |
| std   | 330.955130  | 54.940116    | 0.030373    | 0.498406            |
| min   | 0.000000    | 0.000694     | 0.000000    | 0.000000            |
| 25%   | 579.500000  | 0.002778     | 0.000000    | 0.000000            |
| 50%   | 782.000000  | 0.009028     | 0.000000    | 0.000000            |
| 75%   | 978.500000  | 0.061458     | 0.000000    | 1.000000            |
| max   | 2406.000000 | 1888.922917  | 1.000000    | 1.000000            |


|       | length_of_proceedings | asylum_granted | year        | quarter     | month       |
| ----- | --------------------- | -------------- | ----------- | ----------- | ----------- |
| count | 2167.000000           | 2167.000000    | 2167.000000 | 2167.000000 | 2167.000000 |
| mean  | 869.543147            | 0.073373       | 2020.541763 | 2.316567    | 5.990771    |
| std   | 870.646337            | 0.260808       | 2.626659    | 1.088604    | 3.310900    |
| min   | 0.000000              | 0.000000       | 2009.000000 | 1.000000    | 1.000000    |
| 25%   | 349.000000            | 0.000000       | 2019.000000 | 1.000000    | 3.000000    |
| 50%   | 551.000000            | 0.000000       | 2022.000000 | 2.000000    | 6.000000    |
| 75%   | 1040.000000           | 0.000000       | 2022.000000 | 3.000000    | 9.000000    |
| max   | 9137.000000           | 1.000000       | 2025.000000 | 4.000000    | 12.000000   |

