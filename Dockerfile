FROM ruby:2.6.1
RUN apt-get update -qq \
  && apt-get install -y postgresql-client \
  && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
  && apt-get install -y nodejs
RUN mkdir /msg
WORKDIR /msg
COPY Gemfile /msg/Gemfile
COPY Gemfile.lock /msg/Gemfile.lock
RUN bundle install -j4
COPY . /msg
