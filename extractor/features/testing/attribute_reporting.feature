Feature: reporting attributes informations
  Scenario Outline: identifying attributes
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "attribute <attribute>"
  Examples:
    | file    | attribute            |
    | ClassA  | my_attribute         |
    | ClassA  | static_attribute     |
    | ClassA  | protected_attribute  |
    | ClassB  | _a7tr1bute           |
    | ClassB  | initialized_attribute|
    | ClassB  | array_attribute      |
    | ClassB  | first                |
    | ClassB  | second               |
    | ClassB  | third                |
    | ClassC  | doublePrice          |
    | ClassC  | strangeAttribute     |
    | ClassC  | evenStrangerAttribute|

  Scenario Outline: reporting attributes modifiers
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "modifier <modifier>"
  Examples:
    | file    | attribute              | modifier  |
    | ClassA  | my_attribute           | private   |
    | ClassA  | my_attribute           | final     |
    | ClassA  | static_attribute       | public    |
    | ClassA  | static_attribute       | static    |
    | ClassA  | protected_attribute    | protected |
    | ClassB  | _a7tr1bute             | public    |
    | ClassB  | first                  | public    |
    | ClassB  | second                 | public    |
    | ClassB  | third                  | public    |
    | ClassC  | doublePrice            | public    |
    | ClassC  | strangeAttribute       | private   |
    | ClassC  | evenStrangerAttribute  | private   |

  Scenario Outline: reporting attributes type
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "type <type>"
  Examples:
    | file    | attribute              | type                                 |
    | ClassA  | my_attribute           | int                                  |
    | ClassA  | static_attribute       | double                               |
    | ClassA  | protected_attribute    | float                                |
    | ClassB  | _a7tr1bute             | ClassA                               |
    | ClassB  | array_attribute        | int\[\]                              |
    | ClassB  | first                  | double                               |
    | ClassB  | second                 | double                               |
    | ClassB  | third                  | double                               |
    | ClassC  | doublePrice            | double\[\]                           |
    | ClassC  | strangeAttribute       | br.org.javax.ClassX<String>\[\]      |
    | ClassC  | evenStrangerAttribute  | br.org.javax.ClassX<String, int>\[\] |
    | ClassC  | collection             | Collection<\?>                       |
    | ClassC  | oddestAttribute        | StrangeType<\? extends ClassT<T, int>|

