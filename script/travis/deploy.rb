require 'fileutils'
def sh *args
  puts args
  exit false unless system(*args)
end

unless ENV['TRAVIS_PULL_REQUEST'] == 'true'
  sh 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
  sh 'git remote add heroku git@heroku.com:neetbe.git'
  sh 'yes | heroku keys:add'
  sh 'yes | git push heroku master'
end
