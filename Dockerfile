FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /good_night
COPY Gemfile /good_night/Gemfile
COPY Gemfile.lock /good_night/Gemfile.lock
RUN bundle install
COPY . /good_night


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]