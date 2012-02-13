set :application, "refuge"
set :repository,  "file:///var/git/refuge"
set :local_repository, "s15367251.onlinehome-server.info:/var/git/refuge"
set :deploy_to, "/home/refuge"
set :use_sudo, false
set :scm, 'git'

role :web, "s15367251.onlinehome-server.info"
role :app, "s15367251.onlinehome-server.info"
role :db,  "s15367251.onlinehome-server.info", :primary => true

# Passenger stuff :
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

