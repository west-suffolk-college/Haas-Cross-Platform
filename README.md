# Haas Cross platform Flutter App
This is a cross platform of the Haas app, in my vision of the app.

## installation of git
**you will need prerequisites to run the project**
* the dart SDK
* the flutter SDK

Once all is installed then to run the project first clone this git repository.
Then then goto Haas\lib\main.dart.
From there simply run the program by pressing `f5` or `run` in your IDE
* you may need to select the launch type
    - Web options are already built into the project

## Overview
Each page has its own ".dart" file in the lib folder.
A few others are also in the lib folder,
* elements.dart
    - this has a collection of elements used in the app across the pages of the app.
* backend.dart
    - this is used in place at the moment for the backend communication.
    - as the backend half of the project is still in development, it is not yet ready for use.
* formulae.dart
    - this holds the formulae used in the app, shuch as for conversion of °c -> °f
* main.dart
    - this threads the whole app together.

## Login
This is the page where you can login with that communicating with the backend found somewhere-else in this organisation.
It had a
* username field
* password field
    - The password has a visibility option for the user, off by default.
* login button

## HomePage
This page allows one to see
* their machines
    - to see its current job progress
    - to see its current temperature
    - to see its status, online or offline
* add a new machine

## AddNew
This page adds a new machine to your catalog of machines.
first you try to find it then you can fill out the following details.
* name
* type
* location

## Account
this is the page that allows to
* log out
* alter account settings
* see team settings
    - see who is there
    - add new team member
    - remove team member
    - edit team member

## Settings
this allows to change things about the app to your liking
* dark/light mode 
* machine settings
    - for each machine, global or local(per each machine)


## Main
This has few thing to note.

### Colours
* this holds all the colours used in the app
* basic colours such as
    - primary
    - secondary
    - text colours
    - background
    - error
    - etc
these are all stored as class properties.
the colours class also has two methods
* switch ot light mode
* switch ot dark mode
they change the colours to the corresponding mode.

### device info
* this holds a few properties of the device
* it holds:
    - font
    - font size
    - line spacing
    - temperature mode
    - screen dimension
    - screen height
    - screen width
these are held of the class properties.
it also has a few methods to update values.

## misc
...