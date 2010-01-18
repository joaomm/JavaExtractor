Feature: reporting attributes informations
  Scenario Outline: identifying attributes
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "attribute <attribute>"
  Examples:
    | file        | attribute       |
    | HelloWorld  | _id_seq         |
    | HelloWorld  | _id             |
    | HelloWorld  | hello           |

  Scenario Outline: reporting attributes modifiers
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "modifier <modifier>"
  Examples:
    | file        | attribute | modifier |
    | HelloWorld  | _id_seq   | private  |
    | HelloWorld  | _id_seq   | static   |
    | HelloWorld  | _id       | private  |
    | HelloWorld  | hello     | public   |
    | HelloWorld  | hello     | static   |

  Scenario Outline: reporting attributes type
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "type <type>"
  Examples:
    | file        | attribute | type |
    | HelloWorld  | _id_seq   | int  |
    | HelloWorld  | _id       | int  |
    | HelloWorld  | hello     | int  |

