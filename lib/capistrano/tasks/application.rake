namespace :application do
  desc 'Reload application'
  task :reload do
    desc 'Reload app after deployment'
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Restart application'
  task :restart do
    desc 'Reload app after deployment'
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end
end