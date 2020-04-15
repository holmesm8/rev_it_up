# RevItUp

### Description
RevItUp is a Sinatra microservice used as the backend for the ShakeItUp web application. This microservice makes two API calls to Yelp Fusion and Google Places to return a randomly selected restaurant based on query parameters provided by the user.

### API Endpoint

https://rev-it-up.herokuapp.com/search?

### API Keys Needed
* Yelp Fusion
* Google Places

### Query params
key: latitude
value: decimal format

key: longitude
value: decimal format

key: radius
value: meters

key: price
value: number 1-4

### Installation
* Install Ruby 2.5.2
* Clone this repo to your local machine with: git clone git@github.com:holmesm8/rev_it_up
* bundle install
* bundle exex db:rake

This Sinatra API application uses the following gems for testing:
   * rspec

To run the test suite, simply run the command `rspec` from your terminal.
