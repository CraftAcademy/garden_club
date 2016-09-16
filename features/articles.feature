Feature: As a user
  in order to share my views on gardening
  I would like to be able to write and share articles.

Background:
  Given the following users exist:
  | name   | email           | password  |  password_confirmation |
  | Anna   | anna@random.com | password  |  password              |

  And "Anna" has written the following articles:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |

Scenario: Write an article
  Given I am logged in as "anna@random.com"
  And the user "anna@random.com" should exist with name "Anna"
  And I am on the "compose" page for "Anna"
  Then I should see "Publish article"
  When I fill in "Title" with "Article Title"
  And I fill in "Body" with "Article Body"
  And I click the "Publish article" button
  And I am on the "compose" page for "Anna"
  When I fill in "Title" with "Article Title 2"
  And I fill in "Body" with "Article Body 2"
  And I click the "Publish article" button
  When I am on the "articles" page for "Anna"
  Then I should see "Article Title"
  And I should see "Article Title 2"


Scenario: Trying to write an article when not logged in
  Given I am on someones compose page
  Then I should see "You are not logged in"

Scenario: Viewing the full contents of an article, logged in
  Given I am on the article page for article "One"
  Then I should see "One awesome text"

Scenario: Viewing the full contents of an article, logged out
  Given I am not logged in
  And I am on the article page for article "One"
  Then I should see "One awesome text"

Scenario: Viewing an article from the user's article index
  Given I am on the "article index" for "Anna"
  Then I should see "One"
  When I click the "One" link
  Then I should see "One awesome text"
