/*find observations with repeated values */

data new;
input val $;
cards;
wwwww
hsgfdf
zzzz
aaaaa
ffdg
run;

data practice;
set new;
length value $ 20;
a=substr(val,1,1);
do i =2 to length(val);
if substr(val,i,1)=a then do;
value='repeated';
end;
else do;
value='not_repeated';
end;
end;
drop i a;
run;
