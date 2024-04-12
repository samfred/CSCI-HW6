
%{
static int i_seen = 0;
%}

WC		[A-Za-z']
NW		[^A-Za-z']

%start		INW NIW

%%

\\[^ \n]+	ECHO;

{NW}		{ BEGIN NIW; i_seen = 0; ECHO; }
[.!?]$		{ BEGIN NIW; i_seen = 0;
		  printf("%c\nBork Bork Bork!",yytext[0]); }

%%

\\[^ \n]+	ECHO;
<NIW>"bork"/{NW} ECHO;
<NIW>"Bork"/{NW} ECHO;

"lol" {  BEGIN INW; printf("laugh out loud"); }
"asap" {  BEGIN INW; printf("as soon as possible"); }
"afaik" {  BEGIN INW; printf("as far as I know"); }
"b4" {  BEGIN INW; printf("before"); }
"bf" {  BEGIN INW; printf("boyfriend"); }
"bff" {  BEGIN INW; printf("best friends forever"); }
"brb" {  BEGIN INW; printf("be right back"); }
"bsod" {  BEGIN INW; printf("blue screen of death"); }
"btw" {  BEGIN INW; printf("by the way"); }
"cu" {  BEGIN INW; printf("see you"); }
"dftba" {  BEGIN INW; printf("don't forget to be awesome"); }
"dnd" {  BEGIN INW; printf("do not disturb"); }
"faq" {  BEGIN INW; printf("frequently asked questions"); }
"foaf" {  BEGIN INW; printf("friend of a friend"); }
"ftw" {  BEGIN INW; printf("for the win"); }
"fyi" {  BEGIN INW; printf("for your information"); }
"gf" {  BEGIN INW; printf("girlfriend"); }
"gg" {  BEGIN INW; printf("good game"); }
"gl" {  BEGIN INW; printf("good luck"); }
"glhf" {  BEGIN INW; printf("good luck have fun"); }

.		{ BEGIN INW; ECHO; }
