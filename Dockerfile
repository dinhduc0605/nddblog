FROM ruby:2.5.3-slim

RUN apt-get update -qq \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends build-essential libpq-dev libxml2-dev libxslt1-dev curl git vim less \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y \
    nodejs \
    yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
ENV BUNDLER_VERSION 1.17.2
ENV BUNDLE_PATH /bundle/vendor
RUN gem install bundler -v $BUNDLER_VERSION && bundle install --path $BUNDLE_PATH
ADD . /myapp
RUN yarn install
