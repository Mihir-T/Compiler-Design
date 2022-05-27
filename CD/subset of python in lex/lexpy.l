%{
    #include <stdio.h>
%}

identifier [a-zA-Z][a-zA-Z_0-9]+
number [0-9]+

%option noyywrap

%%

"def"   |
"if"    |
"elif"  |
"else"              {printf("%-20s %s\n", "Keyword", yytext);}

{identifier}        {printf("%-20s %s\n", "Identifier", yytext);}

"("                 {printf("%-20s %s\n", "Delimiter", yytext);}
")"                 {printf("%-20s %s\n", "Delimiter", yytext);}
":"                 {printf("%-20s %s\n", "Delimiter", yytext);}

\".*\"              {printf("%-20s %s\n", "Constant", yytext);}
{number}            {printf("%-20s %s\n", "Constant", yytext);}

">="    |
">"     |
"<"     |
"<="    |
"="     |
"=="    |
"!"                 {printf("%-20s %s\n", "Operator", yytext);}

\n      {;}
.       {;}

%%

void main(){
    yyin = fopen("./lexpy.py", "r");
    yylex();
    fclose(yyin);
}