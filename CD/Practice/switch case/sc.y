%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ID NUM SWITCH CASE BREAK DEFAULT OP LE GE EQ NE AND OR
%right '='
%left AND OR
%left '*' '/'
%left '-' '+'
%nonassoc UMINUS
%%

S : ST {printf("\nValid switch case statement\n");exit(0);} 
  ;
ST : SWITCH '(' ID ')' '{' BODY '}'
   ;
BODY : C
  | C D
  ;
C : C C
  | CASE OP ':' E ';'
  | CASE NUM ':' E ';'
  | CASE ID ':' E ';'
  | BREAK ';'
  ;
D : DEFAULT ':' E ';' BREAK ';'
  ;
E : ID'='E
  | E'+'E
  | E'-'E
  | E'*'E
  | E'/'E
  | E LE E
  | E GE E
  | E EQ E
  | E NE E
  | E AND E
  | E OR E
  | ID
  | NUM
  ;

%%

int main()
{
printf("\nEnter the statement:\n\n");
yyparse();
}
int yyerror(char *error)
{
printf("%s\n",error);
}
