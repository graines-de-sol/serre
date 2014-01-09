require "rvm/capistrano"
require "bundler/capistrano"
require "whenever/capistrano"

set :application, "serre"
set :repository,  "git@github.com:graines-de-sol/serre.git"
set :keep_releases, 2
set :deploy_to, "/home/gds/serre"
set :use_sudo, false
set :user, "gds"
set :ssh_key, "id_rsa.pub"
set :scm, 'git'
set :default_stage, 'production'
set :branch, fetch(:branch, "master")
set :normalize_asset_timestamps, false
set :rvm_ruby_string, '1.9.3-p194'
set :rvm_type, :user
set :whenever_command, "bundle exec whenever"
set :default_environment, {
  'PATH' =>         "/home/gds/.rvm/gems/ruby-1.9.3-p194/bin:/home/gds/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/gds/.rvm/rubies/ruby-1.9.3-p194/bin:/home/gds/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  'GEM_HOME' =>     "/home/gds/.rvm/gems/ruby-1.9.3-p194",
  'GEM_PATH' =>     "/home/gds/.rvm/gems/ruby-1.9.3-p194:/home/gds/.rvm/gems/ruby-1.9.3-p194@global"
}

role :web, "ns382592.ovh.net"
role :app, "ns382592.ovh.net"
role :db,  "ns382592.ovh.net", :primary => true
set :ssh_options, {:forward_agent => true}

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_shared do
    run "ln -s #{shared_path}/.bundle #{release_path}/.bundle"
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/"
    run "rm -rf #{release_path}/medias && ln -s #{shared_path}/medias #{release_path}/medias"
    run "cp -r #{release_path}/public/javascripts #{shared_path}/public && rm -rf #{release_path}/public && ln -s #{shared_path}/public #{release_path}/public"
    run "rm -rf #{release_path}/vendor && ln -s #{shared_path}/vendor #{release_path}/vendor"
  end

  task :precompile_assets do
    run "cd #{release_path}; rake assets:precompile RAILS_ENV=production "
  end

  desc "Update the crontab file"
  task :update_crontab, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  end

end

namespace :dragonfly do
  desc "Symlink the Rack::Cache files"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
  end
end

after  'deploy:update_code', 'deploy:symlink_shared'
after  'deploy:update_code', 'dragonfly:symlink'
after  'deploy:update_code', 'deploy:precompile_assets'
before 'deploy:restart',     'deploy:migrate'
after  'deploy:restart',     'deploy:cleanup'

