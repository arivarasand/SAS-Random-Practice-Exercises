                        /*Optimization techiques in sas*/


Data new;
	set sashelp.cars;
run;


/*Use KEEP= or DROP= data set options to retain desired variables*/
/*Use WHERE statements, WHERE= data set option, or WHERE clauses to subset SAS datasets*/


data optimised;
	set sashelp.cars
(keep=make Model Type Origin);
	where upcase(make)='AUDI';
run;



/*The CLASS statement provides the ability to perform by-group processing without
the need for data to be sorted first in a separate step.CPU time can be saved
when data is not already in the desired order*/
proc means data=new;
	var Model Type Origin;
	class state;
run;

/*By using IF-THEN/ELSE statements opposed to IF THEN statements without the ELSE,
the SAS System stops processing the conditional logic
once a condition holds true for any observation.*/
data b;
	set new;

	if Model='Audi' then
		Range='Top_end';
	else if Model='Acura' then
		Range='Mid_end';
	else if state='Chrysler' then
		Range='Mid_end';
run;

/*To avoid using default lengths for variables in a SAS dataset, use the LENGTH statement.
Significant space can be saved for numeric variables containing integers
since the 8-byte default length is reduced to the specified size.
Storage space can be reduced.*/
/*PROC SQL can be used to simplify and consolidate
coding requirements and save programming time.*/


proc sql;
	select * from new where upcase(make)='AUDI' order by name;
quit;


/*To improve data storage and I/O requirements, consider compressing large datasets.*/


Data new (compress=yes);
	set sashelp.cars;
run;


/*Use of index and then the sasfile statement on a very large dataset*/

proc datasets library=work;
modify new;
index create i2=(Make Type Origin);
run;
 
sasfile <work.new> open;  /* to put the data into memory*/
sasfile <work.new> close; 

