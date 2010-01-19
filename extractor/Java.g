grammar Java;

options{
    language = Ruby;
}

prog:
    statement+
    ;

statement:
    class_definition
    ;

class_definition
@init {
    class_def = ClassDefinition.new
}
    : modifier[class_def]
      CLASS
      (IDENTIFIER { class_def.name = $IDENTIFIER.text })
      ( class_name_parameters[class_def] )?
      (inheritance[class_def])?
      (interface[class_def])?
      class_body[class_def]
      {
        puts class_def.report
      }
    ;

class_name_parameters[class_def]
    : '<' { $class_def.name += '<'}
      ( class_special_identifier[class_def] )*
      '>' { $class_def.name += '>'}
    ;

class_special_identifier[class_def]
    : IDENTIFIER { $class_def.name += $IDENTIFIER.text}
    | ',' { $class_def.name += ", "}
    | '&' { $class_def.name += " & "}
    | '<' { $class_def.name += '<'}
    | '>' { $class_def.name += '>'}
    | EXTENDS { $class_def.name += " #{$EXTENDS.text} "}
    ;

inheritance[class_def]
    : EXTENDS IDENTIFIER { $class_def.add_parent($IDENTIFIER.text)}
    ;

interface[class_def]
    : IMPLEMENTS interface_name[class_def] (',' interface_name[class_def])*
    ;

interface_name[class_def]
    : IDENTIFIER { $class_def.add_interface($IDENTIFIER.text) }
    ;


class_body[class_def]
    :
    '{' member_definition[class_def]* '}'
    ;

member_definition[class_def]
    : attribute_definition[class_def]
    | method_definition[class_def]
    ;

attribute_definition[class_def]
@init {
    attribute = AttributeDefinition.new
    attributes = []
}
    :
    modifier[attribute] type[attribute] attributes_list[attribute, attributes] ';' {
        attributes.each do |attribute|
            $class_def.add_member(attribute)
        end
    }
    ;

attributes_list[attribute, attributes]
    : attribute_declarator[attribute, attributes]
      ( ',' attribute_declarator[attribute, attributes] )*
    ;

attribute_declarator[attribute_to_copy_from, attributes]
    : IDENTIFIER {
        new_attribute = AttributeDefinition.new
        new_attribute.name = $IDENTIFIER.text
        new_attribute.line = $IDENTIFIER.line
        new_attribute.type = attribute_to_copy_from.type
        new_attribute.copy_modifiers_from(attribute_to_copy_from)
        attributes << new_attribute
      }
      ( array_brackets[new_attribute] )*
      initialization?
    ;

initialization
    : '=' initializer
    ;

initializer
    : array_initializer
    | initializer_expression
    | 'new' IDENTIFIER '(' ')'
    ;

array_initializer
    : '{' (initializer (',' initializer)*)? '}'
    ;

initializer_expression
    : NUMBER
    ;

method_definition[class_def]
@init {
    method = MethodDefinition.new
}
    :
    modifier[method] (type[method])? IDENTIFIER parameters[method] method_body[method] {
        method.name = $IDENTIFIER.text
        method.line = $IDENTIFIER.line
        $class_def.add_member(method)
    }
    ;

method_body[method]
    :
    '{'
       ( body_statement[method] )*
     '}'
    ;

body_statement[method]
    : local_variable_declaration[method]
    | return_expression[method]
    | assign_operation[method]
    | method_call[method]
    ;

local_variable_declaration[method]
@init{
    dummy_variable = LocalVariableDefinition.new
    local_variables = []
}
    : variable_modifier type[dummy_variable] local_variable_list[dummy_variable, local_variables, method] ';'
    {
        local_variables.each do |local_variable|
            $method.add_local_variable(local_variable)
        end
        local_variables.each do |local_variable|
            $method.add_use_of(local_variable.name, local_variable.line) if local_variable.was_initialized?
        end
    }
    ;

local_variable_list[dummy_variable, local_variables, method]
    : local_variable_declarator[dummy_variable, local_variables, method]
      (',' local_variable_declarator[dummy_variable, local_variables, method])*
    ;

local_variable_declarator[dummy_variable, local_variables, method]
@init{
    local_variable = LocalVariableDefinition.new
}
    : IDENTIFIER {
        local_variable.name = $IDENTIFIER.text
        local_variable.line = $IDENTIFIER.line
        local_variable.type = dummy_variable.type
      }
      ('[' ']' { local_variable.type << "[]" })*
      (local_variable_initialization[method] { local_variable.was_initialized } )?
      {
        local_variables << local_variable
      }
    ;

local_variable_initialization[method]
    : '=' (constructor_call[method] | expression[method]*)
    ;

constructor_call[method]
    : 'new' IDENTIFIER '(' expression[method]* ')'
    {
       $method.add_method_call( "#{$IDENTIFIER.text} constructor", $IDENTIFIER.line)
    }
    ;

return_expression[method]
    : RETURN ( expression[method] )* ';'
    ;

method_call[method]
    : called_method_name[method] '(' arguments[method]? ')' ';'
    ;

called_method_name[method]
@init{
    method_name = ""
}
    : ( 'this''.' )?
      IDENTIFIER { method_name << $IDENTIFIER.text }
      fragment_of_called_method_name[method_name]*
      { $method.add_method_call(method_name, $IDENTIFIER.line) }
    ;

arguments[method]
    : first_argument[method] ( other_arguments[method] )*
    ;

first_argument[method]
    : argument[method]
    ;

other_arguments[method]
    : ',' argument[method]
    ;

argument[method]
    : expression[method]+
    ;

fragment_of_called_method_name[method_name]
    : '.' IDENTIFIER { $method_name << ".#{$IDENTIFIER.text}"}
    ;

assign_operation[method]
    : variable_name[method] assign_operator ( expression[method] )* ';'
    ;

variable_name[method]
@init{
  name = ""
}
    : ( 'this''.' { name << "this."} )? IDENTIFIER {
        name << $IDENTIFIER.text
        $method.add_use_of(name, $IDENTIFIER.line)
    }
    ;

expression[method]
    : variable_or_method_use[method]
    | any_expression[method]
    ;

variable_or_method_use[method]
@init {
    name = ""
    is_method = false
}
    : ( 'this''.' { name << "this." } )?
      ( IDENTIFIER {
        name << $IDENTIFIER.text
      } )
      ( '(' ')' { is_method = true} )?
    {
      if is_method
         $method.add_method_call(name, $IDENTIFIER.line)

      else
         $method.add_use_of(name, $IDENTIFIER.line)
      end
    }
    ;

any_expression[method]
    :'(' ( expression[method] )+ ')'
    | NUMBER
    | expression_operator
    | double_quoted_expression
    | single_quoted_expression
    ;

double_quoted_expression
    : '"' (IDENTIFIER | NUMBER | expression_operator | quoted_operator | '\'')*'"'
    ;

single_quoted_expression
    : '\'' (IDENTIFIER | NUMBER | expression_operator | quoted_operator | '"' )* '\''
    ;

assign_operator
    :   '='
    |   '+''='
    |   '-''='
    |   '*''='
    |   '/''='
    |   '&''='
    |   '|''='
    |   '^''='
    |   '%''='
    |   '<' '<' '='
    |   '>' '>' '>' '='
    |   '>' '>' '='
    ;

expression_operator
    : '+' | '-' | '*' | '/' | '%' | '=' | '?' | ':' | '&'
    | '|' | '^' | '>' | '<' | '!' | '.' | '[' | ']'
    ;


quoted_operator
    : '(' | ')' | '{' | '}' | '\\' | ';' | ',' | '~' | '@' | '#' | '$' | '\\"' | '\\\''
    ;


parameters[method]
    : '('
      (parameter_definition[method] )?
      ')'
    ;

parameter_definition[method]
@init{
    parameter = ParameterDefinition.new
}
    :
    variable_modifier type[parameter] IDENTIFIER {
        parameter.name = $IDENTIFIER.text
        $method.add_parameter(parameter)
    }
    ;

type[member]
    : type_name[member] (array_brackets[member])*
    ;

type_name[member]
    : (IDENTIFIER { $member.type = $IDENTIFIER.text })
      ( package_descriptors[member] )*
      ( type_argument[member] )?
    ;

package_descriptors[member]
    : '.' IDENTIFIER { $member.type += ".#{$IDENTIFIER.text}" }
    ;

type_argument[member]
    : '<' { $member.type += '<' }
      ( member_special_identifier[member] )*
      '>' { $member.type += '>' }
    ;

array_brackets[member]
    : '[' ']'  { $member.type += '[]' }
    ;

modifier[member]
    :
    ( PRIVATE      { $member.add_modifier('private')      }
    | PUBLIC       { $member.add_modifier('public')       }
    | PROTECTED    { $member.add_modifier('protected')    }
    | STATIC       { $member.add_modifier('static')       }
    | ABSTRACT     { $member.add_modifier('abstract')     }
    | FINAL        { $member.add_modifier('final')        }
    | NATIVE       { $member.add_modifier('native')       }
    | SYNCHRONIZED { $member.add_modifier('synchronized') }
    | TRANSIENT    { $member.add_modifier('transient')    }
    | VOLATILE     { $member.add_modifier('volatile')     }
    | STRICTFP     { $member.add_modifier('strictfp')     }
    )*
    ;

variable_modifier
    : (FINAL
    | ANNOTATION)*
    ;


member_special_identifier[member]
    : IDENTIFIER { $member.type += $IDENTIFIER.text}
    | ',' { $member.type += ", "}
    | '&' { $member.type += " & "}
    | '<' { $member.type += '<'}
    | '>' { $member.type += '>'}
    | EXTENDS { $member.type += " #{$EXTENDS.text} "}
    | '?' { $member.type += '?' }
    ;


/* LEXER */

NEW: 'new';

PRIVATE: 'private';

PUBLIC: 'public';

PROTECTED: 'protected';

STATIC: 'static';

ABSTRACT: 'abstract';

FINAL: 'final';

NATIVE: 'native';

SYNCHRONIZED: 'synchronized';

TRANSIENT: 'transient';

VOLATILE: 'volatile';

STRICTFP: 'strictfp';

CLASS : 'class';

EXTENDS: 'extends';

IMPLEMENTS: 'implements';

ANNOTATION: 'annotation';

RETURN: 'return';

WS : ('\n' | '\t' | '\r' | ' ')+ { $channel = 99 };

SEMICOLON: ';';

LEFT_ANGULAR_BRACKET: '<' ;

RIGHT_ANGULAR_BRACKET: '>' ;

COMMA: ',' ;

ECOMMERCIAL: '&' ;

LEFT_BRACE: '{' ;

RIGHT_BRACE: '}' ;

EQUAL: '=' ;

LEFT_PARENTESIS: '(' ;

RIGHT_PARENTESIS: ')' ;

DOT: '.' ;

LEFT_SQUARE_BRACKET: '[' ;

RIGHT_SQUARE_BRACKET: ']' ;

QUESTION_MARK: '?' ;

PLUS: '+';

MINUS: '-';

TIMES: '*';

MODULUS: '%';

COLON:  ':';

PIPE: '|';

WEDGE: '^';

EXCLATION_MARK: '!';

SLASH: '/';

BACKSLASH: '\\';

SINGLE_QUOTES: '\'';

DOUBLE_QUOTES: '"';

UNDERLINE: '_';

DOLLAR: '$';

AT: '@';

TILDE: '~';

HASH: '#';


NUMBER
    : DIGIT*;

fragment
DIGIT: ('0'..'9');

IDENTIFIER
    :
    INITIAL_LETTER (PARTIAL_LETTER)*
    ;

fragment
INITIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_');

fragment
PARTIAL_LETTER : ('a'..'z' | 'A'..'Z' | '_' | '0'..'9');

