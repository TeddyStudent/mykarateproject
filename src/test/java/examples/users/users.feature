Feature: Fishing diary server user API tests

Background:
    * def rand_first_name = Math.random().toString(36).substring(2, 15)

Scenario: Testing the user url, get known user data
    Given url userUrl
    And path known_user_id
    When method GET
    Then status 200
    And match response[0].idtili == known_user_id
    And match response[0].etunimi == test_user_fname
    And match response[0].sukunimi == test_user_lname
    And match response[0].kayttajatunnus == test_user_ktun
    And match response[0].salasana == test_user_pwd

Scenario: Testing the user url, get unknown user data
    Given url userUrl
    And path unknown_user_id
    When method GET
    Then status 404

Scenario: Testing the user url, update known user
    Given url userUrl
    And path modify_user_id
    And request { etunimi: '#(rand_first_name)', sukunimi: 'Surname1', kayttajatunnus: 'user1id', salasana: 'user1pwd' }
    When method PUT
    Then status 200
    And match response[0].idtili == modify_user_id
    And match response[0].etunimi == rand_first_name
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

Scenario: Testing the user url, create and delete a user
    Given url userUrl
    And request { etunimi: '#(new_user_fname)', sukunimi: '#(new_user_lname)', kayttajatunnus: '#(new_user_uname)', salasana: '#(new_user_pwd)' }
    When method POST
    Then status 201
    And def new_id = response[0].idtili
    Given url userUrl
    And path new_id
    When method DELETE
    Then status 200



