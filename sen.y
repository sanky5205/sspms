%{
#include<stdio.h>
#include<stdlib.h>
%}
%token AND OR BUT CAND COR CBUT ID   //tokens collected from lex 							//pgm
		
%%
S : ST {printf("Compound statement\n"); } (ST means statement ST:ID AND ID'.'   //pattern for compound stmt.Here ID means any    				//text
	|ID OR ID'.'
        |ID BUT ID'.' //format(for eg. he and she.(full stop))
	|ID CAND ID'.'
	|ID COR ID'.'
	|ID CBUT ID'.'
    	;	

%%

#include "lex.yy.c"

main()
{

yyin=fopen("input.txt","r");  //this file contains some english 						//stmnts
 yyparse();   
fclose(yyin);
exit(0);
} 
int yywrap()  
{  
return 0;  
}  
yyerror(){
printf("simple statement\n");
}
