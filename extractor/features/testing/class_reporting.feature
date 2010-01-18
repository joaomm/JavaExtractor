Feature: reporting classes informations
  Scenario Outline: identifying classes
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "class <class>"
  Examples:
    | file    | class                                         |
    | ClassA  | ClassA                                        |
    | ClassB  | ClassB                                        |
    | ClassC  | ClassC<String, ClassD extends ClassE<String>> |

  Scenario Outline: reporting inheritance
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "class <class>" with "extends <parent>"
  Examples:
    | file    | class  | parent |
    | ClassB  | ClassB | ClassC |

  Scenario Outline: reporting interface
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "class <class>" with "implements <interface>"
  Examples:
    | file    | class  | interface |
    | ClassB  | ClassB | ClassD    |
    | ClassB  | ClassB | ClassE    |

