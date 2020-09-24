/*Compare each observation with all values of a variable*/

data Country;
	input country$ 1-20;
	cards;
india
pakistan
germany
china
run;

data lines;
	input line $ 1-30;
	cards;
i am from germany
k2 is in pakistan
everest is in nepal
kanchanjunga is in india
run;

proc sql;
	select count(country) into:count from country;
	select cats("'", country, "'") into:country separated by " " from country;
	%put &count.;
	%put &country.;

data new;
	set lines;
	array new(&count) $ _temporary_ (&country);
	find_flag='N';

	do i=1 to &count;

		if find(line, strip(new(i))) gt 0 then
			find_flag='Y';
	end;
	drop i;
run;