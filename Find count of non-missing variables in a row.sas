/* Find count of non-missing variables in a row*/

data new;
input a b c d $;
cards;
. 1 2 3 
3 . . 4
5 . 6 2
f . . .
run;

/* count missing values using nmiss function*/
data final1;
set new;
missing=nmiss(of _all_)-1;
run;

/* count missing values using cmiss function*/
data final2;
set new;
missing=cmiss(of _all_)-1;
run;

/*Using Macro and dictionary.tables*/

proc sql;
select nvar into :n from  dictionary.tables
where memname=upcase('new')
and libname=upcase('work');

%put number of variables : &n. ;


data nonmissing;
set new;
non_missing= &n.-(cmiss(of _all_)-1);
title "count of non missing data";
run;





