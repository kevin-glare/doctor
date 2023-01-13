FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler --version '2.3.16'

RUN mkdir /app
WORKDIR /app
COPY . .

RUN bundle install
RUN bundle exec rake assets:precompile

EXPOSE 5050