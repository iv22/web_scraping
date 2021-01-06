Feature: Scraping data from web

  In order to store text data in DB
  As admin
  I should be able to start the scraping data from web

  @javascript
  Scenario: Start the Onliner Articles scraping by valid period
    Given I am a registered Admin
    And I am logged in
    And I select the 'Onliner' option 
    When I fill valid target period
    Then I should start 'Onliner' scraping process
