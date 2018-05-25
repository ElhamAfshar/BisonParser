%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "test.tab.h"

%}
ws [\t\n]+
id [a-zA-Z]
digit [0-9]

%%

"while"                {return while_kw ;}
"{"                    {return openAcolad;}
"}"                    {return closeAcolad;}
";"                    {return semicolon;}
"="                    {return equal;}
"("                    {return openParenthese;}
")"                    {return closeParenthese;}
"+"                    {return plus;}
{digit}+               { return number;}
{id}+                  { return identifier;}
 
{ws}                  /* do nothing */
" "
.                      {}
              
%%



