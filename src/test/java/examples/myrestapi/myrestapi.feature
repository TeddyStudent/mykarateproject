Feature: sample rest api test

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

Scenario: Testing the user url, get known user with id 1
    Given url userUrl
    And path '1'
    When method GET
    Then status 200
    And match response[0].idtili == 1
    And match response[0].etunimi == 'Teddy'
    And match response[0].sukunimi == 'Student'
    And match response[0].kayttajatunnus == 'TeddyStudent'
    And match response[0].salasana == 'teddypwd'

Scenario: Testing the user url, get unknown user with id 11
    Given url userUrl
    And path '11'
    When method GET
    Then status 404

Scenario: Testing the user url, update known user
    Given url userUrl
    And path '2'
    And request { etunimi: 'User11', sukunimi: 'Surname1', kayttajatunnus: 'user1id', salasana: 'user1pwd' }
    When method PUT
    Then status 200
    And match response[0].idtili == 2
    And match response[0].etunimi == 'User11'
    And match response[0].sukunimi == 'Surname1'
    And match response[0].kayttajatunnus == 'user1id'
    And match response[0].salasana == 'user1pwd'

Scenario: Testing the user url, successful login
    Given url userUrl
    And path 'login'
    And request { kayttajatunnus: 'User1id', salasana: 'user1pwd' }
    When method POST
    Then status 200

Scenario: Testing the user url, failed login
    Given url userUrl
    And path 'login'
    And request { kayttajatunnus: 'User1id', salasana: 'qwerty' }
    When method POST
    Then status 401
