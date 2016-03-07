# immunize

Ruby on Rails Cloud Backend Server: https://sac-immunize.herokuapp.com

The Ruby on Rails cloud architecture is running on Heroku.

![backend](https://cloud.githubusercontent.com/assets/2372619/13559322/df6edcce-e3c7-11e5-9356-e2510d7f2dac.png)

API Documentation
-----------------

##Understanding REST APIs
This API follows RESTful standards related to routes and HTTP verbs. If you are unfamiliar with this you can learn more here: http://www.restapitutorial.com/lessons/httpmethods.html

But the simple overview is that given a user with a path like /api/v1/locations then each of the following HTTP Verbs mean a specific thing:

HTTP  | Verb |  CRUD Meaning
--- | --- | ---
POST | Create | 201 (Created)
GET |Read  |200 (OK)
PUT |Update  |404 (Not Found)
DELETE  | Delete | 204 (Success)

**API Root:** https://sac-immunize.herokuapp.com

Some examples use my local server: `http://localhost:3000` just change this to main API Root to test against real server.

## Content-Type: JSON
All requests and responses are in JSON - you should set the following content/type header to tell the server the request is in JSON.

    curl -H "Content-Type: application/json"

The response object will have this header:

    Content-Type: application/json; charset=utf-8

## Updating Objects

Administration Page
-------------------

The admin page is at https://sac-immunize.herokuapp.com/admin
Authentication is handeled through Devise

Architecture
------------
