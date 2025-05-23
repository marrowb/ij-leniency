# Table of Tables
- [[#Case Table Column Descriptions|Case Table]] - Core information about immigration cases including alien details, case status, and locations
- [[#Proceeding Table Column Descriptions|Proceeding Table]] - Records of individual immigration court proceedings and their outcomes
- [[#Application Table Column Descriptions|Application Table]] - Applications for various forms of immigration relief
- [[#Motion Table Column Descriptions|Motion Table]] - Legal motions filed during proceedings
- [[#Appeal Table Column Descriptions|Appeal Table]] - Appeals of immigration judge decisions to the Board of Immigration Appeals
- [[#Bond Table Column Descriptions|Bond Table]] - Bond hearings and custody determinations
- [[#Charges Table Column Descriptions|Charges Table]] - Immigration law violations alleged against aliens
- [[#Schedule Table Column Descriptions|Schedule Table]] - Court hearing schedules and logistics
- [[#Representatives Table Column Descriptions|Representatives Table]] - Attorney and legal representative information
- [[#Juvenile Table Column Descriptions|Juvenile Table]] - Cases involving minor respondents
- [[#Rider Table Column Descriptions|Rider Table]] - Links between related cases
- [[#Case ID Table Column Descriptions|Case ID Table]] - Case identification tracking
- [[#Case Priority Table Column Descriptions|Case Priority Table]] - Case prioritization history
- [[#Attorney Table Column Descriptions|Attorney Table]] - Attorney registration and status
- [[#Federal Courts Table Column Descriptions|Federal Courts Table]] - Appeals to federal courts
- [[#Three Member Board Table Column Descriptions|Three Member Board Table]] - Cases referred to three-member BIA panels
- [[#Custody Table Column Descriptions|Custody Table]] - Detention and custody status history
- [[#Pro Bono Table Column Descriptions|Pro Bono Table]] - Pro bono representation program cases
#  Case Table Column Descriptions

| Column Name             | Description                                                                               |
| ----------------------- | ----------------------------------------------------------------------------------------- |
| idncase                 | The primary key/unique identifier for each case record                                    |
| alien_city              | City from the alien's address                                                             |
| alien_state             | State from the alien's address                                                            |
| alien_zipcode           | Zip code from the alien's address                                                         |
| updated_zipcode         | Previous zip code of alien address, used as part of historical address information        |
| updated_city            | Previous city of alien address, used as part of historical address information            |
| nat                     | Code representing the nationality of the alien                                            |
| lang                    | Code representing the primary language spoken by the alien                                |
| custody                 | Code representing the custody status of the alien (Detained, Released, or Never Detained) |
| site_type               | Code indicating whether hearing notice was issued in-person or mailed to the alien        |
| e_28_date               | Date the Form EOIR-28 (Notice of Entry of Appearance) was filed                           |
| atty_nbr                | Legacy field referring to assigned attorney information                                   |
| case_type               | Code representing the type of case (e.g., Removal, Deportation, etc.)                     |
| updated_site            | The current base city code having jurisdiction over the case                              |
| latest_hearing          | Date of most recent hearing appearance before the immigration judge                       |
| latest_time             | Time of the most recent scheduled hearing                                                 |
| latest_cal_type         | Type of hearing for the most recent scheduled hearing (Individual or Master)              |
| up_bond_date            | Call-up date for bond hearing                                                             |
| up_bond_rsn             | Legacy field for bond call-up reason                                                      |
| correctional_fac        | Code representing the type of correctional facility                                       |
| release_month           | Legacy field for Expected Prison Release Date month                                       |
| release_year            | Legacy field for Expected Prison Release Date year                                        |
| inmate_housing          | Code representing the housing location of an alien                                        |
| date_of_entry           | Date the alien entered the United States                                                  |
| c_asy_type              | Indicates whether clock was started by DHS or EOIR                                        |
| c_birthdate             | Date of birth of the alien                                                                |
| c_release_date          | Expected earliest possible release date from detention                                    |
| updated_state           | Previous state from alien's address used for historical records                           |
| address_changedon       | Date when the alien's address was updated                                                 |
| zbond_mrg_flag          | Bond merger flag indicator                                                                |
| gender                  | Sex of the alien                                                                          |
| date_detained           | Date the alien was detained                                                               |
| date_released           | Date the alien was released from detention                                                |
| lpr                     | Indicates whether the alien is a lawful permanent resident                                |
| detention_date          | Date alien entered current detention facility                                             |
| detention_location      | Name of the DHS Detention Facility                                                        |
| dco_location            | Location of the DHS Detention Facility                                                    |
| detention_facility_type | The type of detention facility                                                            |
| casepriority_code       | Code representing the case priority                                                       |
# Proceeding Table Column Descriptions

| Column Name            | Description                                                                   |
| ---------------------- | ----------------------------------------------------------------------------- |
| idnproceeding          | The primary key/unique identifier for each proceeding record                  |
| idncase                | Foreign key reference to the case table                                       |
| osc_date               | Date the charging document (Notice to Appear) was issued by DHS               |
| input_date             | Date proceeding was received by court or automatically created                |
| base_city_code         | Code representing the immigration court with jurisdiction                     |
| hearing_loc_code       | Code representing the assigned location of the last scheduled hearing         |
| ij_code                | Code representing the immigration judge assigned to the case                  |
| transfer_date          | Date case was received at new hearing location after change of venue/transfer |
| prev_hearing_loc       | Code for previous hearing location if case was transferred                    |
| prev_hearing_base      | Code for previous base city if case was transferred                           |
| prev_ij_code           | Code for previous immigration judge if case was transferred                   |
| trans_nbr              | Number of times case has been transferred or changed venue                    |
| hearing_date           | Initial/first hearing date on a proceeding                                    |
| hearing_time           | Time of initial/first hearing                                                 |
| dec_type               | Method by which immigration judge decision was rendered (Oral/Written)        |
| dec_code               | Code representing the immigration judge's decision                            |
| dep1                   | Immigration judge's first choice country for removal                          |
| dep2                   | Immigration judge's second choice country for removal                         |
| other_comp             | Code representing administrative decision of immigration judge                |
| appeal_rsvd            | Indicates whether appeal to BIA has been reserved and by whom                 |
| appeal_not_filed       | Legacy field - no longer used                                                 |
| comp_date              | Date immigration judge rendered decision on proceeding                        |
| absentia               | Indicates whether alien failed to appear as scheduled                         |
| venue_chg_granted      | Date immigration judge granted change of venue                                |
| transfer_to            | Code for hearing location where case was transferred                          |
| date_appeal_due_status | Due date for appeal to Board of Immigration Appeals                           |
| transfer_status        | Code for last type of completion (change of venue/transfer)                   |
| custody                | Code representing alien's custody status                                      |
| casetype               | Code identifying type of immigration proceeding                               |
| nat                    | Code representing alien's nationality                                         |
| lang                   | Code representing alien's primary language                                    |
| scheduled_hear_loc     | Code for hearing location of latest scheduled hearing                         |
| correctional_fac       | Code representing type of correctional facility                               |
| crim_ind               | Indicates whether charge is criminal                                          |
| ihp                    | Code for type of correctional facility (Institutional Hearing Program)        |
| aggravate_felon        | Indicates if charge is classified as aggravated felony                        |
| date_detained          | Date alien was detained                                                       |
| date_released          | Date alien was released                                                       |
#  Application Table Column Descriptions

| Column Name        | Description                                                                                        |
| ------------------ | -------------------------------------------------------------------------------------------------- |
| IDNPROCEEDINGAPPLN | Primary key/unique identifier for each application record                                          |
| IDNPROCEEDING      | Foreign key reference to the proceeding table                                                      |
| IDNCASE            | Foreign key reference to the case table                                                            |
| APPL_CODE          | Code representing the type of application for relief filed (e.g., Asylum, Cancellation of Removal) |
| APPL_RECD_DATE     | Date the application for relief was received by the court                                          |
| APPL_DEC           | Code representing the immigration judge's decision on the application                              |
#  Motion Table Column Descriptions

| Column Name          | Description                                                     |
| -------------------- | --------------------------------------------------------------- |
| IDNMOTION            | Primary key/unique identifier for each motion record            |
| IDNPROCEEDING        | Foreign key reference to the proceeding table                   |
| IDNCASE              | Foreign key reference to the case table                         |
| OSC_DATE             | Date the charging document was issued by DHS                    |
| REC_TYPE             | Code representing the type of motion before the court           |
| GENERATION           | Reference to proceeding generation                              |
| SUB_GENERATION       | Distinguishes between multiple records for same proceeding      |
| UPDATE_DATE          | Date the motion record was last updated                         |
| UPDATE_TIME          | Time the motion was last updated                                |
| INPUT_DATE           | Date the motion was entered by the court                        |
| INPUT_TIME           | Time the motion was entered by the court                        |
| REJ                  | Legacy field - no longer used                                   |
| BASE_CITY_CODE       | Code for immigration court having jurisdiction                  |
| HEARING_LOC_CODE     | Code for court having jurisdiction over motion                  |
| IJ_CODE              | Legacy field - no longer used                                   |
| IJ_NAME              | Legacy field - no longer used                                   |
| DEC                  | Code representing judge's decision on motion                    |
| COMP_DATE            | Date of judge's decision on motion                              |
| MOTION_RECD_DATE     | Date court received the motion                                  |
| DATMOTIONDUE         | Date motion is due to court                                     |
| WU_MSG               | Legacy field - no longer used                                   |
| APPEAL_RSVD          | Indicates if BIA appeal was reserved and by whom                |
| APPEAL_NOT_FILED     | Legacy field - no longer used                                   |
| RESP_DUE_DATE        | Date response to motion is due                                  |
| STAY_GRANT           | Indicates if Motion for Stay was granted/denied                 |
| JURISDICTION         | Legacy field - no longer used                                   |
| DATE_APPEAL_DUE      | Due date for motion appeal to BIA                               |
| DATE_TO_BIA          | Legacy field - no longer used                                   |
| DECISION_RENDERED    | Date motion was decided                                         |
| DATE_MAILED_TO_IJ    | Legacy field - no longer used                                   |
| DATE_RECD_FROM_BIA   | Legacy field - no longer used                                   |
| DATE_TO_BIA_UPDATE   | Legacy field for BIA update                                     |
| STRFILINGPARTY       | Code representing party who filed motion                        |
| STRFILINGMETHOD      | Code representing method of motion filing                       |
| STRCERTOFSERVICECODE | Code representing certificate of service for motion             |
| E_28_RECPTFLAG       | Refers to Form EOIR-28 receipt                                  |
| E_28_DATE            | Date Form EOIR-28 filed                                         |
| O_CLOCK_OPTION       | Clock option for asylum cases                                   |
| SCHEDULED_HEAR_LOC   | Code for hearing location of latest scheduled hearing           |
| BLNDELETED           | Indicates if motion was deleted                                 |
| strDJScenario        | Code indicating jurisdiction shift reason between court and BIA |
#  Appeal Table Column Descriptions

| Column Name        | Description                                                   |
| ------------------ | ------------------------------------------------------------- |
| idnAppeal          | Primary key/unique identifier for each appeal record          |
| idncase            | Foreign key reference to the case table                       |
| idnProceeding      | Foreign key reference to the proceeding table                 |
| strAppealCategory  | Identifies case origin (IJ, DHS Officer Decision, Manual)     |
| strAppealType      | Identifies type of appeal/motion filed with BIA               |
| datAppealFiled     | Date appeal/motion was filed with BIA                         |
| strFiledBy         | Indicates which party filed the appeal/motion                 |
| datAttorneyE27     | Date attorney submitted EOIR-27 to BIA                        |
| datBIADecision     | Date BIA made decision on appeal/motion                       |
| strBIADecision     | Code representing BIA's overall decision                      |
| strBIADecisionType | Indicates decision type by BIA (e.g., Percuriam/Regular Case) |
| strCaseType        | Type of case                                                  |
| strLang            | Code representing alien's primary language                    |
| strNat             | Code representing alien's nationality                         |
| strProceedingIHP   | Code for type of correctional facility                        |
| strCustody         | Code representing alien's custody status                      |
| strProbono         | Indicates if case is part of EOIR Pro Bono Program            |
# Bond Table Column Descriptions

| Column Name             | Description                                                |
| ----------------------- | ---------------------------------------------------------- |
| IDNASSOCBOND            | Primary key/unique identifier for each bond record         |
| IDNPROCEEDING           | Foreign key reference to the proceeding table              |
| IDNCASE                 | Foreign key reference to the case table                    |
| OSC_DATE                | Date charging document issued by DHS                       |
| REC_TYPE                | Code identifying record type as bond or motion             |
| GENERATION              | Reference to proceeding generation                         |
| SUB_GENERATION          | Distinguishes between multiple bond records for proceeding |
| UPDATE_DATE             | Date bond record was last updated                          |
| UPDATE_TIME             | Time bond record was last updated                          |
| INPUT_DATE              | Date bond was entered by immigration court                 |
| INPUT_TIME              | Time bond was entered by immigration court                 |
| REJ                     | Legacy field - no longer used                              |
| BASE_CITY_CODE          | Code for immigration court having jurisdiction             |
| BASE_CITY_NAME          | Legacy field - no longer used                              |
| HEARING_LOC_CODE        | Code for assigned hearing location                         |
| IJ_CODE                 | Code for immigration judge                                 |
| IJ_NAME                 | Legacy field - no longer used                              |
| DEC                     | Code representing judge's decision on bond                 |
| COMP_DATE               | Date of judge's decision on bond                           |
| INITIAL_BOND            | Amount of bond initially set by DHS                        |
| REL_CON                 | Indicates if release conditions changed after decision     |
| INS_TA                  | DHS Trial Attorney information                             |
| BOND_HEARING_TELEPHONIC | Type of hearing medium                                     |
| SEND_MSG_WU             | Notice code                                                |
| BOND_HEAR_REQ_DATE      | Date bond hearing was requested                            |
| BOND_HEARING_DATE       | Date of initial bond hearing                               |
| BOND_HEARING_TIME       | Time of initial bond hearing                               |
| ADJ1_CAL_TYPE           | Calendar type for first adjourned hearing                  |
| ADJ1_DATE               | Date of first adjourned hearing                            |
| ADJ1_TIME               | Time of first adjourned hearing                            |
| ADJ1_RSN                | Reason for first adjournment                               |
| ADJ1_TELEPHONIC         | Medium for first adjourned hearing                         |
| ADJ1_MSG                | Notice for first adjourned hearing                         |
| ADJ2_CAL_TYPE           | Calendar type for second adjourned hearing                 |
| ADJ2_DATE               | Date of second adjourned hearing                           |
| ADJ2_TIME               | Time of second adjourned hearing                           |
| ADJ2_RSN                | Reason for second adjournment                              |
| ADJ2_TELEPHONIC         | Medium for second adjourned hearing                        |
| ADJ2_MSG                | Notice for second adjourned hearing                        |
| NEW_BOND                | New bond amount set by judge                               |
| APPEAL_REVD             | Indicates if appeal to BIA reserved and by whom            |
| APPEAL_NOT_FILED        | Legacy field - no longer used                              |
| DATE_APPEAL_DUE         | Due date for bond appeal to BIA                            |
| E_28_DATE               | Date Form EOIR-28 filed                                    |
| SCHEDULED_HEAR_LOC      | Code for location of latest scheduled bond hearing         |
| BOND_TYPE               | Code representing type of bond                             |
| FILING_METHOD           | Method of bond request                                     |
| FILING_PARTY            | Party who requested the bond                               |
| DECISION_DUE_DATE       | Date bond decision is due                                  |
# Charges Table Column Descriptions

| Column Name   | Description                                                    |
| ------------- | -------------------------------------------------------------- |
| IDNPRCDCHG    | Primary key/unique identifier for each charge record           |
| IDNCASE       | Foreign key reference to the case table                        |
| IDNPROCEEDING | Foreign key reference to the proceeding table                  |
| CHARGE        | Code representing the regulation or statute allegedly violated |
| CHG_STATUS    | Decision/finding on the charge                                 |
# Schedule Table Column Descriptions

| Column Name      | Description                                            |
| ---------------- | ------------------------------------------------------ |
| IDNSCHEDULE      | Primary key/unique identifier for each schedule record |
| IDNPROCEEDING    | Foreign key reference to the proceeding table          |
| IDNCASE          | Foreign key reference to the case table                |
| OSC_DATE         | Date charging document was issued by DHS               |
| GENERATION       | Reference to proceeding generation                     |
| SUB_GENERATION   | Distinguishes between multiple records for proceeding  |
| REC_TYPE         | Code identifying scheduled hearing record type         |
| LANG             | Code representing alien's primary language             |
| HEARING_LOC_CODE | Code for assigned hearing location                     |
| BASE_CITY_CODE   | Code for court having jurisdiction                     |
| IJ_CODE          | Code for immigration judge assigned to case            |
| INTERPRETER_CODE | Code for interpreter assigned to hearing               |
| INPUT_DATE       | Date schedule record was created                       |
| INPUT_TIME       | Time schedule record was created                       |
| UPDATE_DATE      | Date schedule record was last updated                  |
| UPDATE_TIME      | Time schedule record was last updated                  |
| ASSIGNMENT_PATH  | Method by which hearing was scheduled                  |
| CAL_TYPE         | Code for type of hearing scheduled                     |
| ADJ_DATE         | Date of scheduled hearing                              |
| ADJ_TIME_START   | Time scheduled hearing begins                          |
| ADJ_TIME_STOP    | Time scheduled hearing ends                            |
| ADJ_RSN          | Code for reason hearing was adjourned                  |
| ADJ_MEDIUM       | Code for mode of hearing (in-person/telephonic/VTC)    |
| ADJ_MSG          | Code for hearing notice printed                        |
| ADJ_ELAP_DAYS    | Days elapsed since asylum application if clock running |
| LNGSESSNID       | Primary key for session data table                     |
| SCHEDULE_TYPE    | Code for schedule type of hearing                      |
| NOTICE_CODE      | Code for hearing notice type                           |
| BLNCLOCKOVERRIDE | Indicates if asylum clock action was overridden        |
| EOIRAttorneyID   | Reference to attorney/representative record            |
#  Representatives Table Column Descriptions

| Column Name          | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| IDNREPSASSIGNED      | Primary key/unique identifier for each representation record |
| IDNCASE              | Foreign key reference to the case table                      |
| STRATTYLEVEL         | Indicates if representation is at court or BIA level         |
| STRATTYTYPE          | Indicates if representing alien or DHS                       |
| PARENT_TABLE         | Indicates parent table of the attorney/rep record            |
| PARENT_IDN           | Primary key for associated parent table                      |
| BASE_CITY_CODE       | Code for immigration court having jurisdiction               |
| INS_TA_DATE_ASSIGNED | Date DHS attorney was assigned                               |
| E_27_DATE            | Date alien's attorney filed EOIR-27 form at BIA              |
| E_28_DATE            | Date alien's attorney filed EOIR-28 form at court            |
| BLNPRIMEATTY         | Indicates if attorney/rep is the primary representative      |
# Juvenile Table Column Descriptions

| Column Name        | Description                                       |
| ------------------ | ------------------------------------------------- |
| idnJuvenileHistory | Primary key/unique identifier for juvenile record |
| idnCase            | Foreign key reference to the case table           |
| idnProceeding      | Foreign key reference to the proceeding table     |
| idnJuvenile        | Reference to juvenile lookup table                |
| DATCREATEDON       | Date juvenile record was created                  |
| DATMODIFIEDON      | Date juvenile record was last modified            |
# Rider Table Column Descriptions

| Column Name             | Description                                         |
| ----------------------- | --------------------------------------------------- |
| idnLeadRider            | Primary key/unique identifier for each rider record |
| idnLeadCase             | Foreign key reference to the lead case              |
| idnRiderCase            | Foreign key reference to the rider case             |
| datCreatedOn            | Date rider relationship was created                 |
| datModifiedOn           | Date rider record was modified                      |
| datSeveredOn            | Date rider case was severed from lead case          |
| idnLeadProceedingStart  | Proceeding ID of lead case when rider added         |
| idnLeadProceedingEnd    | Proceeding ID of lead case when rider severed       |
| idnRiderProceedingStart | Proceeding ID of rider case when added              |
| idnRiderProceedingEnd   | Proceeding ID of rider case when severed            |
| blnActive               | Indicates if rider relationship is active           |
# Case ID Table Column Descriptions

| Column Name | Description                                              |
| ----------- | -------------------------------------------------------- |
| IDNCASEID   | Primary key/unique identifier for case identifier record |
| IDNCASE     | Foreign key reference to the case table                  |
| CASE_ID     | Code that represents the case identifier                 |

# Case Priority Table Column Descriptions

| Column Name       | Description                                                    |
| ----------------- | -------------------------------------------------------------- |
| idnCasePriHistory | Primary key/unique identifier for case priority history record |
| casePriority_code | Code representing the type of case priority                    |
| idnCase           | Foreign key reference to the case table                        |
| DATCREATEDON      | Date case priority record was created                          |
| DATMODIFIEDON     | Date case priority record was last modified                    |

# Attorney Table Column Descriptions

| Column Name       | Description                                        |
| ----------------- | -------------------------------------------------- |
| EOIRAttorneyID    | Primary key/unique identifier for attorney record  |
| OldAttorneyID     | Previous attorney table index from legacy system   |
| BaseCityCode      | Code for court having jurisdiction                 |
| blnAttorneyActive | Indicates if attorney/rep record is active         |
| Source_Flag       | Indicates if record originated from court or board |
| datCreatedOn      | Date attorney record was created                   |
| datModifiedOn     | Date attorney record was last modified             |

#  Federal Courts Table Column Descriptions

| Column Name         | Description                                                               |
| ------------------- | ------------------------------------------------------------------------- |
| idnAppealFedCourts  | Primary key/unique identifier for federal court appeal                    |
| lngAppealID         | Foreign key reference to the appeal table                                 |
| datRequestedByOIL   | Date certification request received from Office of Immigration Litigation |
| strFedCourtDecision | Case number assigned to federal court case                                |

#  Three Member Board Table Column Descriptions

| Column Name            | Description                                             |
| ---------------------- | ------------------------------------------------------- |
| idn3MemberReferral     | Primary key/unique identifier for three-member referral |
| lngAppealID            | Foreign key reference to the appeal table               |
| datReferredTo3Member   | Date case file referred to three-member panel           |
| datRemovedFromReferral | Date case removed from three-member referral            |
#  Custody Table Column Descriptions

| Column Name | Description                                                           |
| ----------- | --------------------------------------------------------------------- |
| IDNCUSTODY  | Primary key/unique identifier for custody record                      |
| IDNCASE     | Foreign key reference to the case table                               |
| CUSTODY     | Code representing custody status of alien                             |
| CHARGE      | Date alien was detained (Note: Column name may be misnamed in schema) |
| CHG_STATUS  | Date alien was released (Note: Column name may be misnamed in schema) |

# Pro Bono Table Column Descriptions

## Case Type and Decision Fields

| Column Name   | Description                                            |
| ------------- | ------------------------------------------------------ |
| Case_type     | Type of immigration proceeding                         |
| DEC_212C      | Decision on waiver of inadmissibility under INA 212(c) |
| DEC_245       | Decision on adjustment of status under INA 245         |
| P_EOIR42A_DEC | Decision on LPR cancellation of removal                |
| P_EOIR42B_DEC | Decision on non-LPR cancellation of removal            |
| VD_DEC        | Decision on voluntary departure                        |
| WD_DEC        | Decision on case withdrawal                            |
| Dec_Code      | Overall decision code on case                          |
| other_comp    | Other completion code for case                         |

## Charges and Criminal Information

| Column Name | Description                       |
| ----------- | --------------------------------- |
| NBR_OF_CHGS | Total number of charges filed     |
| Charge_1    | Primary charge code               |
| Charge_2    | Second charge code                |
| Charge_3    | Third charge code                 |
| Charge_4    | Fourth charge code                |
| Charge_5    | Fifth charge code                 |
| Charge_6    | Sixth charge code                 |
| CRIM_IND    | Indicates if charges are criminal |

## Relief Application Status

| Column Name    | Description                                 |
| -------------- | ------------------------------------------- |
| recd_212C      | Receipt of 212(c) waiver application        |
| recd_245       | Receipt of adjustment application           |
| VD_recd        | Receipt of voluntary departure request      |
| WD_recd        | Receipt of withdrawal request               |
| P_EOIR42A_Recd | Receipt of LPR cancellation application     |
| P_EOIR42B_Recd | Receipt of non-LPR cancellation application |

## Alien Demographics and Status

| Column Name    | Description             |
| -------------- | ----------------------- |
| strNat         | Nationality code        |
| strLang        | Primary language code   |
| strAlienGender | Gender of alien         |
| strINSStatus   | Immigration status      |
| Date_Of_Entry  | Date alien entered U.S. |
| strCustody     | Custody status code     |

## Detention and Facility Information

| Column Name      | Description                                 |
| ---------------- | ------------------------------------------- |
| strCorFacility   | Correctional facility code                  |
| strProceedingIHP | Institutional Hearing Program facility code |
| Inmate_Housing   | Housing location code                       |
| DCO_Location     | DHS facility location                       |
| strDCAddress1    | Detention facility address line 1           |
| strDCAddress2    | Detention facility address line 2           |
| strDCCity        | Detention facility city                     |
| strDCState       | Detention facility state                    |
| strDCZip         | Detention facility zip code                 |

## Oral Arguments and Hearings

| Column Name              | Description                      |
| ------------------------ | -------------------------------- |
| blnOARequestedbyAlien    | Alien requested oral argument    |
| blnOARequestedbyINS      | DHS requested oral argument      |
| blnOARequestedbyAmicus   | Amicus requested oral argument   |
| datTranscriptServedAlien | Date hearing transcript provided |

## Program Management Fields

| Column Name              | Description                         |
| ------------------------ | ----------------------------------- |
| strAlienRegion           | Region assigned by BIA              |
| strPossibility           | Assessment of case possibility      |
| datROPreview             | Date Record of Proceedings reviewed |
| blnSelectedbyCoordinator | Selected by Pro Bono Coordinator    |
| blnSelectedbyScreener    | Selected by Pro Bono Screener       |
| ScreenerIdn              | Identifier for pro bono screener    |
| datmailedtoNGO           | Date decision mailed to NGO         |
| blnIntrpr                | Indicates if interpreter needed     |
| strIntrprLang            | Required interpreter language       |

## Record Management

| Column Name   | Description                       |
| ------------- | --------------------------------- |
| CaseID        | Case tracking code                |
| idnAppeal     | Reference to appeal record        |
| idnRepl       | Primary key for pro bono record   |
| blnProcessed  | Indicates if record was processed |
| datCreatedOn  | Record creation date              |
| datModifiedOn | Record last modified date         |
