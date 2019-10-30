%{
	#include <stdio.h>
	#include <stdlib.h>
%}

%token CLN NL EQL L_Paren R_Paren NEQ EQ GT LT EGT ELT OR AND NOT ID DD QUOTE STR Trip_Quote HASH

%%
StartDebugger : StartParse {printf("Input Accepted \n"); exit(0);};
/*StartParse : 'if' bool_exp CLN NL ID suite ('elif' bool_exp CLN NL ID suite)* ['else' CLN NL ID suite]*/

StartParse : comment | import_stmt ;
comment : HASH STR | Trip_Quote STR multiline_comment ;
multiline_comment : Trip_Quote | STR NL multiline_comment ;
import_stmt : "import" STR;

%%
#include "lex.yy.c"

int yyerror(const char *msg)
{
	printf("Error in Parser \n");
	exit(0);
}

int main()
{
	printf("Enter the Expression: ");
	yyparse();
	return 0;
}
