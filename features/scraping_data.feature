Feature: Scraping data from web

  In order to store text data in DB
  As admin
  I should be able to start the scraping data from web

  Background: 
    Given I am a registered Admin
    And I am logged in
    And I have few Content Types

  @javascript
  Scenario: Start the Onliner Articles scraping by valid period
    Given I select the 'Onliner' option 
    When I fill 'Onliner' form
    Then I should start 'Onliner' scraping process

  @javascript
  Scenario: Start the RabotaBy Vacancies scraping   
    Given I select the 'RabotaBy' option 
    When I fill 'RabotaBy' form
    Then I should start 'RabotaBy' scraping process