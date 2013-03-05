TestExample 
===========

This project is an example of all usefull tool to create functional tests for a web porject.

How to use
----------
To launch all the tests:
cucumber

To launch some of the tests, use the tags:
cucumber --tag @search

Prerequisite
------------
Rubygems used for the project :
* watir-webdriver
* rspec
* cucumber
* page-object
* syntax

Browser configuration
---------------------

### Firefox configuration

The first time you install watir, you need to edit a file to run correctly all our tests
The fils is, for example, on OpenSuse x64 /usr/lib64/ruby/gems/1.9.1/gems/selenium-webdriver-2.29.0/lib/selenium/webdriver/firefox/extension/prefs.json

You need to replace the line with:
"browser.link.open_newwindow": 2
by
"browser.link.open_newwindow": 3

### Internet Explorer configuration

cucumber . -p ie
You need the file : IEDriverServer.exe from http://code.google.com/p/selenium/downloads/list
The exe should be added to the path