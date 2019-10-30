%{
	#include "y.tab.h"
%}

%%
[A-Za-z0-9]* {return STR;}
[#] {return HASH;}
['''] {return Trip_Quote;}
[\n] {return NL;}

%%
