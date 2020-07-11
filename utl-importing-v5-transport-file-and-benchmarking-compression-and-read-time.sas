Importing v5 transport file and benchmarking compression and read time                                                                 
                                                                                                                                       
github                                                                                                                                 
https://tinyurl.com/y872urac                                                                                                           
https://github.com/rogerjdeangelis/utl-importing-v5-transport-file-and-benchmarking-compression-and-read-time                          
                                                                                                                                       
https://tinyurl.com/y7e4oapc                                                                                                           
https://communities.sas.com/t5/SAS-Programming/Cannot-import-XPT-file-into-SAS/m-p/668444                                              
                                                                                                                                       
I downloaded the zipped file, unzipped it into d:/xpt/LLCP2018.xpt,                                                                    
and ran the  code below.                                                                                                               
                                                                                                                                       
        Method                                                                                                                         
                                                                                                                                       
           1. Assign libname                                                                                                           
              libname xpt xport  "d:/xpt/LLCP2018.xpt";                                                                                
                                                                                                                                       
           2. run proc contents on xpt file                                                                                            
                                                                                                                                       
           3. import                                                                                                                   
              data LLCP2018;                                                                                                           
                   set xpt.LLCP2018 ;                                                                                                  
              run;quit;                                                                                                                
/*                     _                          _                                                                                    
| |__   ___ _ __   ___| |__  _ __ ___   __ _ _ __| | _____                                                                             
| `_ \ / _ \ `_ \ / __| `_ \| `_ ` _ \ / _` | `__| |/ / __|                                                                            
| |_) |  __/ | | | (__| | | | | | | | | (_| | |  |   <\__ \                                                                            
|_.__/ \___|_| |_|\___|_| |_|_| |_| |_|\__,_|_|  |_|\_\___/                                                                            
                                                                                                                                       
*/                                                                                                                                     
                                                                                                                                       
                                                                                                                                       
FYI ( compression works well with that data )                                                                                          
==============================================                                                                                         
                                                                                                                                       
                                         Seconds                                                                                       
                         Size          Time to Read                                                                                    
                                                                                                                                       
xpt file                  939mb         4.73 (read and covert IBM floats to IEE flots not lossless)                                    
                                                                                                                                       
No compression            965mb         1.23                                                                                           
                                                                                                                                       
compress=binary           283mb         2.28                                                                                           
                                                                                                                                       
optlength compress=char   381mb         1.49                                                                                           
most numerics 3 bytes                                                                                                                  
                                                                                                                                       
/*                            _                                                                                                        
(_)_ __ ___  _ __   ___  _ __| |_                                                                                                      
| | `_ ` _ \| `_ \ / _ \| `__| __|                                                                                                     
| | | | | | | |_) | (_) | |  | |_                                                                                                      
|_|_| |_| |_| .__/ \___/|_|   \__|                                                                                                     
            |_|                                                                                                                        
*/                                                                                                                                     
libname xpt xport  "d:/xpt/LLCP2018.xpt";                                                                                              
proc contents data=xpt._all_;                                                                                                          
run;quit;                                                                                                                              
                                                                                                                                       
proc contents data=xpt._all_;                                                                                                          
run;quit;                                                                                                                              
                                                                                                                                       
/*                                                                                                                                     
 The CONTENTS Procedure                                                                                                                
                                                                                                                                       
 Data Set Name        XPT.LLCP2018                                Observations          .                                              
 Member Type          DATA                                        Variables             275                                            
 Engine               XPORT                                       Indexes               0                                              
 Created              11/21/2019 10:20:32                         Observation Length    2200                                           
 Last Modified        11/21/2019 10:20:32                         Deleted Observations  0                                              
 Protection                                                       Compressed            NO                                             
 Data Set Type                                                    Sorted                NO                                             
 Label                                                                                                                                 
 Data Representation  Default                                                                                                          
 Encoding             Default                                                                                                          
                                                                                                                                       
                                                                                                                                       
                 Alphabetic List of Variables and Attributes                                                                           
                                                                                                                                       
   #    Variable    Type    Len    Label                                                                                               
                                                                                                                                       
  47    ADDEPEV2    Num       8    EVER TOLD YOU HAD A DEPRESSIVE DISORDER                                                             
 157    ADDOWN1     Num       8    FELT DOWN, DEPRESSED OR HOPELESS                                                                    
 156    ADPLEAS1    Num       8    HAD LITTLE PLEASURE DOING THINGS                                                                    
 152    ADSLEEP     Num       8    DAYS HAD TROUBLE WITH SLEEP                                                                         
  78    ALCDAY5     Num       8    DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE                                                              
  41    ASTHMA3     Num       8    EVER TOLD HAD ASTHMA                                                                                
  42    ASTHNOW     Num       8    STILL HAVE ASTHMA                                                                                   
  79    AVEDRNK2    Num       8    AVG ALCOHOLIC DRINKS PER DAY IN PAST 30                                                             
 103    BLDSTOOL    Num       8    EVER HAD BLOOD STOOL TEST USING HOME KIT                                                            
 114    BLDSUGAR    Num       8    HOW OFTEN CHECK BLOOD FOR GLUCOSE                                                                   
....                                                                                                                                   
...                                                                                                                                    
                                                                                                                                       
205    _URBSTAT    Num       8    URBAN/RURAL STATUS                                                                                   
210    _WT2RAKE    Num       8    DESIGN WEIGHT USED IN RAKING                                                                         
*/                                                                                                                                     
                                                                                                                                       
                                                                                                                                       
data LLCP2018;                                                                                                                         
  set xpt.LLCP2018 ;                                                                                                                   
run;quit;                                                                                                                              
                                                                                                                                       
/*                                                                                                                                     
                                                                                                                                       
Middle Observation(218718 ) of LLCP2018 - Total Obs 437,436                                                                            
                                                                                                                                       
 -- CHARACTER --                Type Len                                                                                               
IDATE                            C    8       02212018            INTERVIEW DATE                                                       
IMONTH                           C    2       02                  INTERVIEW MONTH                                                      
IDAY                             C    2       21                  INTERVIEW DAY                                                        
IYEAR                            C    4       2018                INTERVIEW YEAR                                                       
SEQNO                            C    10      2018003729          ANNUAL SEQUENCE NUMBER                                               
DLYOTHER                         C    25                          DELAYED GETTING MEDICAL CARE OTHER RESPO                             
TOTOBS                           C    16      437,436             TOTOBS                                                               
                                                                                                                                       
                                                                                                                                       
 -- NUMERIC --                                                                                                                         
_STATE                           N    8       29                  STATE FIPS CODE                                                      
FMONTH                           N    8       2                   FILE MONTH                                                           
DISPCODE                         N    8       1100                FINAL DISPOSITION                                                    
_PSU                             N    8       2018003729          PRIMARY SAMPLING UNIT                                                
CTELENM1                         N    8       .                   CORRECT TELEPHONE NUMBER?                                            
PVTRESD1                         N    8       .                   PRIVATE RESIDENCE?                                                   
COLGHOUS                         N    8       .                   DO YOU LIVE IN COLLEGE HOUSING?                                      
STATERE1                         N    8       .                   RESIDENT OF STATE                                                    
CELLFON4                         N    8       .                   CELLULAR TELEPHONE                                                   
LADULT                           N    8       .                   ARE YOU 18 YEARS OF AGE OR OLDER?                                    
NUMADULT                         N    8       .                   NUMBER OF ADULTS IN HOUSEHOLD                                        
NUMMEN                           N    8       .                   NUMBER OF ADULT MEN IN HOUSEHOLD                                     
NUMWOMEN                         N    8       .                   NUMBER OF ADULT WOMEN IN HOUSEHOLD                                   
SAFETIME                         N    8       1                   SAFE TIME TO TALK?                                                   
CTELNUM1                         N    8       1                   CORRECT PHONE NUMBER?                                                
CELLFON5                         N    8       1                   IS THIS A CELL PHONE?                                                
CADULT                           N    8       2                   ARE YOU 18 YEARS OF AGE OR OLDER?                                    
PVTRESD3                         N    8       1                   DO YOU LIVE IN A PRIVATE RESIDENCE?                                  
CCLGHOUS                         N    8       .                   DO YOU LIVE IN COLLEGE HOUSING?                                      
CSTATE1                          N    8       1                   DO YOU CURRENTLY LIVE IN  ____(STATE)___                             
LANDLINE                         N    8       2                   DO YOU ALSO HAVE A LANDLINE TELEPHONE?                               
HHADULT                          N    8       2                   NUMBER OF ADULTS IN HOUSEHOLD                                        
GENHLTH                          N    8       3                   GENERAL HEALTH                                                       
PHYSHLTH                         N    8       88                  NUMBER OF DAYS PHYSICAL HEALTH NOT GOOD                              
MENTHLTH                         N    8       2                   NUMBER OF DAYS MENTAL HEALTH NOT GOOD                                
POORHLTH                         N    8       1                   POOR PHYSICAL OR MENTAL HEALTH                                       
HLTHPLN1                         N    8       1                   HAVE ANY HEALTH CARE COVERAGE                                        
PERSDOC2                         N    8       1                   MULTIPLE HEALTH CARE PROFESSIONALS                                   
MEDCOST                          N    8       2                   COULD NOT SEE DR. BECAUSE OF COST                                    
CHECKUP1                         N    8       4                   LENGTH OF TIME SINCE LAST ROUTINE CHECKU                             
EXERANY2                         N    8       1                   EXERCISE IN PAST 30 DAYS                                             
SLEPTIM1                         N    8       7                   HOW MUCH TIME DO YOU SLEEP                                           
CVDINFR4                         N    8       2                   EVER DIAGNOSED WITH HEART ATTACK                                     
CVDCRHD4                         N    8       2                   EVER DIAGNOSED WITH ANGINA OR CORONARY H                             
CVDSTRK3                         N    8       2                   EVER DIAGNOSED WITH A STROKE                                         
ASTHMA3                          N    8       2                   EVER TOLD HAD ASTHMA                                                 
ASTHNOW                          N    8       .                   STILL HAVE ASTHMA                                                    
CHCSCNCR                         N    8       2                   (EVER TOLD) YOU HAD SKIN CANCER?                                     
CHCOCNCR                         N    8       2                   (EVER TOLD) YOU HAD ANY OTHER TYPES OF C                             
CHCCOPD1                         N    8       2                   (EVER TOLD) YOU HAVE (COPD) CHRONIC OBST                             
HAVARTH3                         N    8       2                   TOLD HAVE ARTHRITIS                                                  
ADDEPEV2                         N    8       1                   EVER TOLD YOU HAD A DEPRESSIVE DISORDER                              
CHCKDNY1                         N    8       2                   (EVER TOLD) YOU HAVE KIDNEY DISEASE?                                 
DIABETE3                         N    8       3                   (EVER TOLD) YOU HAVE DIABETES                                        
DIABAGE2                         N    8       .                   AGE WHEN TOLD HAD DIABETES                                           
LASTDEN4                         N    8       4                   LAST VISITED DENTIST OR DENTAL CLINIC                                
RMVTETH4                         N    8       8                   NUMBER OF PERMANENT TEETH REMOVED                                    
SEX1                             N    8       2                   RESPONDENTS SEX                                                      
MARITAL                          N    8       5                   MARITAL STATUS                                                       
EDUCA                            N    8       5                   EDUCATION LEVEL                                                      
RENTHOM1                         N    8       2                   OWN OR RENT HOME                                                     
NUMHHOL3                         N    8       .                   HOUSEHOLD TELEPHONES                                                 
NUMPHON3                         N    8       .                   RESIDENTIAL PHONES                                                   
CPDEMO1B                         N    8       .                   DO YOU HAVE A CELL PHONE FOR PERSONAL US                             
VETERAN3                         N    8       2                   ARE YOU A VETERAN                                                    
EMPLOY1                          N    8       1                   EMPLOYMENT STATUS                                                    
CHILDREN                         N    8       88                  NUMBER OF CHILDREN IN HOUSEHOLD                                      
INCOME2                          N    8       5                   INCOME LEVEL                                                         
WEIGHT2                          N    8       140                 REPORTED WEIGHT IN POUNDS                                            
HEIGHT3                          N    8       507                 REPORTED HEIGHT IN FEET AND INCHES                                   
PREGNANT                         N    8       2                   PREGNANCY STATUS                                                     
DEAF                             N    8       2                   ARE YOU DEAF OR DO YOU HAVE SERIOUS DIFF                             
BLIND                            N    8       2                   BLIND OR DIFFICULTY SEEING                                           
DECIDE                           N    8       2                   DIFFICULTY CONCENTRATING OR REMEMBERING                              
DIFFWALK                         N    8       2                   DIFFICULTY WALKING OR CLIMBING STAIRS                                
DIFFDRES                         N    8       2                   DIFFICULTY DRESSING OR BATHING                                       
DIFFALON                         N    8       2                   DIFFICULTY DOING ERRANDS ALONE                                       
SMOKE100                         N    8       1                   SMOKED AT LEAST 100 CIGARETTES                                       
SMOKDAY2                         N    8       2                   FREQUENCY OF DAYS NOW SMOKING                                        
STOPSMK2                         N    8       2                   STOPPED SMOKING IN PAST 12 MONTHS                                    
LASTSMK2                         N    8       .                   INTERVAL SINCE LAST SMOKED                                           
USENOW3                          N    8       3                   USE OF SMOKELESS TOBACCO PRODUCTS                                    
ALCDAY5                          N    8       105                 DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE                               
AVEDRNK2                         N    8       2                   AVG ALCOHOLIC DRINKS PER DAY IN PAST 30                              
DRNK3GE5                         N    8       4                   BINGE DRINKING                                                       
MAXDRNKS                         N    8       10                  MOST DRINKS ON SINGLE OCCASION PAST 30 D                             
FLUSHOT6                         N    8       2                   ADULT FLU SHOT/SPRAY PAST 12 MOS                                     
FLSHTMY2                         N    8       .                   WHEN RECEIVED MOST RECENT SEASONAL FLU S                             
IMFVPLAC                         N    8       .                   WHERE DID YOU GET YOUR LAST FLU SHOT/VAC                             
PNEUVAC4                         N    8       2                   PNEUMONIA SHOT EVER                                                  
FALL12MN                         N    8       .                   HAD FALL PAST TWELVE MONTHS                                          
FALLINJ3                         N    8       .                   INJURED IN FALL                                                      
SEATBELT                         N    8       1                   HOW OFTEN USE SEATBELTS IN CAR?                                      
DRNKDRI2                         N    8       3                   DID YOU DRIVE AFTER HAVING TOO MUCH TO D                             
HADMAM                           N    8       2                   HAVE YOU EVER HAD A MAMMOGRAM                                        
HOWLONG                          N    8       .                   HOW LONG SINCE LAST MAMMOGRAM                                        
HADPAP2                          N    8       1                   EVER HAD A PAP TEST                                                  
LASTPAP2                         N    8       2                   HOW LONG SINCE LAST PAP TEST                                         
HPVTEST                          N    8       1                   HAVE YOU EVER HAD AN HPV TEST?                                       
HPLSTTST                         N    8       5                   HOW LONG SINCE YOUR LAST HPV TEST?                                   
HADHYST2                         N    8       2                   HAD HYSTERECTOMY                                                     
PCPSAAD3                         N    8       .                   HAS A HEALTH PROFESSIONAL EVER TALKED WI                             
PCPSADI1                         N    8       .                   HAS A HEALTH PROFESSIONAL EVER TALKED WI                             
PCPSARE1                         N    8       .                   HAS A DOCTOR EVER RECOMMENDED THAT YOU H                             
PSATEST1                         N    8       .                   EVER HAD PSA TEST                                                    
PSATIME                          N    8       .                   TIME SINCE LAST PSA TEST                                             
PCPSARS1                         N    8       .                   WHAT WAS THE MAIN REASON YOU HAD THIS PS                             
BLDSTOOL                         N    8       .                   EVER HAD BLOOD STOOL TEST USING HOME KIT                             
LSTBLDS3                         N    8       .                   TIME SINCE LAST BLOOD STOOL TEST                                     
HADSIGM3                         N    8       .                   EVER HAD SIGMOIDOSCOPY/COLONOSCOPY                                   
HADSGCO1                         N    8       .                   WAS LAST TEST A SIGMOIDOSCOPY OR COLONOS                             
LASTSIG3                         N    8       .                   TIME SINCE LAST SIGMOIDOSCOPY/COLONOSCOP                             
HIVTST6                          N    8       2                   EVER TESTED HIV                                                      
HIVTSTD3                         N    8       .                   MONTH AND YEAR OF LAST HIV TEST                                      
HIVRISK5                         N    8       1                   DO ANY HIGH RISK SITUATIONS APPLY                                    
PDIABTST                         N    8       2                   HAD A TEST FOR HIGH BLOOD SUGAR IN PAST                              
PREDIAB1                         N    8       3                   EVER BEEN TOLD YOU HAVE PRE-DIABETES OR                              
INSULIN                          N    8       .                   NOW TAKING INSULIN                                                   
BLDSUGAR                         N    8       .                   HOW OFTEN CHECK BLOOD FOR GLUCOSE                                    
FEETCHK3                         N    8       .                   HOW OFTEN CHECK FEET FOR SORES OR IRRITA                             
DOCTDIAB                         N    8       .                   TIMES SEEN HEALTH PROFESSIONAL FOR DIABE                             
CHKHEMO3                         N    8       .                   TIMES CHECKED FOR GLYCOSYLATED HEMOGLOBI                             
FEETCHK                          N    8       .                   TIMES FEET CHECK FOR SORES/IRRITATIONS                               
EYEEXAM1                         N    8       .                   LAST EYE EXAM WHERE PUPILS WERE DILATED                              
DIABEYE                          N    8       .                   EVER TOLD DIABETES HAS AFFECTED EYES                                 
DIABEDU                          N    8       .                   EVER TAKEN CLASS IN MANAGING DIABETES                                
MEDICARE                         N    8       .                   DO YOU HAVE MEDICARE?                                                
HLTHCVR1                         N    8       .                   PRIMARY HEALTH INSURANCE COVERAGE                                    
DELAYME1                         N    8       .                   DELAYED GETTING MEDICAL CARE                                         
NOCOV121                         N    8       .                   WITHOUT HEALTH CARE COVERAGE PAST 12 MON                             
LSTCOVRG                         N    8       .                   TIME SINCE LAST HAD HEALTH CARE COVERAGE                             
DRVISITS                         N    8       .                   DOCTOR VISITS PAST 12 MONTHS                                         
MEDSCOS1                         N    8       .                   COULD NOT GET MEDICINE DUE TO COST                                   
CARERCVD                         N    8       .                   SATISFIED WITH CARE RECEIVED                                         
MEDBILL1                         N    8       .                   CURRENTLY HAVE HEALTH CARE BILLS                                     
CIMEMLOS                         N    8       .                   HAVE YOU EXPERIENCED CONFUSION OR MEMORY                             
CDHOUSE                          N    8       .                   GIVEN UP DAY-TO-DAY CHORES DUE TO CONFUS                             
CDASSIST                         N    8       .                   NEED ASSISTANCE WITH DAY-TO_DAY ACTIVITI                             
CDHELP                           N    8       .                   WHEN YOU NEED HELP WITH DAY-TO-DAY ACTIV                             
CDSOCIAL                         N    8       .                   DOES CONFUSION OR MEMORY LOSS INTERFERE                              
CDDISCUS                         N    8       .                   HAVE YOU DISCUSSED YOUR CONFUSION OR MEM                             
CAREGIV1                         N    8       .                   PROVIDED REGULAR CARE FOR FAMILY OR FRIE                             
CRGVREL2                         N    8       .                   RELATIONSHIP OF PERSON TO WHOM YOU ARE G                             
CRGVLNG1                         N    8       .                   HOW LONG PROVIDED CARE FOR PERSON.                                   
CRGVHRS1                         N    8       .                   HOW MANY HOURS DO YOU PROVIDE CARE FOR P                             
CRGVPRB2                         N    8       .                   WHAT IS THE MAJOR HEALTH PROBLEM, ILLNES                             
CRGVPERS                         N    8       .                   MANAGED PERSONAL CARE                                                
CRGVHOUS                         N    8       .                   MANAGED HOUSEHOLD TASKS                                              
CRGVMST3                         N    8       .                   WHICH SUPPORT DO YOU MOST NEED THAT YOU                              
CRGVEXPT                         N    8       .                   DO YOU EXPECT TO HAVE A RELATIVE YOU WIL                             
ECIGARET                         N    8       1                   HAVE YOU EVER USED AN E-CIGARETTE OR OTH                             
ECIGNOW                          N    8       2                   DO YOU NOW USE E-CIGARETTES, EVERY DAY,                              
MARIJAN1                         N    8       .                   DURING THE PAST 30 DAYS, ON HOW MANY DAY                             
USEMRJN2                         N    8       .                   DURING THE PAST 30 DAYS, HOW DID YOU PRI                             
RSNMRJN1                         N    8       .                   WHAT WAS THE REASON YOU USED MARIJUANA?                              
ADSLEEP                          N    8       .                   DAYS HAD TROUBLE WITH SLEEP                                          
SLEPDAY1                         N    8       .                   OVER THE LAST 2 WEEKS, HOW MANY DAYS DID                             
SLEPSNO2                         N    8       .                   HAVE YOU EVER BEEN TOLD THAT YOU SNORE L                             
SLEPBRTH                         N    8       .                   HAS ANYONE EVER OBSERVED THAT YOU STOP B                             
ADPLEAS1                         N    8       .                   HAD LITTLE PLEASURE DOING THINGS                                     
ADDOWN1                          N    8       .                   FELT DOWN, DEPRESSED OR HOPELESS                                     
FEELNERV                         N    8       .                   FELT NERVOUS, ANXIOUS OR ON EDGE                                     
STOPWORY                         N    8       .                   BEEN BOTHERED BY NOT BEING ABLE TO STOP                              
COPDCOGH                         N    8       2                   DID YOU HAVE A COUGH?                                                
COPDFLEM                         N    8       2                   DID YOU COUGH UP PHLEGM?                                             
COPDBRTH                         N    8       2                   DID YOU HAVE SHORTNESS OF BREATH?                                    
COPDBTST                         N    8       2                   HAVE YOU EVER BEEN GIVEN A BREATHING TES                             
COPDSMOK                         N    8       2                   HOW MANY YEARS HAVE YOU SMOKED TOBACCO P                             
INDORTAN                         N    8       .                   TIMES USED AN INDOOR TANNING DEVICE                                  
NUMBURN3                         N    8       .                   NUMBER OF SUNBURNS IN PAST 12 MONTHS                                 
SUNPRTCT                         N    8       .                   HOW OFTEN PROTECT YOURSELF FROM THE SUN                              
WKDAYOUT                         N    8       .                   HOW OFTEN OUTSIDE ON WEEKDAYS                                        
WKENDOUT                         N    8       .                   HOW OFTEN OUTSIDE ON WEEKENDS                                        
LCSFIRST                         N    8       .                   HOW OLD WHEN YOU FIRST STARTED SMOKING?                              
LCSLAST                          N    8       .                   HOW OLD WHEN YOU LAST SMOKED?                                        
LCSNUMCG                         N    8       .                   ON AVERAGE, HOW MANY CIGARETTES DO YOU S                             
LCSCTSCN                         N    8       .                   DID YOU HAVE A CT OR CAT SCAN?                                       
CNCRDIFF                         N    8       .                   HOW MANY TYPES OF CANCER?                                            
CNCRAGE                          N    8       .                   AGE TOLD HAD CANCER                                                  
CNCRTYP1                         N    8       .                   TYPE OF CANCER                                                       
CSRVTRT2                         N    8       .                   CURRENTLY RECEIVING TREATMENT FOR CANCER                             
CSRVDOC1                         N    8       .                   WHAT TYPE OF DOCTOR PROVIDES MAJORITY OF                             
CSRVSUM                          N    8       .                   DID YOU RECEIVE A SUMMARY OF CANCER TREA                             
CSRVRTRN                         N    8       .                   EVER RECEIVE INSTRUCTIONS FROM A DOCTOR                              
CSRVINST                         N    8       .                   INSTRUCTIONS WRITTEN OR PRINTED                                      
CSRVINSR                         N    8       .                   DID HEALTH INSURANCE PAY FOR ALL OF YOUR                             
CSRVDEIN                         N    8       .                   EVER DENIED INSURANCE COVERAGE BECAUSE O                             
CSRVCLIN                         N    8       .                   PARTICIPATE IN CLINICAL TRIAL AS PART OF                             
CSRVPAIN                         N    8       .                   CURRENTLY HAVE PHYSICAL PAIN FROM CANCER                             
CSRVCTL1                         N    8       .                   IS PAIN UNDER CONTROL?                                               
PCPSADE1                         N    8       .                   WHY WAS PSA TEST DONE?                                               
PCDMDEC1                         N    8       .                   WHO MADE THE DECISION WITH YOU TO HAVE P                             
PROFEXAM                         N    8       .                   EVER HAD BREAST PHYSICAL EXAM BY DOCTOR                              
LENGEXAM                         N    8       .                   HOW LONG SINCE LAST BREAST PHYSICAL EXAM                             
HPVADVC2                         N    8       1                   EVER HAD THE HPV VACCINATION?                                        
HPVADSHT                         N    8       2                   NUMBER OF HPV SHOTS RECEIVED                                         
TETANUS1                         N    8       1                   RECEIVED TETANUS SHOT SINCE 2005?                                    
SHINGLE2                         N    8       .                   HAVE YOU EVER HAD THE SHINGLES OR ZOSTER                             
SOMALE                           N    8       .                   SEXUAL ORIENTATION                                                   
SOFEMALE                         N    8       2                   SEXUAL ORIENTATION                                                   
TRNSGNDR                         N    8       4                   DO YOU CONSIDER YOURSELF TO BE TRANSGEND                             
RCSGENDR                         N    8       .                   GENDER OF CHILD                                                      
RCSRLTN2                         N    8       .                   RELATIONSHIP TO CHILD                                                
CASTHDX2                         N    8       .                   HLTH PRO EVER SAID CHILD HAS ASTHMA                                  
CASTHNO2                         N    8       .                   CHILD STILL HAVE ASTHMA?                                             
QSTVER                           N    8       20                  QUESTIONNAIRE VERSION IDENTIFIER                                     
QSTLANG                          N    8       1                   LANGUAGE IDENTIFIER                                                  
_METSTAT                         N    8       1                   METROPOLITAN STATUS                                                  
_URBSTAT                         N    8       1                   URBAN/RURAL STATUS                                                   
MSCODE                           N    5       .                   METROPOLITAN STATUS CODE                                             
_STSTR                           N    8       292069              SAMPLE DESIGN STRATIFICATION VARIABLE                                
_STRWT                           N    8       332.18423116        STRATUM WEIGHT                                                       
_RAWRAKE                         N    8       1                   RAW WEIGHTING FACTOR USED IN RAKING                                  
_WT2RAKE                         N    8       332.18423116        DESIGN WEIGHT USED IN RAKING                                         
_IMPRACE                         N    8       1                   IMPUTED RACE/ETHNICITY VALUE                                         
_CHISPNC                         N    8       9                   CHILD HISPANIC, LATINO/A, OR SPANISH ORI                             
_CRACE1                          N    8       .                   CHILD NON-HISPANIC RACE INCLUDING MULTIR                             
_CPRACE                          N    8       .                   PREFERRED CHILD RACE CATEGORIES                                      
_CLLCPWT                         N    8       .                   FINAL CHILD WEIGHT: LAND-LINE AND CELL-P                             
_DUALUSE                         N    8       9                   DUAL PHONE USE CATEGORIES                                            
_DUALCOR                         N    8       .                   DUAL PHONE USE CORRECTION FACTOR                                     
_LLCPWT2                         N    8       1525.2959922        TRUNCATED DESIGN WEIGHT USED IN ADULT CO                             
_LLCPWT                          N    8       2695.6129204        FINAL WEIGHT: LAND-LINE AND CELL-PHONE D                             
_RFHLTH                          N    8       1                   ADULTS WITH GOOD OR BETTER HEALTH                                    
_PHYS14D                         N    8       1                   COMPUTED PHYSICAL HEALTH STATUS                                      
_MENT14D                         N    8       2                   COMPUTED MENTAL HEALTH STATUS                                        
_HCVU651                         N    8       1                   RESPONDENTS AGED 18-64 WITH HEALTH CARE                              
_TOTINDA                         N    8       1                   LEISURE TIME PHYSICAL ACTIVITY CALCULATE                             
_MICHD                           N    8       2                   RESPONDENTS THAT HAVE EVER REPORTED HAVI                             
_LTASTH1                         N    8       1                   LIFETIME ASTHMA CALCULATED VARIABLE                                  
_CASTHM1                         N    8       1                   CURRENT ASTHMA CALCULATED VARIABLE                                   
_ASTHMS1                         N    8       3                   COMPUTED ASTHMA STATUS                                               
_DRDXAR1                         N    8       2                   RESPONDENTS DIAGNOSED WITH ARTHRITIS                                 
_EXTETH3                         N    8       1                   RISK FACTOR FOR HAVING HAD PERMANENT TEE                             
_ALTETH3                         N    8       .                   ADULTS AGED 65+ WHO HAVE HAD ALL THEIR N                             
_DENVST3                         N    8       2                   ADULTS WHO HAVE VISITED A DENTIST, DENTA                             
_PRACE1                          N    8       1                   COMPUTED PREFERRED RACE                                              
_MRACE1                          N    8       1                   CALCULATED NON-HISPANIC RACE INCLUDING M                             
_HISPANC                         N    8       2                   HISPANIC, LATINO/A, OR SPANISH ORIGIN CA                             
_RACE                            N    8       1                   COMPUTED RACE-ETHNICITY GROUPING                                     
_RACEG21                         N    8       1                   COMPUTED NON-HISPANIC WHITES/ALL OTHERS                              
_RACEGR3                         N    8       1                   COMPUTED FIVE LEVEL RACE/ETHNICITY CATEG                             
_RACE_G1                         N    8       1                   COMPUTED RACE GROUPS USED FOR INTERNET P                             
_AGEG5YR                         N    8       1                   REPORTED AGE IN FIVE-YEAR AGE CATEGORIES                             
_AGE65YR                         N    8       1                   REPORTED AGE IN TWO AGE GROUPS CALCULATE                             
_AGE80                           N    8       21                  IMPUTED AGE VALUE COLLAPSED ABOVE 80                                 
_AGE_G                           N    8       1                   IMPUTED AGE IN SIX GROUPS                                            
HTIN4                            N    8       67                  COMPUTED HEIGHT IN INCHES                                            
HTM4                             N    8       170                 COMPUTED HEIGHT IN METERS                                            
WTKG3                            N    8       6350                COMPUTED WEIGHT IN KILOGRAMS                                         
_BMI5                            N    8       2193                COMPUTED BODY MASS INDEX                                             
_BMI5CAT                         N    8       2                   COMPUTED BODY MASS INDEX CATEGORIES                                  
_RFBMI5                          N    8       1                   OVERWEIGHT OR OBESE CALCULATED VARIABLE                              
_CHLDCNT                         N    8       1                   COMPUTED NUMBER OF CHILDREN IN HOUSEHOLD                             
_EDUCAG                          N    8       3                   COMPUTED LEVEL OF EDUCATION COMPLETED CA                             
_INCOMG                          N    8       3                   COMPUTED INCOME CATEGORIES                                           
_SMOKER3                         N    8       2                   COMPUTED SMOKING STATUS                                              
_RFSMOK3                         N    8       2                   CURRENT SMOKING CALCULATED VARIABLE                                  
DRNKANY5                         N    8       1                   DRINK ANY ALCOHOLIC BEVERAGES IN PAST 30                             
DROCDY3_                         N    8       71                  COMPUTED DRINK-OCCASIONS-PER-DAY                                     
_RFBING5                         N    8       2                   BINGE DRINKING CALCULATED VARIABLE                                   
_DRNKWEK                         N    8       1000                COMPUTED NUMBER OF DRINKS OF ALCOHOL BEV                             
_RFDRHV6                         N    8       2                   HEAVY ALCOHOL CONSUMPTION  CALCULATED VA                             
_FLSHOT6                         N    8       .                   FLU SHOT CALCULATED VARIABLE                                         
_PNEUMO3                         N    8       .                   PNEUMONIA VACCINATION CALCULATED VARIABL                             
_RFSEAT2                         N    8       1                   ALWAYS OR NEARLY ALWAYS WEAR SEAT BELTS                              
_RFSEAT3                         N    8       1                   ALWAYS WEAR SEAT BELTS                                               
_DRNKDRV                         N    8       1                   DRINKING AND DRIVING                                                 
_RFMAM21                         N    8       .                   WOMEN RESPONDENTS AGED 40+ WHO HAVE HAD                              
_MAM5022                         N    8       .                   WOMEN RESPONDENTS AGED 50-74 WHO HAVE HA                             
_RFPAP34                         N    8       1                   WOMEN RESPONDENTS AGED 21-65 WHO HAVE HA                             
_RFPSA22                         N    8       .                   MALE RESPONDENTS AGED 40+ WHO HAVE HAD A                             
_RFBLDS3                         N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE HAD A BL                             
_COL10YR                         N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE HAD A CO                             
_HFOB3YR                         N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE HAD A BL                             
_FS5YR                           N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE HAD A SI                             
_FOBTFS                          N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE HAD A BL                             
_CRCREC                          N    8       .                   RESPONDENTS AGED 50-75 WHO HAVE FULLY ME                             
_AIDTST3                         N    8       2                   EVER BEEN TESTED FOR HIV CALCULATED VARI                             
                                                                                                                                       
*/                                                                                                                                     
                                                                                                                                       
                                                                                                                                       
/*                                                                                                                                     
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                     
| `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                                                    
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                    
| .__/|_|  \___/ \___\___||___/___/                                                                                                    
|_|                                                                                                                                    
*/                                                                                                                                     
                                                                                                                                       
                                                                                                                                       
data LLCP2018ORIGINAL;                                                                                                                 
  set xpt.LLCP2018 ;    /* 4.73 */                                                                                                     
run;quit;                                                                                                                              
                                                                                                                                       
%utl_optlen(inp=LLCP2018ORIGINAL,out=LLCP2018optchr,compress=char);                                                                    
                                                                                                                                       
data LLCP2018bin(compress=binary);                                                                                                     
  set xpt.LLCP2018 ;                                                                                                                   
run;quit;                                                                                                                              
                                                                                                                                       
                                                                                                                                       
data bin;                                                                                                                              
  set LLCP2018bin;     /* 2.28 seconds */                                                                                              
run;quit;                                                                                                                              
                                                                                                                                       
data chr;                                                                                                                              
  set LLCP2018optchr;  /* 1.49 seconds  */                                                                                             
run;quit;                                                                                                                              
                                                                                                                                       
data chr;                                                                                                                              
  set LLCP2018original;  /* 1.23 seconds  */                                                                                           
run;quit;                                                                                                                              
                                                                                                                                       
                                                                                                                                       
                                                                                                                                       
                                                                                                                                       
