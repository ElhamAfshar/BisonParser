%{
#include <stdio.h>
#include "lex.yy.c"
// stuff from flex that bison needs to know about:
extern FILE *yyin;
extern char *yytext;
void yyerror(char *s);


%}


%token while_kw 
%token openAcolad
%token closeAcolad
%token semicolon
%token equal
%token plus
%token openParenthese
%token closeParenthese
%token number
%token identifier

%start 	P

%%
P : P semicolon S 	{printf("P --> P ; S \n");}
| S	 {printf("P --> S \n");}
;

S: A	{printf("S --> A \n");}
| W	{printf("S -->W \n");}
;

A: identifier equal E {printf("A --> id = E \n");}
;

W: while_kw openParenthese E closeParenthese openAcolad P closeAcolad 	{printf("W --> while (E) {P} \n");}
;

E: E plus E	{printf("E --> E + E \n");}
| identifier 	{printf("E --> id \n");}
| number	{printf("E --> num \n");}
;


%%
int main()
{
	char fname[30];
        printf("pleas enter the name of file : \n");
        scanf("%s",fname);
	
	yyin = fopen(fname, "r");
		yyparse();

return 0;
  	 

}
void yyerror(char* sl)
{
	printf( "Error %s \n" ,sl );
	return;
}
