%{
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
%}
%token FOR ID AND OR LT GT LE GE EQ NE EQU INCR DECR NUMBER DO WHILE IF ELSE
%%
prg: FOR '(' exp ';' exp ';' exp ')' body 	{printf("\nfor loop accepted\n");exit(0);}
| WHILE '(' exp ')' body			{printf("\nwhile loop accepted\n");exit(0);}
| DO block WHILE '(' exp ')' ';'		{printf("\ndo while loop accepted\n");exit(0);}
| IF '(' exp ')' body				{printf("\nIF statement accpeted\n");exit(0);}
| IF '(' exp ')' body	ELSE body		{printf("\nIF-ELSE accepted\n");exit(0);}
;
body: stmt
| block
;
block:'{' s '}'
;
s: s stmt
|
;
stmt: exp ';'
;
exp: secondexp			/*loop exp does not ends with semi*/
|				/*loop segments can be blank*/
;
secondexp: secondexp ',' thirdexp		/*comma separated exp*/
|thirdexp
|'(' secondexp ')'			/*use braces for prio*/
;
thirdexp: ID '+' thirdexp
| ID '-' thirdexp
| ID '*' thirdexp
| ID '/' thirdexp
| ID AND thirdexp
| ID OR thirdexp
| ID LT thirdexp
| ID GT thirdexp
| ID LE thirdexp
| ID GE thirdexp
| ID NE thirdexp
| ID EQ thirdexp
| ID EQU thirdexp
| ID INCR 
| ID DECR 
| INCR ID
| DECR ID
| ID
| NUMBER
;
%%
main()
{
yyparse();
}
yyerror(char *s)
{
printf("error");
}