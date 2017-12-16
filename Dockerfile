# Base image:
FROM ruby:2.3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /home/jesse/WatchNext
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Gems:
ADD Gemfile* $RAILS_ROOT

RUN gem install bundler
RUN bundle install

# Copy the main application.
COPY . /home/jesse/WatchNext

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "config/containers/app_cmd.sh" ]