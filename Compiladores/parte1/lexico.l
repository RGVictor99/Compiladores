identificador [_a-zA-Z]([a-zA-Z0-9])*
numero[0-9]+
espaco[ \t]+
novalinha[\n]

%x coment

%{
    int nlin = 0;
%}

%%

programa    printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
inicio      printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
fimprograma printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);

leia        printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
escreva     printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);

se          printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
entao       printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
senao       printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
fimse       printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);

enquanto    printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
faca        printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
fimenquanto printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);

"+"         printf("%3d|%11s:_operador_aritmetico_soma\n",nlin,yytext);
"-"         printf("%3d|%11s:_operador_aritmetico_subtracao\n",nlin,yytext);
"*"         printf("%3d|%11s:_operador_aritmetico_multiplicacao\n",nlin,yytext);
div         printf("%3d|%11s:_operador_aritmetico_divisao\n",nlin,yytext);

">"         printf("%3d|%11s:_operador_relacional_maior\n",nlin,yytext);
"<"         printf("%3d|%11s:_operador_relacional_menor\n",nlin,yytext);
"="         printf("%3d|%11s:_operador_relacional_igual\n",nlin,yytext);

e           printf("%3d|%11s:_operador_logico_conjuncao\n",nlin,yytext);
ou          printf("%3d|%11s:_operador_logico_disjuncao\n",nlin,yytext);
nao         printf("%3d|%11s:_operador_logico_negacao\n",nlin,yytext);

"<-"        printf("%3d|%11s:_operador_de_atribuicao\n",nlin,yytext);
"("         printf("%3d|%11s:_simbolo_abre_parenteses\n",nlin,yytext);
")"         printf("%3d|%11s:_simbolo_fecha_parenteses\n",nlin,yytext);

inteiro     printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
logico      printf("%3d|%11s:_palavra_reservada\n",nlin,yytext);
"V"         printf("%3d|%11s:_constante_logica_de_verdade\n",nlin,yytext);
"F"         printf("%3d|%11s:_constante_logica_de_falsidade\n",nlin,yytext);
"//".*      ;

"/*"           BEGIN(coment);
<coment>"*/"   BEGIN(INITIAL);
<coment>.       ;
<coment>\n     nlin++;

{identificador} printf("%3d|%11s:_identificador\n",nlin,yytext);
{numero}        printf("%3d|%11s:_numero\n",nlin,yytext);
{espaco}        ;
{novalinha}     nlin++;
.               printf("%3d|%11s:_ERRO_-_SIMBOLO_NAO_RECONHECIDO\n",nlin,yytext);

%%

int yywrap() { return 1; }

int main(){
    yylex();
    return 0;
}