# syntax=docker/dockerfile:1
FROM ruby:3.0.2-bullseye
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn


# prepare basic configuration
RUN rails db:migrate RAILS_ENV=development
RUN rails db:seed

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]