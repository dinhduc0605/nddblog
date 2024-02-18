# frozen_string_literal: true

# Change these
server '140.238.43.19', port: 22, roles: %i[web app db], primary: true

set :repo_url,        'git@github.com:dinhduc0605/nddblog.git'
set :application,     'nddblog'
set :user,            'ubuntu'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :decompose_restart, [:web]
set :decompose_web_service, :web
set :ssh_options,     forward_agent: true, user: fetch(:user), keys: %w[/Users/dinhduc/Learning/SSHKeys/oracle-ssh-key-2024-01-21.key]

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :linked_dirs, %w[tmp/cache]

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma


namespace :git do
  task :copy_config do
    on roles(:app) do
      execute "cp #{shared_path}/config/application.yml #{release_path}/config/"
    end
  end

  after :create_release, :copy_config
end
