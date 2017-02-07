# README

* Ruby version: 2.3.0
* Rails version: 5.0.1

Heroku: https://the-real-pinspiration.herokuapp.com/

Pinspiration is a clone of the Pinterest web app.  Users can create groups of 'pinned' images called 'boards' which can be made private, or be made public and easily be shared with other users via on the site.  
Users can also visit other users profiles and click a button to 'follow' their friends, they then see a live activity feed of what the people they follow are up to on the site. If a user loses their password they can request a password reset via a text sent to their cell phone.
Visitors can view an index of pins or an individual pin, and can create a new user account.
Admins can delete pins and disable users.

The project also serves a JSON API for comments on pins, with endpoints for GET, POST, PUT and DELETE requests for users with API keys.

API endpoints: /api/v1/comments
  For GET and POST requests, `api_key` and `pin_id` are required in query params.
  For PUT and DELETE requests, `api_key` and `id` are required in query params.

![Image1](/readmeimg/image2.png?raw=true "Optional Title")
![Image1](/readmeimg/image4.png?raw=true "Optional Title")
![Image1](/readmeimg/image5.png?raw=true "Optional Title")
![Image1](/readmeimg/image6.png?raw=true "Optional Title")
![Image1](/readmeimg/image1.png?raw=true "Optional Title")
![Image1](/readmeimg/image3.png?raw=true "Optional Title")


Contributors: [Erin Pintozzi](https://github.com/epintozzi), [Anna Dolan](https://github.com/annadolan), [Jon Kimble](https://github.com/jbkimble), and [Vido Seaver](https://github.com/vidoseaver)
