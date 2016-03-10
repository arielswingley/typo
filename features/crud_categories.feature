Feature: Create edit and delete categories
  As an author
  In order  for the world to view my thoughts on certain topics
  I want to create read update and delete categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: Navigate to category page
    Given I am on the admin page
    When I follow "Categories"
    Then I should be on the "Categories" page
    And I should see a header with "Categories"
  
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
    Given the following category exists:
        | name      | permalink | keywords  | description   |
        | General   | sluggin   | General   |               |
    When I follow "Edit" within the "General" entry
    Then I should be on the categories/edit page
    And the "category_name" field within "left_form" should contain "General"
    When I fill in "category_description" with "Lorem Ipsum"
    And I press "Save"
    Then I should see "Category was successfully saved."
    And the "category_description" field within "General" should contain "Lorem Ipsum"

  Scenario: Delete an existing category
    Given I am on the categories page
    And the following category exists:
        | name      | permalink | keywords  | description   |
        | General   | sluggin   | General   |               |
    When I follow "Delete" within the "General" entry
    Then I should be on the categories/destroy page
    When I press "delete"
    Then I should be on the categories page
    And I should not see "General"

  Scenario: Should not be able to create category without name (sad path)
    Given I am on the categories page
    Then the "category_name" field within "left_form" should contain ""
    When I press "Save"
    Then I should be on the categories page
    And I should see "Category could not be saved."
    