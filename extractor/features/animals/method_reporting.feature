Feature: reporting methods informations
  Scenario Outline: identifying methods
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "method <method>"
  Examples:
    | file   | method |
    | Animal | name   |
    | Cat    | Cat    |
    | Cat    | name   |
    | Dog    | Dog    |
    | Dog    | name   |
    | Main   | main   |

  Scenario Outline: reporting method modifiers
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "<method>" with "modifier <modifier>"
  Examples:
    | file   | method | modifier |
    | Animal | name   | public   |
    | Animal | name   | abstract |
    | Cat    | Cat    | public   |
    | Cat    | name   | public   |
    | Dog    | Dog    | public   |
    | Dog    | name   | public   |
    | Main   | main   | public   |
    | Main   | main   | static   |

  Scenario Outline: reporting method type
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "<method>" with "type <type>"
  Examples:
    | file   | method         | type        |
    | Animal | name           | String      |
    | Cat    | Cat            | constructor |
    | Cat    | name           | String      |
    | Dog    | Dog            | constructor |
    | Dog    | name           | String      |
    | Main   | main           | void        |

  Scenario Outline: reporting parameters
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "<method>" with "parameter <parameter>"
  Examples:
    | file | method | parameter |
    | Cat  | Cat    | name      |
    | Dog  | Dog    | name      |
    | Main | main   | args      |

  Scenario Outline: reporting local variables
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report that "<method>" uses "local variable" "<local_variable>"
  Examples:
    | file | method | local_variable |
    | Main | main   | dog            |
    | Main | main   | cat            |

  Scenario Outline: reporting use of variables
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report that "<method>" uses "<kind>" "<variable>"
  Examples:
    | file | method | kind           | variable |
    | Cat  | Cat    | attribute      | _name    |
    | Cat  | Cat    | parameter      | name     |
    | Cat  | name   | attribute      | _name    |
    | Dog  | Dog    | attribute      | _name    |
    | Dog  | Dog    | parameter      | name     |
    | Dog  | name   | attribute      | _name    |
    | Main | main   | local variable | cat      |
    | Main | main   | local variable | dog      |

  Scenario Outline: reporting method calls
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report that "<method>" uses the method "<called_method>"
  Examples:
    | file | method | called_method      |
    | Main | main   | Dog constructor    |
    | Main | main   | Cat constructor    |
    | Main | main   | cat.name           |
    | Main | main   | dog.name           |
    | Main | main   | System.out.println |

