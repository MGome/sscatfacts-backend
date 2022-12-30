FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /sscatfacts-backend
WORKDIR /sscatfacts-backend
COPY Gemfile /sscatfacts-backend/Gemfile
COPY Gemfile.lock /sscatfacts-backend/Gemfile.lock
RUN gem update --system \
  && gem install bundler \
  && bundle config set force_ruby_platform true
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
COPY . /sscatfacts-backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000