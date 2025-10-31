FROM ruby:3.3-alpine

LABEL maintainer="you@example.com"

RUN apk add --no-cache build-base git bash

RUN gem install license_finder

COPY entrypoint.sh /entrypoint.sh
COPY doc /doc

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]