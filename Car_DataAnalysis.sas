
/*****Below Code is useful to find insight and based on that one can generate reports which will be helpful for mangerial team to take business Decision**************/

/*
Import CSV File into SAS
*/

proc import datafile = 'H:\Predective\Assignment Data\car_insurance_19.csv'
out = car_data dbms = csv replace;
run;
/*
To print 10 observation from imported CSV
*/
proc print data = car_data(obs=10);run;
/*
Code to find the distribution of different variables
*/
proc freq; table  Gender Vehicle_Class Vehicle_Size; run;
/*
Working on 3 variables Gender, Vehicle Size, Vehicle Class
Finding Average of Categorical Value
*/
Proc means; var Customer_Lifetime_Value; class Gender; run;
Proc means; var Customer_Lifetime_Value; class Vehicle_Size; run;
Proc means; var Customer_Lifetime_Value; class Vehicle_Class; run;

/*
Trying to find relationship between average lifetime value of Large size cars and med size cars
To meet the required condition,Creating new a new dataset which has only Large and Med Size Cars 
*/
data a2;
set car_data;
if  Vehicle_Size= "Large" or Vehicle_Size= "Medsize";
run;
/*Code to run t Test on new dataset*/
proc ttest;
var Customer_Lifetime_Value;
class Vehicle_Size;
run;

proc print data = a2(obs=10);run;

Proc ttest;
var Customer_Lifetime_Value;
class Gender;
run;
/*To test whether there is difference in customer lifetime value across different chanels*/
Proc anova;
class Sales_Channel;
model Customer_Lifetime_Value = Sales_Channel;
run;

/*Using ANOVA  to find which demographic factor is affeting customer lifetime vale*/
proc anova data =car_data; 
class Education;
model Customer_Lifetime_Value = Education ; run;

proc anova data = car_data; 
class Marital_Status;
model Customer_Lifetime_Value = Marital_Status ; run;

proc corr data = car_data;var Customer_Lifetime_Value Income  run;

