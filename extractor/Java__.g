lexer grammar Java;
options {
  language=Ruby;

}

T58 : 'this' ;
T59 : '\\"' ;
T60 : '\\\'' ;

// $ANTLR src "Java.g" 387
NEW: 'new';

// $ANTLR src "Java.g" 389
PRIVATE: 'private';

// $ANTLR src "Java.g" 391
PUBLIC: 'public';

// $ANTLR src "Java.g" 393
PROTECTED: 'protected';

// $ANTLR src "Java.g" 395
STATIC: 'static';

// $ANTLR src "Java.g" 397
ABSTRACT: 'abstract';

// $ANTLR src "Java.g" 399
FINAL: 'final';

// $ANTLR src "Java.g" 401
NATIVE: 'native';

// $ANTLR src "Java.g" 403
SYNCHRONIZED: 'synchronized';

// $ANTLR src "Java.g" 405
TRANSIENT: 'transient';

// $ANTLR src "Java.g" 407
VOLATILE: 'volatile';

// $ANTLR src "Java.g" 409
STRICTFP: 'strictfp';

// $ANTLR src "Java.g" 411
CLASS : 'class';

// $ANTLR src "Java.g" 413
EXTENDS: 'extends';

// $ANTLR src "Java.g" 415
IMPLEMENTS: 'implements';

// $ANTLR src "Java.g" 417
ANNOTATION: 'annotation';

// $ANTLR src "Java.g" 419
RETURN: 'return';

// $ANTLR src "Java.g" 421
WS : ('\n' | '\t' | '\r' | ' ')+ { $channel = 99 };

// $ANTLR src "Java.g" 423
SEMICOLON: ';';

// $ANTLR src "Java.g" 425
LEFT_ANGULAR_BRACKET: '<' ;

// $ANTLR src "Java.g" 427
RIGHT_ANGULAR_BRACKET: '>' ;

// $ANTLR src "Java.g" 429
COMMA: ',' ;

// $ANTLR src "Java.g" 431
ECOMMERCIAL: '&' ;

// $ANTLR src "Java.g" 433
LEFT_BRACE: '{' ;

// $ANTLR src "Java.g" 435
RIGHT_BRACE: '}' ;

// $ANTLR src "Java.g" 437
EQUAL: '=' ;

// $ANTLR src "Java.g" 439
LEFT_PARENTESIS: '(' ;

// $ANTLR src "Java.g" 441
RIGHT_PARENTESIS: ')' ;

// $ANTLR src "Java.g" 443
DOT: '.' ;

// $ANTLR src "Java.g" 445
LEFT_SQUARE_BRACKET: '[' ;

// $ANTLR src "Java.g" 447
RIGHT_SQUARE_BRACKET: ']' ;

// $ANTLR src "Java.g" 449
QUESTION_MARK: '?' ;

// $ANTLR src "Java.g" 451
PLUS: '+';

// $ANTLR src "Java.g" 453
MINUS: '-';

// $ANTLR src "Java.g" 455
TIMES: '*';

// $ANTLR src "Java.g" 457
MODULUS: '%';

// $ANTLR src "Java.g" 459
COLON:  ':';

// $ANTLR src "Java.g" 461
PIPE: '|';

// $ANTLR src "Java.g" 463
WEDGE: '^';

// $ANTLR src "Java.g" 465
EXCLATION_MARK: '!';

// $ANTLR src "Java.g" 467
SLASH: '/';

// $ANTLR src "Java.g" 469
BACKSLASH: '\\';

// $ANTLR src "Java.g" 471
SINGLE_QUOTES: '\'';

// $ANTLR src "Java.g" 473
DOUBLE_QUOTES: '"';

// $ANTLR src "Java.g" 475
UNDERLINE: '_';

// $ANTLR src "Java.g" 477
DOLLAR: '$';

// $ANTLR src "Java.g" 479
AT: '@';

// $ANTLR src "Java.g" 481
TILDE: '~';

// $ANTLR src "Java.g" 483
HASH: '#';


// $ANTLR src "Java.g" 486
NUMBER
    : DIGIT*;

// $ANTLR src "Java.g" 489
fragment
DIGIT: ('0'..'9');

// $ANTLR src "Java.g" 492
IDENTIFIER
    :
    INITIAL_LETTER (PARTIAL_LETTER)*
    ;

// $ANTLR src "Java.g" 497
fragment
INITIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_');

// $ANTLR src "Java.g" 500
fragment
PARTIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_' | '0'..'9');

