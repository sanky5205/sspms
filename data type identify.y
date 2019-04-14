
%{

#include<stdio.h>
#include<stdlib.h>
%}
%token ID PUBLIC PRIVATE PROTECTED INT SHORT  FLOAT LONG DOUBLE CHAR STRING FNUM NUM EQ AL   //type of tokens taken from lex pgm
%right '='
%%

S 	: ST {printf("input accepted\n"); exit(0);}

ST 	:E2 ';'  //for syntax - access_specifier datatype variable;
	|E ';'   //for syntax-datatype variable; 
    ;
E 	:
       INT ID EQ NUM   //variable initialzation possible patterns 
	|FLOAT ID EQ FNUM
	|CHAR ID EQ AL
	|LONG ID EQ NUM
	|DOUBLE ID EQ FNUM
	|SHORT ID EQ NUM     //
        |INT ID    //variable declaration possible patterns 
	|FLOAT ID
	|CHAR ID
	|LONG ID
	|DOUBLE ID
	|SHORT ID   //
	;
E2 	:PUBLIC E  
	|PRIVATE E
	|PROTECTED E
	;
%%

#include "lex.yy.c"
void main()
{
printf("enter the exp: ");
yyparse();   //inbuild function
}

int yywrap()
{
return 0;
}
yyerror()
{
printf("parse error\n");
}
/*else
{
printf("Input accepted");
}*/

/* ************output****************
[student@localhost ~]$ lex if.l
[student@localhost ~]$ yacc -d datatype.y
[student@localhost ~]$ gcc y.tab.c
[student@localhost ~]$ ./a.out
enter the exp: 
int a=5;
input accepted
[student@localhost ~]$ ./a.out
enter the exp: int a=5.5;         
parse error
[student@localhost ~]$ ./a.out
enter the exp: 
public int a=5;
input accepted
********************** */

/* Yacc is used to generate syntax tree (2nd phase of compiler-syntax analysis).It takes tokens from lex(internally calls lex)& generates parse tree.It is used to Checked syntactically correct statements. */

