Feature: Write Articles
  As a blog administrator
  In order to better organize articles
  I want to be able to view and create new categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel
 
  Scenario: Successfully view categories page
    Given I follow "Categories"
    Then I should be on the categories page
    And I should see "Categories"
    And the form fields should be blank
    

    # When I fill in "article_title" with "Foobar"
    # And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    # And I press "Publish"
    # Then I should be on the admin content page
    # When I go to the home page
    # Then I should see "Foobar"
    # When I follow "Foobar"
    # Then I should see "Lorem Ipsum"
