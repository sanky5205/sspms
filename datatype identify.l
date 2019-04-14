

%{
%}
alpha [A-Za-z]
digit [0-9]
%%
[ \t\n]
int return INT;
short return SHORT;
float return FLOAT;
long return LONG;
double return DOUBLE;
char return CHAR;
String return STRING;
{digit}+ return NUM;  //regular expression for whole number 
[0-9]+.[0-9]* return FNUM;   //regular expression for floatimg                  						//point number 

"public" return PUBLIC;
"private" return PRIVATE;
"protected" return PROTECTED;
alpha return AL;
{alpha}({alpha}|{digit})* return ID;

"=" return EQ;

.  return yytext[0];
%%


/* This is lex file which generates tokens depending upon given pattern.Variable declaration in java is made as either -
syntax - Access_specifier  datatype  variable_name ;
OR datatype  variable_name ;(ny default public) */

