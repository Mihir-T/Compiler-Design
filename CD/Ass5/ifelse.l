%option noyywrap
%{
#include"ifelse.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%

[ \t\n]	;
if 	return IF;
else	return ELSE;
[a-zA-Z][_a-zA-Z0-9]* return ID;
[0-9]+	return NUMBER;
"&&"	return AND;
"||"	return OR;
">"	return GT;
"<"	return LT;
"=="	return EQ;
"!="	return NE;
">="	return GE;
"<="	return LE;
"="	return EQU;
";"	return SC;
"{"	return OP;
"}"	return CP;
"("	return OB;
")"	return CB;

%%