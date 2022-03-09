# Sweater Weather 

This is a final project for Module 3 Back End program in the Turing School of Software & Design. 

## Learning goals:

### Expose an API that aggregates data from multiple external APIs:
  *  Weather: https://openweathermap.org/api/one-call-api  
  *  Directions: https://developer.mapquest.com/documentation/geocoding-api/
  *  Images: https://unsplash.com/developers
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

### Ruby version
  * Ruby Version 2.7.2
  * Rails Version 5.2.6

* System dependencies
  * Gems Utilized
  * RSpec
  * Pry
  * SimpleCov
  * Shoulda-Matchers
  * jsonapi-serialize
  * Figaro
  * Webmock
  * VCR
  * Bcrypt

* Configuration
  * After cloning down this repository locally and running `bundle`,  you will need to run `bundle exec figaro install` and add the private keys from the above external APIs to your application.yml file as environment variables. 

* Database creation
  * `rails db:{create,migrate` on the CL

* How to run the test suite
  * `bundle exec rspec` on the CL

* Postman instructions
  * To test these endpoints in an external application, run `rails s` on CL and then open or download Postman. Send requests to `http://localhost:3000/api/v1/ + endpoint` and enter parameters through the body of the request in JSON format. 
