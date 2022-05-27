%option noyywrap
%{
int pi=0;
int ni=0;
int pf=0;
int nf=0;
%}
 
%%
[-][0-9]+ {ni++;}
[+]?[0-9]+ {pi++;}
[-][0-9]*\.[0-9]+ {nf++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
%%

int main()
{
yylex();
printf("\nTotal number of positive integers:%d",pi);
printf("\nTotal number of negative integers:%d",ni);
printf("\nTotal number of positive fractions:%d",pf);
printf("\nTotal number of negative fractions:%d",nf);
return 0;
}