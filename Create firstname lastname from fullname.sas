/* Create firstname lastname from fullname*/

data new;
input fullname $ 1-20;
datalines;
james bond
sachin tendulkar
abdul kalam
run;

/*Using scan function to split names*/

data final;
set new;
first_name=scan(fullname,1," ");
Last_name =scan(fullname,2," ");
run;









