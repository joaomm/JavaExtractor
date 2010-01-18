Feature: reporting methods informations

  Scenario Outline: reporting local variables type
    Given I am in .
    When I run "ruby main.rb" with "testing/<file>.java"
    Then our parser must report the existence of "local variable <local_variable>" with "type <type>"
  Examples:
    | file    | local_variable  | type       |
    | ClassA  |       a         | ClassC     |
    | ClassA  |       i         | int        |
    | ClassA  |       j         | int        |
    | ClassA  |       y         | double\[\] |

