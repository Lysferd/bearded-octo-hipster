require 'rvm/capistrano'

set :user, 'ibtech'
set :application, 'videoserver3'
set :repository, 'https://github.com/Lysferd/bearded-octo-hipster.git' #'git@github.com:Lysferd/bearded-octo-hipster.git'
set :deploy_to, "/home/#{user}/#{application}"
set :rvm_ruby_string, '1.9.3-p392'

#role :web, '201.64.223.142' # Your HTTP server, Apache/etc
#role :app, '201.64.223.142' # This may be the same as your `Web` server
#role :db, '201.64.223.142' #, :primary => true # This is where Rails migrations will run

role :web, '177.0.200.3' #%w( 201.64.223.142 177.0.200.3 )
role :app, '177.0.200.3' #%w( 201.64.223.142 177.0.200.3 )
role :db, '177.0.200.3' #%w( 201.64.223.142 177.0.200.3 )

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'tyco'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

namespace :test_me do
  task :default do
    run "echo 'testing'"
  end
end

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:restart', 'deploy:cleanup'

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#  task :start do
#  end
#  task :stop do
#  end
#  task :restart, :roles => :app, :except => {:no_release => true} do
#    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
#  end
#end
