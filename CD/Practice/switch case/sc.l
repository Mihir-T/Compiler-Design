%option noyywrap
%{
#include"sc.tab.h"
#include<stdio.h>
%}
alpha [a-zA-Z_]
digit [0-9]
%%
[ \t\n] ;
switch {return SWITCH;}
case {return CASE;}
break {return BREAK;}
default {return DEFAULT;}
{digit}+ {return NUM;}
{alpha}({alpha}|{digit}*) {return ID;}
"+"|"-"|"*"|"/" {return OP;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NE;}
"||" {return OR;}
"&&" {return AND;}
\$ return 0;
\n|. return yytext[0];
%%

