%{
%}
alpha [A-Za-z]
digit [0-9]
%%
[ \t\n]
and return AND;
or return OR;
but return BUT;
BUT return CBUT;  //Capital but
OR return COR;
AND return CAND;

{alpha}({alpha}|{digit})* return ID;

.  return yytext[0];
%%

/* used to check simple & compound stmts of English sentences.Compound stmt means stmt containg but,or,and,BUT,OR,AND(Capital).these are the possibilities.*/