/*How to split a character variable at upper case letter*/

Data new;
input fullname $ 1-16;
cards;
SachinTendulkar
AbdulKalam
run;

/* anyupper function */

Data new2;
set new;
first_name=substr(fullname,1,anyupper(fullname,2)-1);
last_name=substr(fullname, anyupper(fullname,2));
run;

