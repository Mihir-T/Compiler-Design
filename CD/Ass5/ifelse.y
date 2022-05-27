%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER ID IF ELSE AND OR LT GT LE GE EQ NE EQU SC OB CB OP CP 
%%

if:   IF OB cond CB body ELSE body { printf("\nparsing successful\n"); exit(0); }|
      IF OB cond CB ELSE body { printf("\nparsing not succssful...if body missing\n"); exit(0); };
body:	OP stmts CP |
	stmt SC ;
stmts:stmt SC stmts |
	stmt SC ;
stmt:	ID EQU f;
cond:	scond AND cond |
	scond OR cond |
	scond ;
scond:f relop f ;
f:	ID | 
	NUMBER;
relop:LT | GT | LE | GE | EQ | NE;
		  	

%%

void yyerror(const char *str) {
	printf("\nError\n");
	exit(0);
}

int main() {
    printf("\nEnter if else statement:\n\n");
    yyparse();
}
