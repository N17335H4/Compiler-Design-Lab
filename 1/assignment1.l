/*Lex code to count total number of tokens */

%{ 
int n = 0 ; 
int key = 0;
int op = 0;
int sep = 0;
int id = 0;
int con = 0;
%} 


%% 


"while"|"if"|"else"|"void" {key++;n++;fprintf(yyout, "\n keyword : %s", yytext);} 


"int"|"float"|"char"|"return" {key++;n++;fprintf(yyout, "\n keyword : %s", yytext);} 


[a-zA-Z_][a-zA-Z0-9_]* {id++;n++;fprintf(yyout, "\n identifier : %s", yytext);} 


">="|"<="|"=="|"="|"++"|"--"|"-"|"*"|"+"|"/" {op++;n++;fprintf(yyout, "\n operator : %s", yytext);} 


"<"|"|"|"!"|"!="|">"|"-="|"*="|"+="|"/=" {op++;n++;fprintf(yyout, "\n operator : %s", yytext);} 


[(){}|, ;:] {sep++;n++;fprintf(yyout, "\n separator : %s", yytext);} 


[0-9]*"."[0-9]+ {con++;n++;fprintf(yyout, "\n float-constant : %s", yytext);} 


[0-9]+ {con++;n++;fprintf(yyout, "\n integer-constant : %s", yytext);}						 

. ; 
%% 

int yywrap(){}

int main() 
{ 
	extern FILE *yyin, *yyout;
	yyin = fopen("Input.txt", "r");
	yyout = fopen("Output.txt", "w");
	yylex(); 	
	fprintf(yyout, "\n total no. of tokens = %d", n); 
	fprintf(yyout, "\n total no. of operator type tokens = %d", op); 
	fprintf(yyout, "\n total no. of separator type tokens = %d", sep); 
	fprintf(yyout, "\n total no. of identifier type tokens = %d", id); 
	fprintf(yyout, "\n total no. of keyword type tokens = %d", key); 
	fprintf(yyout, "\n total no. of constant type tokens = %d\n", con); 
} 
//character constants and string constants are not considered