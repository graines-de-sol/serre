cp config/database.yml.travis config/database.yml
bundle exec rake db:create db:migrate
