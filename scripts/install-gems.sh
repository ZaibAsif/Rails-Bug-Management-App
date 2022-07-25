# #!/bin/bash
# # Go to the deployment directory
# cd /var/www/autobuffy-be/deployment || exit
# # Get temporaray credentials for AWS CodeCommit
# # - Remember that the instance must have access rights to the CodeCommit repositories in Gemfile.
# git config --global credential.helper '!aws codecommit credential-helper $@'
# git config --global credential.UseHttpPath true
# # Install gems using bundler
# # - Bundle location: /var/www/autobuffy-be/shared/bundle
# # - Binary location: /var/www/autobuffy-be/shared/bin
# # - Without development and test gems
# # - Using gemfile in current directory
# # - Also quietly. No need to generate all logs.
# # RAILS_ENV=production bundle install --binstubs /var/www/autobuffy-be/shared/bin --gemfile ./Gemfile --path /var/www/autobuffy-be/shared/bundle --without development test --deployment --quiet
# source /etc/profile
# source ~/.bash_profile
# # rbenv install 2.6.3
# # rbenv global 2.6.3
# sudo RAILS_ENV=production bundle install --binstubs /var/www/autobuffy-be/shared/bin --gemfile ./Gemfile --path /var/www/autobuffy-be/shared/bundle --without development test
# bundle exec rails db:migrate RAILS_ENV=production
# bundle exec rails db:seed RAILS_ENV=production
bundle install