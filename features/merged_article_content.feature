Feature:
  As an Admin
  So that merged articles are concise
  I want to review and edit merged article content
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
        | name  | title     | 

  Scenario: Merged articles should have one author from original articles
    Given I have successfully merged articles "ARTICLE_ID1" and "ARTICLE_ID2"
    Then the merged article should have the name "NAME1" or "NAME2"
    And the "Author" should be "AUTHOR1" or "AUTHOR2"

  Scenario: Comments from each article should persist in merged article
    Given article "NAME" has the following comments: "COMMENT", "COMMENT", "COMMENT"
    And article "NAME2" has the following comments: "COMMENT2", "COMMENT2", "COMMENT2"
    When I successfully merge articles "NAME" and "NAME2"
    Then the merged article should have the following comments: "COMMENT", "COMMENT", "COMMENT", "COMMENT2", "COMMENT2", "COMMENT2"