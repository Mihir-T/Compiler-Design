%option noyywrap
%{
#include<stdio.h>
#include<string.h>
int i=0;
%}
%%
([a-zA-Z0-9])* {i++;}
"\n" {printf("Number of words %d",i);}
%%
int main()
{
  yylex();
  return 0;
}