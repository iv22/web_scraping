Feature: Authentication

  In order to scraping source data from web
  As admin
  I should be able to log in

  Scenario: Admin logs in
    Given I am a registered Admin
    And I visit the admin page
    When I fill login form
    Then I should be logged in