%{ 

%} 


%% 


"while"|"if"|"else"|"void"|"break"|"switch"|"case"|"enum"|"register"|"do"|"static"|"signed"|"for"|"continue"|"unsigned" {fprintf(yyout, "Keyword ");} 


"auto"|"double"|"struct"|"int"|"float"|"char"|"return"|"long"|"short"|"const"|"union"|"extern"|"typedef" {fprintf(yyout, "Keyword ");} 


[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout, "identifier ");} 


">="|"<="|"=="|"="|"++"|"--"|"-"|"*"|"+"|"/" {fprintf(yyout, "operator ");} 


"<"|"|"|"!"|"!="|">"|"-="|"*="|"+="|"/=" {fprintf(yyout, "operator ");} 

"#"  {fprintf(yyout, "special character ");}


[(){}|,;:] {fprintf(yyout, "special character ");} 


[0-9]*"."[0-9]+ {fprintf(yyout, "constant ");} 


[0-9]+ {fprintf(yyout, "constant ");}						 

%% 

int yywrap(){}

int main() 
{ 
	extern FILE *yyin, *yyout;
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	yylex();
} 
//string is not considered yet