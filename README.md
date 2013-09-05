# fio - File Input Output Generator (Work in progress - adapted from sbrd.me)

## Dependencies
* You will need to setup an rvm environment running ruby-1.9.3-p194.
  * You will also need to create a gemset called `fio`
    * note: make sure you remember to issue `rvm use ruby-1.9.3-p194@fio` from the command line.
  
## Setup 
1. Install the dependencies
2. Run `gem install bundler`
3. Run `bundle install`
4. Run `bundle exec rackup -s thin -p 8000`

## Tests
1. Run `RACK_ENV=test bundle exec rake spec`

## API Spec for Web based clients

##### Notes:

- This doc and APIs are a work in progress.  The APIs signatures and responses should not be considered final in any form.
See the section on versioning for details on currently supported versions.

- All calls will use HTTP endpoints.
- All requests are in text format and must include a valid URI string.
- All responses will be in JSON format.
- GET requests must include a url key in order for a redirect to be generated. 

#### Summary of the HTTP Status Codes:
  
    200 - OK
    404 - Bad request - we return a custom message
    500 - Server Error
  
## API Features

##### API Endpoints

  * Staging - http://
  
  * Production - http://
  
  * Development = http://localhost:8000/


## Branches

This repo consists of one branch, currently it is:
  1. checkin

#### Pushing
To push to each app you'll need to do the following:

##### sbrdme-staging:
      git remote add origin git@github.com:medwards42/fio.git
      git push origin checkin
    
