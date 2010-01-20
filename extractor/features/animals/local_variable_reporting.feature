Feature: reporting methods informations

  Scenario Outline: reporting local variables type
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "<local_variable>" with "type <type>"
  Examples:
    | file | local_variable | type   |
    | Main | dog            | Animal |
    | Main | cat            | Mammal |

