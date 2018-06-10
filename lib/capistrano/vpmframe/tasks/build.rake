require 'pathname'

namespace :build do

  desc 'Clone the repo to the local machine'
  task :clone do
    system( "git clone -b #{fetch(:branch)} #{fetch(:repo_url)} #{fetch(:build_dir)}/#{fetch(:application)}" )
  end

  desc 'Compile, concatenate, and minify static assets'
  task :compile do
    system( "cd #{fetch(:build_dir)}/#{fetch(:application)} && make" )
  end

  desc 'Upload static assets to the remote'
  task :upload do
    on roles(:app) do |host|
      on fetch(:uploads) do |path|
        upload! "#{fetch(:build_dir)}/#{fetch(:application)}/#{path}", "#{release_path}/#{path}", recursive: true
      end
    end
  end

  'Clean up our local clone'
  task :clean do
    system( "rm -rf #{fetch(:build_dir)}" )
  end

end
