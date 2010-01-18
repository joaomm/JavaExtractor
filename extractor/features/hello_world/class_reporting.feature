Feature: reporting classes informations
  Scenario Outline: identifying classes
    Given I am in .
    When I run "ruby main.rb" with "hello_world/<file>.java"
    Then our parser must report the existence of "<class>"
  Examples:
    | file       | class            |
    | HelloWorld | class HelloWorld |
    | Main       | class Main       |

