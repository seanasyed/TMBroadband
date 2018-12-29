# TMBroadband

Database management system for uniform and equipment records sorted by RFID identification. 

Disclaimer: this project is not affiliated with the University of Southern California or the Trojan Marching Band.

## Motivation

The Trojan Marching Band, and marching bands in general, require a large amount of manpower behind the scenes in order to function properly. When it comes to equipment and uniform teams, 
it is expected that we maintain a current record of every member in the band and the equipment that each individual member uses. In the search for a new database system, it may prove useful
to pull a given bandsman's information based on the information stored within the RFID chip given to each university student. 

## Repository Format


The original approach was to utilize Github Pages in order to host the website easily. Given the fact that we are looking to update information dynamically based on an RFID reader, the website is currently being migrated to
an Apache web server that will (hopefully) be run on a Raspberry Pi. The static website in its semi-functional glory can be viewed in the *application* folder. 

All of the RFID software, when completed,  will be in the rfid folder. 

The dynamic version of the website can be found under *TMBroadband 2 - Electric Boogaloo*.

This project utilizes the Google Firebase API. In order to run the application, you will need to include your own API information stored as a *config* variable in *config.js*. This was done in order to ensure that sensitive information, such as API keys, were not visible to everyone as this is a public repository. 
