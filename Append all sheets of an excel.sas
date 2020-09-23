/* Append all sheets of an excel file into single SAS dataset*/

libname new xlsx "/folders/myfolders/sasuser.v94";

proc sql;
select memname ,libname from dictionary.tables
where upcase(libname)='jar';

proc sql;
select catx('.',libname,memname) into :sheet separated by " "
from dictionary.tables;
%put sheet;

data new;
set &sheet.
run;





