## Issues

* The appwrite dotenv variables are inherently insecure, therefore the api key should be abstracted.

* Uniform the way the appwrite api is called.

* Images require url in appwrite, no file upload.

* Functions are written individually in the files, bloc events should be used to make a clear API.

* DRY has not been followed in the codebase.
    - The appwrite api calls are not uniform.
    - appwrite is called with sdk and with http
    - requests are made in the widgets themselves, should be abstracted to the bloc.