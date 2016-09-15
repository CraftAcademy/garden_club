Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Background:
  Given the following users exist:
  | name   | email           |
  | Anna   | anna@random.com |

Scenario:
  Given I am logged in as "anna@random.com"
  And I am on the "home" page
  When I click the "My Profile" link
  Then I should be on the "Profile" page
  And I should see "Edit Profile"
  When I click the "Edit Profile" link
  When I fill in "Name" with "Amber Bo Bamber"
  When I fill in "Garden Website" with "www.garden.com"
  And I fill in "Blurb" with "here's a blurb"
  And I fill in "Street" with "street"
  And I fill in "Post Code" with "414 63"
  And I fill in "City" with "Göteborg"
  And I fill in "Country" with "Sverige"
  And I fill in "Current password" with "password"
  And I click the "Update" button
  Then I should be on the "Profile" page
  And I should see "Amber Bo Bamber"
  And I should see "Your account has been updated successfully"
  And I should see "www.garden.com"
  And I should see "here's a blurb"
  And I should see "street"
  And I should see "414 63, Göteborg, Sverige"
