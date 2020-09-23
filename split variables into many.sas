/* Split Variables into many smaller variables*/

data new;
input val words $ 3-30 ;
cards;
1 my name is ari
2 i like sas
3 i like machine learning
4 when shall we write a fantastic code
run;

/*put max count of words into a macro*/
proc sql;
select max(countw(words)) into :maxcount from new;
%put &maxcount;

/*concatenate word and the maxcount of words into a macro*/
proc sql;
select cats("word",max(countw(words))) into :maxcountvar from new;
%put &maxcountvar;

data final;
set new;
array word(*)$ word1-&maxcountvar.;
do i =1 to &maxcount;
word[i]=scan(words,i," ");
end;
drop i ;
run;




