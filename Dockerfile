FROM ruby:2.4.0-alpine
ARG rack_env="development"
ENV RACK_ENV=$rack_env

RUN apk add --update \
  alpine-sdk \
  mariadb-dev \
  && rm -rf /var/cache/apk/* \
  && rm -rf /usr/lib/mysqld* \
  && rm -rf /usr/bin/mysql*

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
VOLUME /usr/src/app

ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app/Gemfile.lock
RUN echo "install: --no-document" > ~/.gemrc
RUN gem install bundler
RUN bundle install --clean --force
ADD . /usr/src/app

EXPOSE 8080
ENTRYPOINT [ "bundle", "exec" ]
CMD [ "shotgun", "--server", "thin", "--host", "0.0.0.0", "--port", "8080", "config.ru" ]