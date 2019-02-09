FROM ruby:2.6.1
RUN apt-get update -qq \
  && apt-get install -y postgresql-client \
  && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
  && apt-get install -y nodejs
RUN mkdir /msg
WORKDIR /msg
COPY Gemfile /msg/Gemfile
COPY Gemfile.lock /msg/Gemfile.lock
RUN bundle install
COPY . /msg

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
