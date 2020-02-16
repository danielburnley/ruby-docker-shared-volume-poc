FROM ruby:2.6.1-alpine

RUN apk --no-cache add less
RUN gem install bundler:2.0.2

WORKDIR /app
COPY app/Gemfile ./
COPY app/Gemfile.lock ./
RUN apk --no-cache add alpine-sdk && bundle install && apk del alpine-sdk

ADD ./app /app

EXPOSE 4567
