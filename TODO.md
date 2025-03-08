## Issues

* The appwrite dotenv variables are inherently insecure, therefore the api key should be abstracted somehow.

* Uniform the way the appwrite api is called.

* Images require url in appwrite, no file upload.

* comments - post_id relationship is a string, not a relationship.

* Functions are written individually in the files, bloc events should be used to make a clear API.

* DRY has not been followed in the codebase.
    - The appwrite api calls are not uniform.
    - appwrite is called with sdk and with http
    - requests are made in the widgets themselves, should be abstracted to the bloc.

## Core features

* Settings view

* Logout functionality

* RBAC

## Upcoming Features

These are just my ideas, feel free to add your own.

* Polls (general ones, but also polls specific to an event)
* Surveys after an event
* Event chat