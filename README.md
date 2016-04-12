## Project Information

### Pitch Video
https://youtu.be/MM3lQ0lbaBU

### Project Name
Immunize

### Project Description
Immunize is based on the pitch given by Laura McCasland from the Department of Health and Human Services regarding
free flu immunization clinics put on by Sacramento County.

There goals of the solution:

1. Centralize the clinic data.
2. Efficient data input.
3. Notify Sacramento County citizens about the clinics through the website and mobile app.
4. Reduce phone calls to the department by publishing updates through the web app and mobile app.
5. A RESTful API that is open and consumable by other applications.

The project consists of a Rails backend that the department can input all locations for free flu immunization shots.
The Rails application has a built in push notification service.  This gives the department the ability
to connect with anyone that has downloaded the app by sending notifications on updated locations, times or
additional locations.

The frontend of the Rails application shows the locations of the clinics on the map. A click on the clinic will pop up
detailed information regarding the clinic.

The second application in this project is the iOS application.  The app shows the locations of the mobile clinics
including date, time and a map of the location.  The app accepts the push notifications from the Rails server.

### Team Members
- Team Leader: Peter Hitchcock, phitchcock@me.com

### Stakeholder Engagement
- N/A

### Developer Documentation
Setup Rails Application:
https://github.com/phitchcock/Immunize/tree/master/immunize

Setup iOS Application:
https://github.com/phitchcock/Immunize/tree/master/iOSApp
