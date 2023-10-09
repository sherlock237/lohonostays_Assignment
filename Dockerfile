# Dockerfile.rails
FROM ruby:2.6.10 AS lohonostays

RUN apt-get update -qq && apt-get install -y nodejs
ENV APP_RUN web
ENV RAILS_ROOT ./app

COPY ./ /app
WORKDIR $RAILS_ROOT

RUN gem install bundler

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install


RUN chmod +x script/docker-entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["script/docker-entrypoint.sh"]