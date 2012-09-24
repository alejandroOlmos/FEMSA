require 'capistrano/ext/multistage'

default_run_options[:pty] = true
set :branch, "master"

set :application, "FEMSA"
set :scm, :git
set :repository, "git@github.com:alejandroOlmos/FEMSA.git"

# set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `no
set :user, "acm-1015134"
set :use_sudo, false

role :web, "ubiquitous.csf.itesm.mx"                          # Your HTTP server, Apache/etc
role :app, "ubiquitous.csf.itesm.mx"                          # This may be the same as your `Web` server
role :db, "ubiquitous.csf.itesm.mx", :primary => true # This is where Rails migrations will run
role :db, "ubiquitous.csf.itesm.mx"

set :stages, "production"
set :default_stage, "production"


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end