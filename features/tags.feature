Feature: As a paid user
  in order to have my articles more easily found
  I would like to be able to tag my articles.

Background:
  Given the following users exist:
    | name   | email           |
    | Jimi   | jimi@random.com |

  And "Jimi" has written the following articles:
    | title   | body             | tags         |
    | One     | One awesome text | awesomesauce |
    | Two     | Two awesome text | tornado      |
    | Three   | Three good texts | awesomesauce |

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
  Then I am on the article page for article "Hotdogs"
  Then I should see "Tags: baseball, food, swedish"

Scenario: Viewing all articles with the same tag
  Given I am on the article page for article "One"
  Then I should see "awesomesauce"
  When I click the "awesomesauce" link
  Then I should see "Articles tagged with awesomesauce"
  And I should see "Three"
  And I should not see "Two"
  When I click the "Three" link
  Then I am on the article page for article "Three"
  And I should see "Three good texts"

Scenario: Display tag list on home page
  Given I am on the "home" page
  Then I should see "Popular tags: awesomesauce"
