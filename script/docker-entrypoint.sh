#!/bin/sh
rm -f tmp/pids/server.pid
env
case "$APP_RUN" in
  web) bundle exec rails s -b 0.0.0.0
esac
