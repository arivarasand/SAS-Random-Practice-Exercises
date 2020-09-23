/*How to pick every nth row from a dataset*/

data new;
input xyz $;
val=_n_; 
cards;
a
b
c
d
e
f
g
h
run;

/*program to select every 2nd row using mod function*/

data test1;
set new;
if mod(_n_,2);
run;

proc print data=test1;
run;





/*program to select every 2nd row using point= temporary option */

data test2;
do obs=2,4,6,8;
set new point=obs;
output;
end;
stop;
run;

/*program to select every 2nd row using point= temporary option and nobs=temporary option*/


data test2;
do obs=2 to n by 2;
set new point=obs nobs=n;
output;
end;
stop;
run;

proc print data=test2 noobs;
run;

/*program to select every 2nd row using MACROS*/

data test3;
set new;
run;


proc sql;
select count(*) into :count 
from test3;

% put total_observations are &count;

data every_sec;
do obs=2 to &count.;
set new point=obs nobs=&count.;
output;
end;
stop;
run;

proc print data=every_sec noobs;
title "select every 2nd row using MACROS";
run;