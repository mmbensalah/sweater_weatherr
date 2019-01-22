# SweaterWeatherr

Fourth and final project of the third (of four) modules at Turing School of Software & Design. This project will have a completed JavaScript front end by 01-28-2019. 

## Objective

The objective of this app is to create API endpoints for a JavaScript front end to consume. The app consumes the Google Geocode API and the DarkSky API to then output six endpoints for current weather for an authorized user. 

### GET Current Weather
`GET http://localhost:3000/api/v1/forecast?location=denver,co`
![alt text]("https://github.com/mmbensalah/sweater_weatherr/blob/master/1.png")

### Account Creation
`POST http://localhost:3000/api/v1/users`

### Login
`POST http://localhost:3000/api/v1/sessions`

### Favoriting Locations
`POST http://localhost:3000/api/v1/favorites`

### Listing Favorite Locations
`GET http://localhost:3000/api/v1/favorites`

### Removing Favorite Locations
`DELETE http://localhost:3000/api/v1/favorites`
