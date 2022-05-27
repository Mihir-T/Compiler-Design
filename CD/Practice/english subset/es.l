%{
#include<stdio.h>
%}
%%

[\t]+   ;


is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go {printf("%s: is a verb\n", yytext);} 

a |
an |
the {printf("%s: is an article\n", yytext);}

if |
then |
and |
but |
or |
so {printf("%s: is a conjunction\n", yytext);}

i |
me |
myself |
he |
her |
him |
she |
them |
they {printf("%s: this is a pronoun\n", yytext);}

besides |
between |
under |
after |
inside |
outside |
front |
near |
towards |
into |
onto |
at {printf("%s: this is a preposition\n", yytext);}

[a-zA-Z]+ {printf("%s: sorry could not recognized \n", yytext);}

.|\n {ECHO; /*normal default*/}
%%

main()
{
    yylex();
}

int yywrap()
{return(1);}