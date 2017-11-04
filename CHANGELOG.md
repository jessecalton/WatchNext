# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)

# 11-4-2017
### Added
- More tests for MoviesHelper spec
### Changed
- Removed .titleize methods from MoviesHelper methods, as they were not returning movies with hyphens like expected

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
