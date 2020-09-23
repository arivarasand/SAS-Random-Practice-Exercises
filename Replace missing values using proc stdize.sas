/*Replace missing values using proc stdize*/

data a;
input val;
cards;
20
.
47
.
62
53
84
run;

proc sort data=a ;
by val;
run;

proc stdize data=a out=new method=mean reponly;
var val;
run;









