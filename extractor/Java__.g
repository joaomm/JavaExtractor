lexer grammar Java;
options {
  language=Ruby;

}

T58 : 'this' ;
T59 : '\\"' ;
T60 : '\\\'' ;

// $ANTLR src "Java.g" 375
NEW: 'new';

// $ANTLR src "Java.g" 377
PRIVATE: 'private';

// $ANTLR src "Java.g" 379
PUBLIC: 'public';

// $ANTLR src "Java.g" 381
PROTECTED: 'protected';

// $ANTLR src "Java.g" 383
STATIC: 'static';

// $ANTLR src "Java.g" 385
ABSTRACT: 'abstract';

// $ANTLR src "Java.g" 387
FINAL: 'final';

// $ANTLR src "Java.g" 389
NATIVE: 'native';

// $ANTLR src "Java.g" 391
SYNCHRONIZED: 'synchronized';

// $ANTLR src "Java.g" 393
TRANSIENT: 'transient';

// $ANTLR src "Java.g" 395
VOLATILE: 'volatile';

// $ANTLR src "Java.g" 397
STRICTFP: 'strictfp';

// $ANTLR src "Java.g" 399
CLASS : 'class';

// $ANTLR src "Java.g" 401
EXTENDS: 'extends';

// $ANTLR src "Java.g" 403
IMPLEMENTS: 'implements';

// $ANTLR src "Java.g" 405
ANNOTATION: 'annotation';

// $ANTLR src "Java.g" 407
RETURN: 'return';

// $ANTLR src "Java.g" 409
WS : ('\n' | '\t' | '\r' | ' ')+ { $channel = 99 };

// $ANTLR src "Java.g" 411
SEMICOLON: ';';

// $ANTLR src "Java.g" 413
LEFT_ANGULAR_BRACKET: '<' ;

// $ANTLR src "Java.g" 415
RIGHT_ANGULAR_BRACKET: '>' ;

// $ANTLR src "Java.g" 417
COMMA: ',' ;

// $ANTLR src "Java.g" 419
ECOMMERCIAL: '&' ;

// $ANTLR src "Java.g" 421
LEFT_BRACE: '{' ;

// $ANTLR src "Java.g" 423
RIGHT_BRACE: '}' ;

// $ANTLR src "Java.g" 425
EQUAL: '=' ;

// $ANTLR src "Java.g" 427
LEFT_PARENTESIS: '(' ;

// $ANTLR src "Java.g" 429
RIGHT_PARENTESIS: ')' ;

// $ANTLR src "Java.g" 431
DOT: '.' ;

// $ANTLR src "Java.g" 433
LEFT_SQUARE_BRACKET: '[' ;

// $ANTLR src "Java.g" 435
RIGHT_SQUARE_BRACKET: ']' ;

// $ANTLR src "Java.g" 437
QUESTION_MARK: '?' ;

// $ANTLR src "Java.g" 439
PLUS: '+';

// $ANTLR src "Java.g" 441
MINUS: '-';

// $ANTLR src "Java.g" 443
TIMES: '*';

// $ANTLR src "Java.g" 445
MODULUS: '%';

// $ANTLR src "Java.g" 447
COLON:  ':';

// $ANTLR src "Java.g" 449
PIPE: '|';

// $ANTLR src "Java.g" 451
WEDGE: '^';

// $ANTLR src "Java.g" 453
EXCLATION_MARK: '!';

// $ANTLR src "Java.g" 455
SLASH: '/';

// $ANTLR src "Java.g" 457
BACKSLASH: '\\';

// $ANTLR src "Java.g" 459
SINGLE_QUOTES: '\'';

// $ANTLR src "Java.g" 461
DOUBLE_QUOTES: '"';

// $ANTLR src "Java.g" 463
UNDERLINE: '_';

// $ANTLR src "Java.g" 465
DOLLAR: '$';

// $ANTLR src "Java.g" 467
AT: '@';

// $ANTLR src "Java.g" 469
TILDE: '~';

// $ANTLR src "Java.g" 471
HASH: '#';


// $ANTLR src "Java.g" 474
NUMBER
    : DIGIT*;

// $ANTLR src "Java.g" 477
fragment
DIGIT: ('0'..'9');

// $ANTLR src "Java.g" 480
IDENTIFIER
    :
    INITIAL_LETTER (PARTIAL_LETTER)*
    ;

// $ANTLR src "Java.g" 485
fragment
INITIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_');

// $ANTLR src "Java.g" 488
fragment
PARTIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_' | '0'..'9');

