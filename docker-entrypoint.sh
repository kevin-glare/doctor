#!/bin/sh

bundle exec rake db:exists && rake db:migrate || rake db:setup

rm -f /tmp/server.pid
bundle exec rails server -b 0.0.0.0 -P /tmp/server.pid
