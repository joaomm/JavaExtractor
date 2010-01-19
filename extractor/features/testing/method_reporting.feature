Feature: reporting methods informations
  Scenario Outline: identifying methods
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "method <method>"
  Examples:
    | file   | method         |
    | ClassA | my_method      |
    | ClassA | classB_method  |

  Scenario Outline: reporting method type
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "method <method>" with "type <type>"
  Examples:
    | file    | method          | type           |
    | ClassA  | classB_method   | ClassB<String> |
    | ClassA  | another_method  |     void       |
    | ClassA  | typeless_method |     void       |

  Scenario Outline: reporting parameters
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "<method>" with "parameter <parameter>"
  Examples:
    | file    | method          | parameter  |
    | ClassA  | classB_method   |     x      |
    | ClassA  | another_method  |     y      |
    | ClassA  | typeless_method |     x      |

  Scenario Outline: reporting local variables
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report that "<method>" uses "local variable" "<local_variable>"
  Examples:
    | file    | method          | local_variable  |
    | ClassA  | classB_method   |       c         |
    | ClassA  | another_method  |       i         |
    | ClassA  | another_method  |       j         |
    | ClassA  | typeless_method |       y         |
    | ClassA  | void_method     |       i         |

  Scenario Outline: reporting use of variables in return expressions
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report that "<method>" uses "<type>" "<variable>"
  Examples:
    | file    | method          | type           | variable     |
    | ClassA  | another_method  | parameter      |      y       |
    | ClassA  | another_method  | local variable |      j       |
    | ClassA  | typeless_method | local variable |      y       |
    | ClassA  | typeless_method | parameter      |      x       |

  Scenario Outline: reporting use of variables in assignments
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report that "<method>" uses "<type>" "<variable>"
  Examples:
    | file    | method        | type           | variable     |
    | ClassA  | classB_method | local variable |      c       |
    | ClassA  | another_method| attribute      | my_attribute |
    | ClassA  | void_method   | local variable |      i       |
    | ClassA  | void_method   | local variable |      k       |
    | ClassA  | void_method   | local variable |      l       |
    | ClassA  | void_method   | parameter      |      j       |
    | ClassA  | say_hello     | attribute      | my_attribute |

  Scenario Outline: reporting method calls
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report that "<method>" uses the method "<called_method>"
  Examples:
    | file    | method     | called_method      |
    | ClassA  | say_hello  | System.out.println |
    | ClassA  | say_hello  | typeless_method    |
    | ClassA  | my_method  | void_method        |
    | ClassA  | my_method  | typeless_method    |

  Scenario Outline: reporting use of variables when used as arguments to method call
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report that "<method>" uses "<type>" "<variable>"
  Examples:
    | file    | method    | type           | variable            |
    | ClassA  | say_hello | attribute      | protected_attribute |
    | ClassA  | say_hello | attribute      | static_attribute    |
    | ClassA  | say_hello | local variable |          x          |

