Feature: As a visitor
  in order to find other peoples' gardens
  I would like to see a map of users' gardens on their profile.

Scenario: Viewing a user's garden map
  Given the following users exist:
    | name    | email            | g_street  | g_postcode | g_city     | g_country |
    | Hanna   | hanna@random.com | Gatan 2   | 414 63     | Göteborg   | Sverige   |
  When I am on the "profile" page for "Hanna"
  Then "Hanna" should have a latitude
  Then I should see "Gatan 2"
  And I should see a Google Map
