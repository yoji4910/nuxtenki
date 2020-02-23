FROM ruby:2.6.5-alpine

ENV RUNTIME_PACKAGES "mysql-client mysql-dev tzdata nodejs"
ENV DEV_PACKAGES "build-base curl-dev"
ENV APP_HOME /app
ENV TZ Asia/Tokyo

ENV HOST 0.0.0.0
ENV PORT 3000

WORKDIR ${APP_HOME}
ADD Gemfile ${APP_HOME}/Gemfile
ADD Gemfile.lock ${APP_HOME}/Gemfile.lock

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add --update --no-cache ${RUNTIME_PACKAGES} \
    && apk add --update --no-cache --virtual=.build-dependencies ${DEV_PACKAGES} \
    && apk upgrade --available \
    && bundle install -j4 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && apk del --purge .build-dependencies \
    && rm -rf /var/cache/apk/*

ADD . ${APP_HOME}

EXPOSE ${PORT}

# Update crontab file using whenever command
RUN bundle exec whenever --update-crontab

CMD crond -f && bundle exec puma -C config/puma.rb
