set :application, "logotake"
set :repository,  "git@github.com:jamesyu/logotake.git"
set :scm, :git
set :deploy_to, "/var/www/apps/logotake"
set :user, "james"
set :port, 77

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "logotake.com"
role :web, "logotake.com"
role :db,  "logotake.com", :primary => true


task :get_database_yml, :roles => :app do
  run "cp #{shared_path}/database.yml #{current_release}/config"
end

task :generate_assets, :roles => :app do
  run "cd #{current_release} && rake more:generate"
end

after 'deploy:update_code', :roles => :app do
  deploy.get_database_yml
  deploy.generate_assets
end

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "/etc/init.d/thin restart"
  end
end
