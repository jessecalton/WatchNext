# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

# 12-5-2017
### Added
- Installation and environment setup instructions on README

# 12-3-2017
### Changed
- All buttons are consistently styled
- Login forms on home page are bigger, sleeker
- SCSS updated to accommodate updated styles

# 12-1-2017 - 12-2--2017
### Changed
- Movie search form is much easier on the eyes, now menus are spaced apart using flexbox
- Movie search's "Search" button sits below the form and is styled a cool blue
- User's Watch List and filtered movies are centered in a flexbox
### Added
- Uses jQuery to Highlight the movie search form and add movie form when respective buttons are clicked on the user's show page
- More responsiveness to screen sizes, using flexbox to wrap Watch List movies to the next row

# 11-30-2017
### Added
- Added sessions helper spec with passing tests
- Added test for check_duplicates for movies helper spec
### Changed
- Buttons on the movie display are way less of an eyesore
- Delete button is now an "X" and sits in the top right corner
- "Details" button is given a sleek new look and will no longer be confused with "Delete"
- New heading above a user's watch list
### Removed
- Removed Twitter widget for the time being. Worked fine, but too extra

# 11-14-2017
### Added
- Added feature spec for home page with passing tests
- Added Messager model spec, testing Twilio API functionality with passing tests for valid and invalid phone numbers
### Changed
- Logins spec test has user logging in and logging out

# 11-13-2017
### Added
- Added feature spec for user page with passing tests
- Added UserHelper module for Capybara support

# 11-8-2017
### Added
- Added request spec tests for Users
- Installed rails-controller-testing gem to transition from soon-to-be deprecated testing syntax
- Added Capybara gem for feature testing
- Adds tests for login feature using Capybara
### Deprecated
- Controller tests are being deprecated in favor of request specs as of Rails 5
- Use render_template instead of assert_template and redirect_to instead of assert_redirected_to in your request specs
### Changed
- Realized that the login form partial on the login page was still "display: hidden". Changed that to an inline style as to not mess with the properly hidden ones.

# 11-7-2017
### Added
- Finishes tests for MovieSearch model

# 11-6-2017
### Added
- Adds testing gems to README
### Changed
- Updates intro to README, makes it more fun and adds more movie puns

# 11-5-2017
### Added
- Adds [VCR](https://github.com/vcr/vcr) gem to record OMDB API responses
- Configures VCR
- Records VCR cassettes in MovieSearch model spec
- Writes passing tests in MovieSearch model spec

# 11-4-2017
### Added
- Finishes tests for MoviesHelper spec (for now...)
### Changed
- Removed .titleize methods from MoviesHelper methods, as they were not returning movies with hyphens like expected
- Refactored methods for grabbing duplicate entries of actors, genres, and directors (single responsibility ftw)

# 11-3-2017
### Added
- [FactoryBot](https://github.com/thoughtbot/factory_bot) gem
- Adds database_cleaner gem to tests
- Set up factories and dependencies
- Write passing tests for MoviesHelper spec and Movies spec
- Integrates with Travis CI
- Adds Travis CI status badge to README
- Adjusts .travis.yml file to use Ruby v2.3.1 and set rake tasks

# 10-31-2017
### Added
- Initializes Rspec and appropriate gems
- Adds files for testing Movie class and MoviesHelper module
### Changed
- Refactor MovieSearch model initialization to use JSON instead of URI (much cleaner)
### Removed
- test directory (no need with Rspec)

# 10-20-2017
### Added
- Begin working with Twitter API
- Adds Twitter widget to movie display on user page, allows user to tweet "I am watching #{movie}"
- Get twitter API keys, storing them privately

# 10-5-2017
### Changed
- Finishes refactor of CSS into SCSS
