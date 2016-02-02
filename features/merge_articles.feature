Feature: Write Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up 
    And the following users exist
      | login        | password   | email       | profile_id | name      | state     |
      | non-admin    | bbbbbbbb   | na@mail.com | 2          | John Doe  | active    |
      | jdoe         | cccccccc   | jd@yeah.com | 3          | Jane Doe  | active    |
    And the following articles exist
      | id | title        | author    | body      | allow_comments  | published |   permalink |
      | 2  | Title 1      | admin     | Content 1 | 1               | 1         |   title-1   |
      | 3  | Title 2      | non-admin | Content 2 | 1               | 1         |   title-2   |
    And the following comments exist for an article with a title of "Title 1"
      | author        | email       |  body | 
      | user1         | na@mail.com | Comment 1 |
      | user2         | jd@yeah.com | Comment 2 |
    And the following comments exist for an article with a title of "Title 2"
      | author        | email        |  body | 
      | user1         | na@mail.com  | Comment 3 |
      | admin         | joe@snow.com | Comment 4 |

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    Given I am on the article page for "Title 1"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Title 1" should have body "Content 1 Content 2"
    Then the author of "Title 1" should be "admin"
    Then the article "Title 1" should have "4" comments
    
  Scenario: Merge fails if articles aren't unique
    Given I am logged into the admin panel
    Given I am on the article page for "Title 1"
    And I fill in "merge_with" with "2"
    Then I should see "Can't merge an article with itself"
    
  Scenario: Merge fails if one article does not exist
    Given I am logged into the admin panel
    Given I am on the article page for "Title 1"
    And I fill in "merge_with" with "99"
    Then I should see "Can't merge with non-existant article"
  
  Scenario: Non-admin can not merge
    Given I am on the article page for "Title 1"
    Then There should be no "Merge" form
    
    
    
    
    
    # When I fill in "article_title" with "Foobar"
    # And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    # And I press "Publish"
    # Then I should be on the admin content page
    # When I go to the home page
    # Then I should see "Foobar"
    # When I follow "Foobar"
    # Then I should see "Lorem Ipsum"
