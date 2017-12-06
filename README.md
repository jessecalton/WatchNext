[![Build Status](https://travis-ci.org/jessecalton/WatchNext.svg?branch=master)](https://travis-ci.org/jessecalton/WatchNext)

# 🎞 Now Playing at a Web Browser Near You 🎞

Do you find yourself browsing Netflix more than watching net flicks? Does your list of new films to watch only grow as you pop in your VHS of Star Wars again? If this sounds like you, then you've come to the right place.

# 📽 WatchNext 📽

### WatchNext will help you eliminate the time spent surfing Netflix and Hulu and get to what matters most - watching films!

* Add to and delete movies from a watch list with ease.
* Uses AJAX for dynamic adding/deleting of movie titles.
* Search specific parameters to filter through movies in watch list, for example: "I want to watch a movie that's less than 2 hours, is a Romantic Comedy from the 1980's, and has a Rotten Tomatoes score of at least 75."
* Send your watch list to your smart phone via SMS using the Twilio API to check your list on the go.
* Just select the options you want to filter and you'll find tonight's movie!

## 📽 Cast

* Ruby on Rails
* HTML5/SCSS/CSS3
* JavaScript/jQuery
* PostgreSQL
* [OMDB API](http://www.omdbapi.com)
* [Twilio API](https://www.twilio.com)

## 👩‍🎤 Crew 👨‍🎤

* [Rspec](https://github.com/rspec/rspec-rails)
* [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
* [VCR](https://github.com/vcr/vcr)
* [Capybara](http://teamcapybara.github.io/capybara/)
* [DatabaseCleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [Travis CI](https://github.com/travis-ci/travis.rb)

## 🍿 Sneak Preview 🍿

![Demo](watch-next-demo.gif)

## 📼 Test-Screenings 📼

The most recent deployment of WatchNext can be viewed at:

<http://what2watchnext.herokuapp.com/>

Play with the demo account:

  **Login:** demo@demo.com <br>
  **Password:** demo
  
## Installation

1. [Install Ruby on Rails and Postgres](https://gorails.com/setup/osx/10.13-high-sierra)

2. Fork and clone WatchNext locally

3. Install bundler with `gem install bundler`.

4. Install the bundle with `bundle install`.

5. Create the database with `rake db:create`.

6. Migrate the database with `rake db:migrate`.

7. Run local server with `rails server`

8. View locally at http://localhost:3000

## Environment

To access all of WatchNext's features, you will need an [OMDB API](http://www.omdbapi.com) account and a [Twilio phone number](https://www.twilio.com/sms) for the SMS functionality.

Create a `.env` file in the WatchNext directory.
Put the following keys and values in your `.env` file:

    API_KEY: [Your OMDB API key]

    TWILIO_NUMBER: [Your Twilio phone number in a '+12345678900' format]
    ACCOUNT_SID: [Your Twilio Account SID]
    AUTH_TOKEN: [Your Twilio Auth Token]

To run the tests involving SMS messaging, include the [Twilio test variables](https://www.twilio.com/docs/api/rest/test-credentials) as well

    TEST_ACCOUNT_SID: [Your Twilio Test Account SID]
    TEST_AUTH_TOKEN: [Your Twilio Test Auth Token]

Don't forget to put '.env' in your `.gitignore` file!

## 🎬 Contact the Director 🎬

Please direct all inquiries to:

<http://jesse-calton.com>
