/* Sort character variables*/

data asd;
input x $ ;
cards;
a
y
c
g
h
j
run;

proc sort data=a out=new sortseq=linguistic; 
by x;
run;







