Feature: Home page links

Background:

  Given the following users exist:
    | name    | email            |
    | Hanna   | hanna@random.com |


  And "Hanna" has written the following articles:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |
    | Four    | Three good texts |
    | Five    | Three good texts |
    | Six     | Three good texts |
    | Seven   | Three good texts |
    | Eight   | Three good texts |
    | Nine    | Three good texts |
    | Ten     | Three good texts |
    | Eleven  | Three good texts |

Scenario: Seeing front-page bits
  Given I am logged in as "hanna@random.com"
  When I visit the "home" page
  Then I should see:
    | content          |
    | Logout           |
    | Current Articles |
    | Two              |
    | Three            |

Scenario: viewing articles when not logged in
  Given I am not logged in
  And I am on the "home" page
  Then I should see:
    | content          |
    | Current Articles |
    | Two              |
    | Three            |

Scenario: Limit articles to most recent Ten
  Given I am on the "home" page
  Then I should see "Eleven"
  And I should not see "One"
