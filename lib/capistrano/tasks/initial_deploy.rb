namespace :deploy do
  desc "Initial server start"
  task :initiall do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
end
