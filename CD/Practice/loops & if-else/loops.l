%{
#include<stdio.h>
#include<string.h>
#include<conio.h>
#include<stdlib.h>
#include"loops.tab.h"
%}
num	[0-9]+
id	[a-zA-Z]+	
%%
"do"	{return DO;}
"while" {return WHILE;}
"for"	{return FOR;}
"if"	{return IF;}
"else" {return ELSE;}
{num}	{return NUMBER;}
{id}	{return ID;}
"&&"	return AND;
"||"	return OR;
">"	return GT;
"<"	return LT;
"=="	return EQ;
"!="	return NE;
">="	return GE;
"<="	return LE;
"="	return EQU;
"++" return INCR;
"--" return DECR;
[ \n\t]	; 
.	{return *yytext;}
%%
int yywrap(){return 1;}