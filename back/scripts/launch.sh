rm -f /app/tmp/pids/server.pid
# bundle exec whenever --update-crontab
# crond -f
bundle exec puma -C config/puma.rb

# bundle exec rails s -b ${BACKEND_HOST}
# command: bash -c "rm -f /app/tmp/pids/server.pid && bundle exec whenever --update-crontab && crond -f && exec bundle exec rails s -b ${BACKEND_HOST}"