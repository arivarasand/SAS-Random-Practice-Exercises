/* import FunRun.xlsx */
proc import datafile="/folders/myfolders/sasuser.v94/FunRun.xlsx"
out=FunRun
dbms='xlsx' replace;
getnames=yes;
run;


/* index creation using proc datasets */

option msglevel=I;
proc datasets lib=work;
modify new;
index create I2 =(stu_id class);
index delete stu_id from new;
run;

/* index creation using proc sql */
option msglevel=I;
proc sql;
create index stu_id on FunRun (stu_id);
   drop index stu_id from FunRun;
   create index Sid_class on FunRun(stu_id, class);
quit;





