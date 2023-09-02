#!/bin/bash
rm -f /var/app/tmp/pids/server.pid
bundle check > /dev/null 2>&1 || bundle install -j4

if [ "$#" == 0 ]
then
  bundle exec rake db:create db:migrate
  ./bin/dev
fi
exec $@