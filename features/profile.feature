Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Background:
  Given the following users exist:
  | name   | email           |
  | Anna   | anna@random.com |

Scenario:
  Given I am on my "profile" page
  Then I should see "My Profile"
  When I click the "Edit Profile" link
  Then I should be on the "Edit Profile" page
  And I should see "Edit My Profile"
  And I should see "Anna"
  And I should see "Email"
