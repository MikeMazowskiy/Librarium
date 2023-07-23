# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

set :application, "librarium"
set :repo_url, "git@github.com:MikeMazowskiy/Librarium.git"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#append :linked_files, %w[config/database.yml config/master.key]

# Default value for linked_dirs is []
#append :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle .bundle public/system public/uploads node_modules]

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

set :conditionally_migrate, true

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# upload configuration files
before 'deploy:starting', 'config_files:upload'

set :initial, true

# run only if app is being deployed for the very first time, should update "set :initial, true" above to run this
before 'deploy:migrate', 'database:create' if fetch(:initial)

# reload application after successful deploy
after 'deploy:publishing', 'application:reload'