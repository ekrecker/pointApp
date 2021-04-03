FROM ruby:3.0.0-alpine3.13
RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers libxml2-dev make gcc g++ libc-dev tzdata nodejs postgresql-dev postgresql yarn && \
    apk add --virtual build-packages --no-cache build-base curl-dev

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
