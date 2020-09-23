/* sort numeric values without using order by or proc sort*/

data a;
input val;
cards;
20
38
47
100
62
53
84
run;


/*count the number of variables in a*/

proc sql;
select count(*) into :count from a;
%put &count. ;

proc sql;
create table b 
(val num);

/*macro to add the min value of a into b and deleting that value in a*/

%macro new;
proc sql;
%do i =1 %to &count. ;
insert into b
select min(val) from a;

delete from a
where val in(select * from b);

%end;
%mend;
%new;

/*check if all the values are in sorted order now*/

proc print data = b;
run;









