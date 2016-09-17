Feature: As a paid user
  in order to have my articles more easily found
  I would like to be able to tag my articles.

Background:
  Given the following users exist:
    | name   | email           |
    | Jimi   | jimi@random.com |

  And "Jimi" has written the following articles:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |

Scenario: Adding a tag to an article
  Given I am logged in as "jimi@random.com"
  And I am on the "compose" page for "Jimi"
  Then I should see "Tags"
  When I fill in:
    | element | content                 |
    | Title   | Hotdogs                 |
    | Body    | Warmkorv in Swedish     |
    | Tags    | food, baseball, swedish |
  And I click the "Publish article" button
  Then I should see "Tags: ruby, testing, javascript"
