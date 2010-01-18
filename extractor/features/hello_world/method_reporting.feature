Feature: reporting methods informations
  Scenario Outline: identifying methods
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "method <method>"
  Examples:
    | file       | method         |
    | HelloWorld | HelloWorld     |
    | HelloWorld | say            |
    | HelloWorld | destroy        |
    | HelloWorld | private_method |
    | Main       | main           |

  Scenario Outline: reporting method modifiers
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "<method>" with "modifier <modifier>"
  Examples:
    | file       | method         | modifier |
    | HelloWorld | HelloWorld     | public   |
    | HelloWorld | say            | public   |
    | HelloWorld | destroy        | public   |
    | HelloWorld | private_method | private  |
    | Main       | main           | public   |
    | Main       | main           | static   |

  Scenario Outline: reporting method type
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "<method>" with "type <type>"
  Examples:
    | file       | method         | type |
    | HelloWorld | say            | void |
    | HelloWorld | destroy        | void |
    | HelloWorld | private_method | void |
    | Main       | main           | void |

  Scenario Outline: reporting parameters
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "method <method>" with "parameter <parameter>"
  Examples:
    | file | method | parameter  |
    | Main | main   |   args     |

  Scenario Outline: reporting local variables
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "method <method>" with "local variable <local_variable>"
  Examples:
    | file | method | local_variable |
    | Main | main   |   hello1       |
    | Main | main   |   hello2       |

  Scenario Outline: reporting use of variables
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "method <method>" with "uses <kind> <variable>"
  Examples:
    | file       | method         | kind           | variable |
    | HelloWorld | HelloWorld     | attribute      | _id      |
    | HelloWorld | HelloWorld     | attribute      | _id_seq  |
    | HelloWorld | say            | attribute      | _id      |
    | HelloWorld | destroy        | attribute      | _id      |
    | HelloWorld | private_method | attribute      | hello    |
    | Main       | main           | local variable | hello1   |
    | Main       | main           | local variable | hello2   |

  Scenario Outline: reporting method calls
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "<method>" with "uses method <called_method>"
  Examples:
    | file       | method         | called_method          |
    | HelloWorld | say            | System.out.println     |
    | HelloWorld | destroy        | System.out.println     |
    | HelloWorld | private_method | System.out.println     |
    | Main       | main           | HelloWorld constructor |
    | Main       | main           | hello1.say             |
    | Main       | main           | hello2.say             |
    | Main       | main           | hello1.destroy         |
    | Main       | main           | hello2.destroy         |

