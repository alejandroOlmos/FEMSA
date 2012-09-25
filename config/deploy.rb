require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :user, 'acm-1015134'
set :domain, 'ubiquitous.csf.itesm.mx'
set :applicationdir , '/home/acm-1015134/html_container/FEMSA'

set :application, "FEMSA"
set :scm, :git
set :repository, "git@github.com:alejandroOlmos/FEMSA.git"
set :branch, 'master'

# set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `no
set :use_sudo, false

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db, domain, :primary => true # This is where Rails migrations will run
role :db, domain

set :deploy_to, applicationdir
set :deploy_via, :remote_cache

set :stages, "production"
set :default_stage, "production"

#set :rails_env, "production"

#set :asset_env, "#{asset_env} RAILS_RELATIVE_URL_ROOT=/html_container/FEMSA"

default_run_options[:pty] = true
#ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do end
   task :stop do end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end