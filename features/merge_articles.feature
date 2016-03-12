Feature: Merge two articles together
  As an Admin user
  In order to eliminate redundant articles
  I want to be able to merge two similar articles into a single articles
  
  Background: 
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: Non-admin cannot merge articles
    Given I am not logged into the admin panel
    When I visit an existing article
    Then I should not see "Merge Articles"
    
  Scenario: Admin can successfully merge two articles
    When I visit an existing article's edit page
    And I see "Merge Articles"
    And I fill in "Article ID" with ""
    When I press "Merge"
    Then I should be on the "Merge Review" page
    When I press "Accept"
    Then I should be on the "Edit" article page
    And I should see "Successfully merged articles!"

  Scenario: Entering invaild Article ID does not enable Merge button (sad path)
    When I visit an existing article's edit page
    And I see "Merge Articles"
    And I fill in "Article ID" with ""
    Then the "Merge" button should not be enabled

  Scenario: Only unique articles can be merged (sad path)
    Given I am on an existing article's edit page
    When I fill in "Article ID" with "THIS_ARTICLE_ID"
    And I press the "Merge" button
    Then I should be on the "Edit" article page
    And I should see "Cannot merge this article with itself."

  Scenario: Only existing articles can be merged (sad path)
    Given I am on an existing article's edit page
    When I fill in "Article ID" with "NON_EXISTANT_ID"
    And I press the "Merge" button
    Then I should be on the "Edit" article page
    And I should see "Article ID does not exist."