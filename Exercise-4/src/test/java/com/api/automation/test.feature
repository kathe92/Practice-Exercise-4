Feature: To create different test in the application
	
	Background: Setup the base url
		Given url 'https://petstore.swagger.io/v2'
    * def userId = 17
    * def userName = 'katgonzal'
		
	Scenario: To create a new user in JSON format
		Given path '/user/createWithArray'
		And request [{ "id": '#(userId)', "username": '#(userName)', "firstName": "Katherine", "lastName": "Gonzalez", "email": "kat@gmail.com", "password": "KQtgonza92","phone": "76311784","userStatus": 0 }]
		And headers { Accept : 'application/json', Content-Type : 'application/json' }
		When method post
		Then status 200 
		And print response
		
	Scenario: Search the new user created
		Given path '/user/' + userName
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		
	Scenario: To update the new user created
    Given path '/user/' + userName
    And request { "id": '#(userId)', "username": '#(userName)', "firstName": "Katherine Y.", "lastName": "Gonzalez", "email": "katherine@gmail.com", "password": "KQtgonza92","phone": "76311784","userStatus": 1 }
    And headers { Accept : 'application/json', Content-Type : 'application/json' }
    When method put
    Then status 200
    
  Scenario: Search the user updates
		Given path '/user/' + userName
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		And match response.firstName == "Katherine Y."
		And match response.email == "katherine@gmail.com"
		
	Scenario: Delete the user
		Given path '/user/' + userName
		And headers { Accept : 'application/json'}
    When method delete
    Then status 200
