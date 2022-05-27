%{
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<math.h>
double memvar;

float pi(int x)
{
	float ans;
	ans = pow(3.14159,x);
	return ans;
}

float kel(float k)
{	
	float celsius,fahrenheit;
 	celsius=k-273.15;
	fahrenheit=celsius*9/5+32;
	printf("\nFahrenheit = %.2f  and Celsius = %.2f\n", fahrenheit, celsius);
      exit(0);
}

float fah(float f)
{	
     float celsius,kelvin;
     celsius=(f-32)*5/9;
     kelvin=celsius-273.15;
     printf("\nCelsius = %.2f  and Kelvin = %.2f\n", celsius, kelvin);
     exit(0);
}

float cel(float c)
{
     float kelvin,fahrenheit;
     kelvin=c+273.15;
     fahrenheit=c*9/5+32;
     printf("\nFahrenheit = %.2f and Kelvin = %.2f\n",fahrenheit, kelvin);
     exit(0);	
}

int call(int num)
{

    printf("\nBinary number = ");
    convert(num, 2);
    printf("\n");
    printf("\nOctal number = ");
    convert(num, 8);
    printf("\n");
    printf("\nHexadecimal number = ");
    convert(num, 16);
    printf("\n\n");
    exit(0);
}

void convert(int num, int base)
{
        int rem = num%base;

        if(num==0)
                return;
        convert(num/base, base);

        if(rem < 10)
                printf("%d", rem);
        else
                printf("%c", rem-10+'A' );
}

float factorial(int n)
{
  int c;
  float result = 1;
 
  for (c = 1; c <= n; c++)
    result = result * c;
 
  return result;
}

%}
%union
{
double dval;
}
%token<dval>NUMBER
%token<dval>MEM
%token POWTEN PI EXP LOG LN SIN COS TAN ASIN ACOS ATAN SQUARE CUBE SQRT CBRT FACTORIAL CEILING FLOOR CONVERT CELSIUS FAHRENHEIT KELVIN
%left '-' '+'
%left '*' '/' '%'
%right '^'
%left POWTEN PI EXP LOG LN SIN COS TAN ASIN ACOS ATAN SQUARE CUBE SQRT CBRT FACTORIAL CEILING FLOOR CONVERT CELSIUS FAHRENHEIT KELVIN
%nonassoc UMINUS
%type<dval>expression
%%
start:statement'\n'
|start statement'\n'
;

statement:MEM'='expression {memvar=$3;}
| expression {printf("\nThe result is = %g\n",$1);
main();
}
;
expression:expression'+'expression {$$=$1+$3;}
| expression '-' expression {$$=$1-$3;}
| expression '*' expression {$$=$1*$3;}
| expression '/' expression
{ if($3==0)
yyerror("Cannot divide by zero!");
else
$$=$1/$3;
}
|expression '%' expression {$$=fmod($1,$3);}
|expression '^' expression {$$=pow($1,$3);}
;
expression:'-'expression %prec UMINUS{$$=-$2;}
|'('expression')'{$$=$2;}
|'['expression']'{$$=$2;}
|POWTEN expression {$$=pow(10,$2);}
|PI expression {$$=pi($2);}
|EXP expression {$$=exp($2);}
|LOG expression 
{if ($2<0)
{printf("Enter a positve integer!\n");
exit(0);}
else
$$=log($2)/log(10);}
|LN expression 
{if ($2<0)
{printf("Enter a positve integer!\n");
exit(0);}
else
$$=log($2);}
|SIN expression {$$=sin($2*3.14159/180);}
|COS expression {$$=cos($2*3.14159/180);}
|TAN expression 
{ if ($2==90 || $2==270)
{printf("Result = Not defined\n");
exit(0);}
else
$$=tan($2*3.14159/180);}
|ASIN expression {$$=round(asin($2)*180/3.14159);}
|ACOS expression {$$=round(acos($2)*180/3.14159);}
|ATAN expression {$$=round(atan($2)*180/3.14159);}
|SQUARE expression {$$=$2*$2;}
|CUBE expression {$$=$2*$2*$2;}
|SQRT expression {$$=sqrt($2);}
|CBRT expression {$$=cbrt($2);}
|FACTORIAL expression 
{ if ($2<0)
{printf("Enter a positve integer!\n");
exit(0);}
else
$$=factorial((int)$2);}
|CEILING expression {$$=ceil($2);}
|FLOOR expression {$$=floor($2);}
|CONVERT expression 
{if ($2<0)
{printf("Enter a positve integer!\n");
exit(0);}
else
$$=call($2);}
|CELSIUS expression {$$=cel($2);}
|FAHRENHEIT expression {$$=fah($2);}
|KELVIN expression {$$=kel($2);}
|NUMBER {$$=$1;}
|MEM {$$=memvar;}
;
%%
int main()
{
printf("\nEnter your mathematical expression: ");
yyparse();
}
int yyerror(char *error)
{
printf("%s\n",error);
}