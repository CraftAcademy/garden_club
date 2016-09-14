Feature: As a user
  in order to facilitate login and registration
  I would like to sign up and login with Facebook.

Background:
  Given the following users exist:
  | name    | email            |
  | Amber   | theamb@gmail.com |

Scenario: Logging in via facebook
  Given I am not logged in
  And I am on the "Login" page
  Then I should see "Sign in with Facebook"
  When I click the Sign in with Facebook link
  Then I should be on the "home" page
  And I should see "Welcome, Joe"
