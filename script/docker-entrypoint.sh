rm -f /myapp/tmp/pids/server.pid

case "$APP_RUN" in
  web) bundle exec rails s -b 0.0.0.0 ;;
    *) bundle exec sidekiq ;;
esac
