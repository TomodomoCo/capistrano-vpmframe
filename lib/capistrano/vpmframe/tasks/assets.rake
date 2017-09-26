namespace :assets do

  desc 'Clone the repo to the local machine'
  task :clone do
    system( "git clone -b #{fetch(:branch)} #{fetch(:repo_url)} #{fetch(:assets_tmp_dir)}/#{fetch(:application)}" )
  end

  desc 'Compile, concatenate, and minify static assets'
  task :compile do
    system( "cd #{fetch(:assets_tmp_dir)}/#{fetch(:application)} && make assets" )
  end

  desc 'Upload static assets to the remote'
  task :upload do
    on roles(:app) do |host|
      upload! "#{fetch(:assets_tmp_dir)}/#{fetch(:application)}/public/assets", "#{release_path}/public/", recursive: true
    end
  end

  'Clean up our local clone'
  task :clean do
    system( "rm -rf #{fetch(:assets_tmp_dir)}" )
  end

end
