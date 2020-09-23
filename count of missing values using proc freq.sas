/*count of missing values using proc freq*/

data new;
input val $;
cards;
wwwww
.
zzzz
aaaaa
ffdg
run;

proc freq data=new nlevels;
tables val;
run;

