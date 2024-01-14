libname fin "~/nonshared_files/Data/";
 data casesubset;
   infile"~/nonshared_files/Data/CaseSubset.csv" dsd firstobs=2;
   input caseid_new
         subsetnumber;
run;
proc sort data=casesubset; by caseid_new; run;
proc sort data=fin.hcmst; by caseid_new; run;
data fin.my_hcmst;
 merge casesubset (where=(subsetnumber = 2) in=ind1)
       fin.hcmst (in=ind2);
 by caseid_new;
 if ind1 & ind2;
run;
  proc format ;
        value genformat
              1 ='Male'
              2 ='Female';
        value eiformat
              0 ='not endorsing Excellent relationship quality'
              1 ='endorsing Excellent relationship quality';
    run;
    
 data fin.my_hcmst;
 set fin.my_hcmst; 
 if abs(PPAGE-Q9) <= 5 then Agediff = 1; 
 else Agediff = 0; 
run;

%MACRO MYCHI(varname,varlable,varformat,date);

/*work*/
ods output CrossTabFreqs=CTF (where=(Q31_1=1 & RowPercent ne .))
          ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_1*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF;
 merge CTF CS;
 by table;
 varlable = "Work";
 keep varlable &varname frequency rowpercent prob;
run;
/*school*/
ods output CrossTabFreqs=CTF (where=(Q31_2=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_2*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF2;
 merge CTF CS;
 by table;
 varlable = "School";
 keep varlable &varname frequency rowpercent prob;
run;
/*church*/
ods output CrossTabFreqs=CTF (where=(Q31_3=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_3*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF3;
 merge CTF CS;
 by table;
 varlable = "Church";
 keep varlable &varname frequency rowpercent prob;
run;
/*Dating services*/
ods output CrossTabFreqs=CTF (where=(Q31_4=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_4*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF4;
 merge CTF CS;
 by table;
 varlable = "Dating Services";
 keep varlable &varname frequency rowpercent prob;
run;
/*vacation*/
ods output CrossTabFreqs=CTF (where=(Q31_5=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_5*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF5;
 merge CTF CS;
 by table;
 varlable = "Vacation";
 keep varlable &varname frequency rowpercent prob;
run;
/*bar*/
ods output CrossTabFreqs=CTF (where=(Q31_6=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_6*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF6;
 merge CTF CS;
 by table;
 varlable = "Bar";
 keep varlable &varname frequency rowpercent prob;
run;
/*social*/
ods output CrossTabFreqs=CTF (where=(Q31_7=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_7*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF7;
 merge CTF CS;
 by table;
 varlable = "Social Organization";
 keep varlable &varname frequency rowpercent prob;
run;
/*party*/
ods output CrossTabFreqs=CTF (where=(Q31_8=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_8*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF8;
 merge CTF CS;
 by table;
 varlable = "Private Party";
 keep varlable &varname frequency rowpercent prob;
run;
/*other*/
ods output CrossTabFreqs=CTF (where=(Q31_9=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q31_9*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF9;
 merge CTF CS;
 by table;
 varlable = "Other";
 keep varlable &varname frequency rowpercent prob;
run;
/*family*/
ods output CrossTabFreqs=CTF (where=(Q33_1=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_1*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF10;
 merge CTF CS;
 by table;
 varlable = "Family";
 keep varlable &varname frequency rowpercent prob;
run;
/*mutural friends*/
ods output CrossTabFreqs=CTF (where=(Q33_2=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_2*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF11;
 merge CTF CS;
 by table;
 varlable = "Mutural Friends";
 keep varlable &varname frequency rowpercent prob;
run;
/*co-workers*/
ods output CrossTabFreqs=CTF (where=(Q33_3=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_3*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF12;
 merge CTF CS;
 by table;
 varlable = "Co-workers";
 keep varlable &varname frequency rowpercent prob;
run;
/*classmates*/
ods output CrossTabFreqs=CTF (where=(Q33_4=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_4*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF13;
 merge CTF CS;
 by table;
 varlable = "Classmates";
 keep varlable &varname frequency rowpercent prob;
run;
/*Neighbors*/
ods output CrossTabFreqs=CTF (where=(Q33_5=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_5*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF14;
 merge CTF CS;
 by table;
 varlable = "Neighbors";
 keep varlable &varname frequency rowpercent prob;
run;
/*Self or Partner*/
ods output CrossTabFreqs=CTF (where=(Q33_6=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_6*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF15;
 merge CTF CS;
 by table;
 varlable = "Self or Partner";
 keep varlable &varname frequency rowpercent prob;
run;
/*Other*/
ods output CrossTabFreqs=CTF (where=(Q33_7=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Q33_7*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF16;
 merge CTF CS;
 by table;
 varlable = "Other2";
 keep varlable &varname frequency rowpercent prob;
run;
/*Age*/
ods output CrossTabFreqs=CTF (where=(Agediff=1 & RowPercent ne .))
           ChiSq=CS (where=(statistic="Chi-Square"));
proc freq data=fin.my_hcmst;
 tables Agediff*&varname/nopercent nocol chisq;
run;
proc sort data=CTF; by table; run;
proc sort data=CS; by table; run;
data CSCTF17;
 merge CTF CS;
 by table;
 varlable = "Age";
 keep varlable &varname frequency rowpercent prob;
run;

data combined;
length varlable $30.;
set CSCTF CSCTF2 CSCTF3 CSCTF4 CSCTF5 CSCTF6 CSCTF7 CSCTF8 CSCTF9 CSCTF10 CSCTF11 CSCTF12 CSCTF13 CSCTF14 CSCTF15 CSCTF16 CSCTF17;
if varlable in ('Bar','Church','Dating Services','Other','Private Party','School','Social Organization','Vacation','Work') then category = "1. Where Met Partner: ";
else if varlable in ('Classmates','Co-Wokers','Family','Other2','Mutual Friends', 'Neighbors','Self or Partner') then category = "2. Who Introduced Partner:  ";
else if varlable = 'Age' then category = "3. Similar Age: ";
run;
proc print data=combined(obs= 200); run;
proc tabulate data=combined;
class category &varname varlable;
format &varname &varformat;
var frequency rowpercent prob;
 table category*varlable="", &varname="&varlable"*(frequency="N"*f=6. rowpercent="%"*f=6.2)*sum="" 
 ALL*prob*mean*f=10.4;
 run;
 %MEND;
 %MYCHI(PPGENDER, PPGENDER, genformat., fin.my_hcmst);
 
 DATA fin.my_hcmst;
    SET fin.my_hcmst;
    IF RELATIONSHIP_QUALITY = "5" THEN Excellent_Indicator = 1;
    ELSE IF NOT MISSING(RELATIONSHIP_QUALITY) THEN Excellent_Indicator = 0;
    ELSE Excellent_Indicator = .;
RUN;
%MYCHI(Excellent_Indicator,  Excellent_Indicator, eiformat., final.my_hcmst);