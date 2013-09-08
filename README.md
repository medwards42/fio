# fio - File Input Output Generator (Work in progress - adapted from sbrd.me)

## Description

- The purpose of this application is really nothing special.  I'm trying to teach myself how to build
a very simple API (using Sinatra) which reads from and writes data to a file residing in the public folder.
This example program will be used as a basis for a slightly larger project in which I'm going to attempt
to build a speed dial directory management tool for Polycom Soundpoint IP telephones (which is something I 
really need for my current job).

- I doubt this project will be of any real interest to anyone but myself, however if you have any comments, 
tips, tricks or best practices to offer I'm all ears.

## Dependencies
* You will need to setup an rvm environment running ruby-2.0.0-p247.
  * You will also need to create a gemset called `fio`
    * note: make sure you remember to issue `rvm use ruby-2.0.0-p247@fio --create` from the command line.
    * remember to create a .ruby-version and .ruby-gemset file:
      
      .ruby-version:
        `ruby-2.0.0-p247`
      
      .ruby-gemset:
        `fio`
    
  
## Setup 
1. Clone the Repo: Run `git clone git@github.com/medwards42/fio.git`
2. Install the dependencies
3. Run `gem install bundler`
4. Run `bundle install`
5. Run `bundle exec rackup -s thin -p 8000`

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

#### Health Check

While working for Songbird I learned (from folks much wiser than I) that it really is a good idea
to include some type of health_check function within an application.  It offers users an easy way to
just check and see that your app is up and running.  Also, since my background is more on the Systems 
Admin side I can tell you that it makes writing Nagios checks a whole lot nicer.

  Example: 

    curl http://localhost:8000/health_check -v
    
  Valid Response:
  
    * Connected to localhost (127.0.0.1) port 8000 (#0)
    > GET /health_check HTTP/1.1
    > User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
    > Host: localhost:8000
    > Accept: */*
    > 
    < HTTP/1.1 200 OK
    < Content-Type: text/html;charset=utf-8
    < Content-Length: 15
    < X-XSS-Protection: 1; mode=block
    < X-Content-Type-Options: nosniff
    < X-Frame-Options: SAMEORIGIN
    < Connection: keep-alive
    < Server: thin 1.5.1 codename Straight Razor
    < 
    * Connection #0 to host localhost left intact
    All Systems Go!* Closing connection #0
    
Really all this tells us is that the server is up and running and that a user is able to connect
and Sinatra will correctly respond to a get request on the '/health_check' route. 

#### API Endpoints

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
    
