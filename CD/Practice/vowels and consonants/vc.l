%{
//hit enter after the string then press Ctrl+Z then hit enter to get output
#include<stdio.h>
int vc = 0;
int cc = 0;
%}

%%
[aeiouAEIOU] {vc++;}
[a-zA-Z] {cc++;}
%%

int yywrap(){return 1;}

int main()
{
printf("Enter a string : ");
yylex();
printf("\n No. of vowels = %d", vc);
printf("\n No. of consonants = %d\n", cc);
return 0;
}