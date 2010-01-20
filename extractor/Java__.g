lexer grammar Java;
options {
  language=Ruby;

}

T58 : 'this' ;
T59 : '\\"' ;
T60 : '\\\'' ;

// $ANTLR src "Java.g" 390
NEW: 'new';

// $ANTLR src "Java.g" 392
PRIVATE: 'private';

// $ANTLR src "Java.g" 394
PUBLIC: 'public';

// $ANTLR src "Java.g" 396
PROTECTED: 'protected';

// $ANTLR src "Java.g" 398
STATIC: 'static';

// $ANTLR src "Java.g" 400
ABSTRACT: 'abstract';

// $ANTLR src "Java.g" 402
FINAL: 'final';

// $ANTLR src "Java.g" 404
NATIVE: 'native';

// $ANTLR src "Java.g" 406
SYNCHRONIZED: 'synchronized';

// $ANTLR src "Java.g" 408
TRANSIENT: 'transient';

// $ANTLR src "Java.g" 410
VOLATILE: 'volatile';

// $ANTLR src "Java.g" 412
STRICTFP: 'strictfp';

// $ANTLR src "Java.g" 414
CLASS : 'class';

// $ANTLR src "Java.g" 416
EXTENDS: 'extends';

// $ANTLR src "Java.g" 418
IMPLEMENTS: 'implements';

// $ANTLR src "Java.g" 420
ANNOTATION: 'annotation';

// $ANTLR src "Java.g" 422
RETURN: 'return';

// $ANTLR src "Java.g" 424
WS : ('\n' | '\t' | '\r' | ' ')+ { $channel = 99 };

// $ANTLR src "Java.g" 426
SEMICOLON: ';';

// $ANTLR src "Java.g" 428
LEFT_ANGULAR_BRACKET: '<' ;

// $ANTLR src "Java.g" 430
RIGHT_ANGULAR_BRACKET: '>' ;

// $ANTLR src "Java.g" 432
COMMA: ',' ;

// $ANTLR src "Java.g" 434
ECOMMERCIAL: '&' ;

// $ANTLR src "Java.g" 436
LEFT_BRACE: '{' ;

// $ANTLR src "Java.g" 438
RIGHT_BRACE: '}' ;

// $ANTLR src "Java.g" 440
EQUAL: '=' ;

// $ANTLR src "Java.g" 442
LEFT_PARENTESIS: '(' ;

// $ANTLR src "Java.g" 444
RIGHT_PARENTESIS: ')' ;

// $ANTLR src "Java.g" 446
DOT: '.' ;

// $ANTLR src "Java.g" 448
LEFT_SQUARE_BRACKET: '[' ;

// $ANTLR src "Java.g" 450
RIGHT_SQUARE_BRACKET: ']' ;

// $ANTLR src "Java.g" 452
QUESTION_MARK: '?' ;

// $ANTLR src "Java.g" 454
PLUS: '+';

// $ANTLR src "Java.g" 456
MINUS: '-';

// $ANTLR src "Java.g" 458
TIMES: '*';

// $ANTLR src "Java.g" 460
MODULUS: '%';

// $ANTLR src "Java.g" 462
COLON:  ':';

// $ANTLR src "Java.g" 464
PIPE: '|';

// $ANTLR src "Java.g" 466
WEDGE: '^';

// $ANTLR src "Java.g" 468
EXCLATION_MARK: '!';

// $ANTLR src "Java.g" 470
SLASH: '/';

// $ANTLR src "Java.g" 472
BACKSLASH: '\\';

// $ANTLR src "Java.g" 474
SINGLE_QUOTES: '\'';

// $ANTLR src "Java.g" 476
DOUBLE_QUOTES: '"';

// $ANTLR src "Java.g" 478
UNDERLINE: '_';

// $ANTLR src "Java.g" 480
DOLLAR: '$';

// $ANTLR src "Java.g" 482
AT: '@';

// $ANTLR src "Java.g" 484
TILDE: '~';

// $ANTLR src "Java.g" 486
HASH: '#';


// $ANTLR src "Java.g" 489
NUMBER
    : DIGIT*;

// $ANTLR src "Java.g" 492
fragment
DIGIT: ('0'..'9');

// $ANTLR src "Java.g" 495
IDENTIFIER
    :
    INITIAL_LETTER (PARTIAL_LETTER)*
    ;

// $ANTLR src "Java.g" 500
fragment
INITIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_');

// $ANTLR src "Java.g" 503
fragment
PARTIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_' | '0'..'9');

