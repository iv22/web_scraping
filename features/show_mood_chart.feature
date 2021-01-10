Feature: Show Mood chart by years for Onliner articles

  In order analyze articles data
  As anonymous user
  I should be able to view articles mood by years histogram

  @javascript
  Scenario: Get articles mood page    
    When I visit chart page
    Then I should see histogram chart