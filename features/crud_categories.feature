Feature: Create edit and delete categories
  As an author
  In order  for the world to view my thoughts on certain topics
  I want to create read update and delete categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following categories exist:
        | name      | permalink | keywords  | description   |
        | Politics  |           | General   |               |
  
  Scenario: Navigate to category page
    Given I am on the admin page
    When I follow "Categories"
    Then I should be on the categories page
  
  Scenario: Add a new category
    Given I am on the categories page
    When I fill in "category_name" with "CultClassics"
    And I fill in "category_description" with "Lorem Ipsum"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "CultClassics"

  Scenario: Edit an existing category
    Given I am on the categories page
    When I "Edit" the "Politics" category
    Then I should be on the edit "Politics" page
    And the "category_name" field should contain "Politics"
    When I fill in "category_description" with "Lorem Ipsum"
    And I press "Save"
    Then I should see "Category was successfully saved."
    And the description of the "Politics" category should be "Lorem Ipsum"

  Scenario: Delete an existing category
    Given I am on the categories page
    When I "Delete" the "Politics" category
    Then I should be on the destroy "Politics" page
    When I press "delete"
    Then I should be on the categories page
    And I should not see "Politics"

  Scenario: Should not be able to create category without name (sad path)
    Given I am on the categories page
    When I press "Save"
    Then I should be on the categories page
    And I should see "Category could not be saved."
    