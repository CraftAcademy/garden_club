Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Background:
  Given I am a new, authenticated user

Scenario:
  Given I am on the "Edit Profile" page
  And I should see "Edit My Profile"
  And I should see "Anna"
  And I should see "Email"
