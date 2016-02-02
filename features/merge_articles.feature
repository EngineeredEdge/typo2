Feature: Write Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
        | id | title   | body           |
        | 2  | Foobar  | LoremIpsum     |
        | 3  | BobLob  | lobs law bomb  |

  Scenario: Successfully merge articles
    Given I am on the article page for "Foobar"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have body "LoremIpsum lobs law bomb"
    
    
    
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
