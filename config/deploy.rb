require 'bundler/capistrano'

set :user, "acm-1015134"
set :domain, "ubiquitous.csf.itesm.mx"
set :application, "FEMSA"

set :repository, "git@github.com:alejandroOlmos/FEMSA.git"
set :deploy_to, "/home/acm-1015134/rails/FEMSA"


# set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `no


#role :web, domain                          # Your HTTP server, Apache/etc
#role :app, domain                          # This may be the same as your `Web` server
#role :db, domain, :primary => true # This is where Rails migrations will run
#role :db, domain

server domain, :app, :web, :db, :primary => true

default_run_options[:pty] = true

set :deploy_via, :remote_cache
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production


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
