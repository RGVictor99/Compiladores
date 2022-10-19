%%
#[a-z0-9A-Z]+   printf("%s\n", yytext);
.   ;
\n  ;
%%
int yywrap() { return 1; }
int main () { 
    yylex(); 
}

