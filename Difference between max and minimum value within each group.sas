/*Difference between max and minimum value*/

data new;
input a;
cards;
3
45
67
88
23
456
45
run;

proc sql;
select range(a) as avg from work.new;

/*Difference between max and minimum value within each group*/

data new;
input id a;
cards;
1 3
1 45
1 67
1 88
2 23
2 456
2 45
run;

proc sql;
select id,range(a) as difference from new
group by id ;




