Feature: As a user
  in order to keep all of my information in one place
  I would like to have a profile page.

Background:
  Given the following users exist:
    | name   | email           |
    | Anna   | anna@random.com |

  And "Anna" has written the following articles:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |

Scenario: Updating my profile
  Given I am logged in as "anna@random.com"
  And I am on the "home" page
  When I click the "My Profile" link
  Then I should be on the "profile" page for "Anna"
  And I should see "Edit Profile"
  When I click the "Edit Profile" link
  And I fill in:
    | element         | content         |
    | Name            | Amber Bo Bamber |
    | Garden Website  | www.garden.com  |
    | Blurb           | here's a blurb  |
    | Street          | street          |
    | Post Code       | 414 63          |
    | City            | Göteborg        |
    | Country         | Sverige         |
    | Current password| password        |
  And I click the "Update" button
  Then I should be on the "profile" page for "Amber Bo Bamber"
  Then I should see:
    | content                                    |
    | Amber Bo Bamber                            |
    | Your account has been updated successfully |
    | www.garden.com                             |
    | here's a blurb                             |
    | street                                     |
    | 414 63, Göteborg, Sverige                  |

Scenario: Viewing someone else's profile
  Given I am not logged in
  When I am on the "profile" page for "Anna"
  Then I should see "Profile for Anna"

Scenario: Anna can see her own articles on her profile
  Given I am logged in as "anna@random.com"
  And I am on the "profile" page for "Anna"
  Then I should see "Three good texts"

Scenario: A non-logged-in user can see Anna's articles on her profile
  Given I am not logged in
  And I am on the "profile" page for "Anna"
  Then I should see "Three good texts"

Scenario: I can't edit someone else's profile
  Given I am not logged in
  When I try to visit the "Edit Profile" page
  Then I should see "You need to sign in or sign up before continuing."
