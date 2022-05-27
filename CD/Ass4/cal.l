%option noyywrap
%{
#include"cal.tab.h"
#include<math.h>
#include<stdlib.h>
%}
%%
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {yylval.dval=atof(yytext);return
NUMBER;}
dec |
CONVERT {return CONVERT;}
pt |
POWTEN {return POWTEN;}
pi |
PI {return PI;}
exp |
EXP {return EXP;}
log |
LOG {return LOG;}
ln  |
LN  { return LN;}
sin |
SIN {return SIN;} 
cos |
COS {return COS;}
tan |
TAN {return TAN;}
asin |
ASIN {return ASIN;}
acos |
ACOS {return ACOS;}
atan |
ATAN {return ATAN;}
sq |
SQUARE {return SQUARE;}
cube |
CUBE {return CUBE;}
sqrt |
SQRT {return SQRT;}
cbrt |
CBRT {return CBRT;}
fact |
FACTORIAL {return FACTORIAL;}
ceil |
CEILING {return CEILING;}
floor |
FLOOR {return FLOOR;}
cel |
CELSIUS {return CELSIUS;}
fah |
FAHRENHEIT {return FAHRENHEIT;}
kel |
KELVIN {return KELVIN;}
mem {return MEM;}
[\t];
\$ return 0;
\n|. return yytext[0];
%%