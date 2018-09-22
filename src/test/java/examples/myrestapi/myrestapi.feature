Feature: sample rest api test

Scenario: Testing the base url, returns 'Hello World!'
    Given url 'http://localhost:3005/'
    When method GET
    Then status 200
    And match response == 'Hello World!'

Scenario: Testing the about url, returns 'Fishing Diary server.*
    Given url 'http://localhost:3005/about'
    When method GET
    Then status 200
    And match response == 'Fishing Diary server.'

Scenario: Testing the user url, get known user with id 1
    Given url 'http://localhost:3005/api/user/1'
    When method GET
    Then status 200
    And match response[0].idtili == 1
    And match response[0].etunimi == 'Teddy'
    And match response[0].sukunimi == 'Student'
    And match response[0].kayttajatunnus == 'TeddyStudent'
    And match response[0].salasana == 'teddypwd'

Scenario: Testing the user url, get unknown user with id 11
    Given url 'http://localhost:3005/api/user/11'
    When method GET
    Then status 404

