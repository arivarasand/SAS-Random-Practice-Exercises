/* Append a SAS dataset n number of times*/

data new;
input name $;
cards;
a
b
run;

proc append base=want 
data=new;
run;

proc print data=want;
run;

/*append using macros*/

%macro new;
%do i =1 %to 10;
proc append base=usingmacro 
data=new;
run;
%end;
%mend;
%new;







