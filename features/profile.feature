Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Background:
  Given the following users exist:
  | name   | email           |
  | Anna   | anna@random.com |

Scenario:
  Given I am logged in
  And I am on the "Edit Profile" page
  Then I should see "Edit Profile"
  When I click the "Edit Profile" link
  When I fill in "Garden Website" with "www.garden.com"
  And I fill in "Current password" with "password"
  And I click the "Update" button
  Then I should be on the "Profile" page
  And I should see "Your account has been updated successfully"
  And I should see "www.garden.com"
