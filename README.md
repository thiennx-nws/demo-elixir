This assignment is designed to  us to understand your technical skills using elixir/phoenix for backend api work. We have designed it so it closely to simulate a task that we would often have at Martide.

For this assignment, you'll need to quickly learn and familiarise yourself with it in that JSON API VERSION 1.0.0.

On This assignment, you'll be creating an API that our test web app makes requests to, to display a list of seafarers with their name, country, and seafarer_rankings. The web app require 3 models: Seafarer, Rankable, and SeafarerRanking. The Rankable model keeps many-to-many relationships between Seafarer and SeafarerRank.

## Please complete the following:

* Review the test web app codes to model the database structure
* Write all codes in Elixir
* Use the Phoenix framework
* Use the Ecto library
* Use PostgreSQL for the database
* Use the included database seed (.csv)
* Use JSON API format for all requests and responses

## You can  not:

* Alter any of the front-end code on index.html, this file is going to be used
    to talk to your api and append your response to HTML.  

## You will need:

* To Use an Elixir library for JSON API de/serialization rather than writing your own, JaSerializer is preferred. 

# Please include along your test submission:

* Your source codes minus dependencies
* Your mix.exs file
* SQL dump
* A screenshot of the index.html in a browser talking to your API

Please make sure that we can set up and run your solution by running `mix deps.get` and then `mix phoenix.server`
