# README

Pinspiration is a clone of Pinterest with authentication and authorization. Visitors can view an index of pins or an individual pin, and can create a new user account. Logged-in users can view pins, boards, and other user profiles. They can pin and remove photos from their own boards, and can follow and be followed by other users. They also can view a feed of recent activity from those they follow. Admins can delete pins and disable users.

The project also serves a JSON API for comments on pins, with endpoints for GET, POST, PUT and DELETE requests for users with API keys.

![Image1](/readmeimg/image1.png?raw=true "Optional Title")
![Image1](/readmeimg/image2.png?raw=true "Optional Title")
![Image1](/readmeimg/image3.png?raw=true "Optional Title")
![Image1](/readmeimg/image4.png?raw=true "Optional Title")
![Image1](/readmeimg/image5.png?raw=true "Optional Title")

* Ruby version: 2.3.0
* Rails version: 5.0.1

Heroku: https://the-real-pinspiration.herokuapp.com/

API endpoints: /api/v1/comments
  For GET and POST requests, `api_key` and `pin_id` are required in query params.
  For PUT and DELETE requests, `api_key` and `id` are required in query params.

Contributors: [Erin Pintozzi](https://github.com/epintozzi), [Anna Dolan](https://github.com/annadolan), [Jon Kimble](https://github.com/jbkimble), and [Vido Seaver](https://github.com/vidoseaver)
