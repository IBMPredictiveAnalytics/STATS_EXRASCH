﻿file handle data /name="%er%/stats_exrasch/tests".
get file="data/raschdat1.sav".
dataset name rasch.
***show locale.

STATS EXRASCH MODEL=RM ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1.

STATS EXRASCH MODEL=RM ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/SAVE PERSONDATA=persondata.

*Wald test.
STATS EXRASCH MODEL=RM  ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/OUTPUT ITEMINFOPLOT=NO DESIGNMATRIX=NO WALDTEST=MEDIAN.

* Unavailable Wald.
STATS EXRASCH MODEL=LLTM  ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/OUTPUT ITEMINFOPLOT=NO DESIGNMATRIX=NO WALDTEST=MEDIAN.

 
STATS EXRASCH MODEL=RM ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/SAVE PERSONDATA=persondata
/OUTPUT PERSONPLOT=no iteminfoplot=no iccplot=yes.


STATS EXRASCH ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/OPTIONS SE=YES.

STATS EXRASCH MODEL=RSM ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 
    V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/OPTIONS SE=YES.

file handle data /name="%er%/stats_exrasch/tests".
get file="data/rsmdat.sav".
dataset name rsmdat.
dataset activate rsmdat.

STATS EXRASCH MODEL=RSM ITEMS=V1 V2 V3 V4 V5 V6  REPS=1
/OPTIONS SE=YES.


STATS EXRASCH MODEL=PCM ITEMS=V1 V2 V3 V4 V5 V6  REPS=1
/OUTPUT ICCPLOT=YES.

STATS EXRASCH MODEL=PCM ITEMS=V1 V2 V3 V4 V5 V6 REPS=1
/OPTIONS SUM0=NO
/OUTPUT personplot=yes
/SAVE  PERSONDATA=PCMPERSON.


file handle data /name="%er%/stats_exrasch/tests".
get file="data/lltmdat1.sav".
dataset name lltmdat1.
dataset activate lltmdat1.

STATS EXRASCH MODEL=LLTM  ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 
    V20 V21 V22 V23 V24 V25 V26 V27 V28 V29 V30  REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/SAVE PERSONDATA=lltmperson /OUTPUT PERSONPLOT=YES.

STATS EXRASCH MODEL=LLTM  ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 
    V20 V21 V22 V23 V24 V25 V26 V27 V28 V29 V30 VALUES=DICHOT REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=EASINESS
/SAVE PERSONDATA=lltmperson /OUTPUT PERSONPLOT=YES ITEMINFOPLOT=YES.


DATASET ACTIVATE lltmdat1.
STATS EXRASCH MODEL=LLTM  ITEMS=V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 
    V20 V21 V22 V23 V24 V25 V26 V27 V28 V29 V30  REPS=2
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/SAVE PERSONDATA=lltmperson 
/OUTPUT PERSONPLOT=YES ITEMINFOPLOT=YES DESIGNMATRIX=YES.


file handle data /name="%er%/stats_exrasch/tests".
get file="data/lpcmdat.sav".
dataset name lpcmdat.
dataset activate lpcmdat.

STATS EXRASCH MODEL=LPCM  ITEMS=X1 X2 X3 X4 X5 X6  GROUP=G REPS=2
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/OUTPUT ITEMINFOPLOT=NO DESIGNMATRIX=NO.

* error.
STATS EXRASCH MODEL=LPCM  ITEMS=X1 X2 X3 X4 X5 X6  GROUP=G REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/OUTPUT ITEMINFOPLOT=NO DESIGNMATRIX=NO.



STATS EXRASCH MODEL=LPCM  ITEMS=X1 X2 X3 X4 X5 X6  GROUP=G REPS=2
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=EASINESS
/OUTPUT PERSONPLOT=YES ITEMINFOPLOT=YES DESIGNMATRIX=YES.

STATS EXRASCH MODEL=LPCM  ITEMS=X1 X2 X3 X4 X5 X6  GROUP=G REPS=2
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=EASINESS
/OUTPUT PERSONPLOT=no ITEMINFOPLOT=yes DESIGNMATRIX=no.

STATS EXRASCH MODEL=RM  ITEMS=X1 X2 X3 X4 X5 X6  REPS=1
/OPTIONS SUM0=NO SE=YES ITEMDISPLAY=DIFFICULTY
/OUTPUT ITEMINFOPLOT=NO DESIGNMATRIX=NO WALDTEST=MEDIAN.
