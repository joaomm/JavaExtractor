Feature: reporting classes informations
  Scenario Outline: identifying classes
    Given I am in .
    When I run "ruby main.rb" with "animals/<class>.java"
    Then our parser must report the existence of "class <class>"
  Examples:
    | class  |
    | Animal |
    | Cat    |
    | Dog    |
    | Main   |
    | Mammal |

  Scenario Outline: reporting inheritance
    Given I am in .
    When I run "ruby main.rb" with "animals/<class>.java"
    Then our parser must report the existence of "class <class>" with "extends <parent>"
  Examples:
    | class  | parent |
    | Cat    | Mammal |
    | Dog    | Mammal |
    | Mammal | Animal |

  Scenario Outline: reporting class modifiers
    Given I am in .
    When I run "ruby main.rb" with "animals/<class>.java"
    Then our parser must report the existence of "class <class>" with "modifier <modifier>"
  Examples:
    | class  | modifier |
    | Animal | public   |
    | Animal | abstract |
    | Cat    | public   |
    | Dog    | public   |
    | Main   | public   |
    | Mammal | public   |

