FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && \
    apt upgrade -y && \
    apt install -y build-essential libpq-dev nodejs yarn
RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]