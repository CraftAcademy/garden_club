Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Scenario:
  Given I am on my "profile" page
  Then I should see "My Profile"
  When I click the "Edit Profile" link
  Then I should be on the "Edit Profile" page
