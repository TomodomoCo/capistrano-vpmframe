namespace :credentials do

  desc 'Upload local credentials'
  task :upload do
    on roles(:app) do |host|
      upload! "config/credentials", "#{shared_path}/config", recursive: true
    end
  end

  desc 'Upload local secrets'
  task :upload_secrets do
    on roles(:app) do |host|
      upload! "config/secrets", "#{shared_path}/config", recursive: true
    end
  end

  desc 'Maybe upload salts'
  task :salts do
    on roles(:app) do |host|
      if test("[ -f #{release_path}/config/wp-salts.php ]")
        info "wp-salts.php already exists on #{host}"
      else
        execute("echo '<?php' > #{release_path}/config/wp-salts.php && curl https://api.wordpress.org/secret-key/1.1/salt >> #{release_path}/config/wp-salts.php")
      end
    end
  end

end
