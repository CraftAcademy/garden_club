Feature: Home page links

Background:
  Given the following users exist:
  | name   | email           |
  | Anna   | anna@random.com |

Scenario: Seeing front-page bits
  Given I am logged in as "anna@random.com"
  When I visit the "home" page
  Then I should see "Logout"
