Feature: Fishing diary server root and about API tests

Background:
* def hello = 'Hello World!'
* def about_response = 'Fishing Diary server.'

Scenario: Testing the base url, returns 'Hello World!'
    Given url baseUrl
    When method GET
    Then status 200
    And match response == hello

Scenario: Testing the about url, returns 'Fishing Diary server.*
    Given url baseUrl
    And path 'about'
    When method GET
    Then status 200
    And match response == about_response
