# racer0940.com

Home of racer0940 and racer0940 accessories.

Primarily a place to easily view cars and tracks available on the iRacing.com service.  
  Hopefully more to come in the future

## installation
To install, you need to:
- run 'npm install'
- extract images.zip into the images folder
- create a secrets.json file ([See below](#secretsjson) for instructions).
- run 'node server.js'  (nodemon will also work if that is installed globally)


#### secrets.json
The secrets.json file contains a few items required for the program to run, currently only the API key for youtube and the login info for the database.
  The secrets.json file you create needs to be in the following format:  
```
{
  "apiKeys": {
    "youtube": "<YOUR YOUTUBE API KEY>"
  },
  "passwords": {
  	"mysql": "<YOUR MYSQL PASSWORD>"
  }
}
```
