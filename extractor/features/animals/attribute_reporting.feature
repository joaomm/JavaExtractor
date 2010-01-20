Feature: reporting attributes informations
  Scenario Outline: identifying attributes
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "attribute <attribute>"
  Examples:
    | file | attribute |
    | Cat  | _name     |
    | Dog  | _name     |

  Scenario Outline: reporting attributes modifiers
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "modifier <modifier>"
  Examples:
    | file | attribute | modifier |
    | Cat  | _name     | private  |
    | Dog  | _name     | private  |


  Scenario Outline: reporting attributes type
    Given I am in .
    When I run "ruby main.rb" with "animals/<file>.java"
    Then our parser must report the existence of "attribute <attribute>" with "type <type>"
  Examples:
    | file | attribute | type   |
    | Cat  | _name     | String |
    | Dog  | _name     | String |

