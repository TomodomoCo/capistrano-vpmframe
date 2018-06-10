require 'pathname'

namespace :build do

  desc 'Clone the repo to the local machine'
  task :clone do
    system( "git clone -b #{fetch(:branch)} #{fetch(:repo_url)} #{fetch(:build_dir)}/#{fetch(:application)}" )
  end

  desc 'Run the build'
  task :build do
    system( "cd #{fetch(:build_dir)}/#{fetch(:application)} && make" )
  end

  desc 'Upload build artifacts'
  task :upload do
      fetch(:uploads).each do |path|
        puts "Uploading #{path}"
        upload! "#{fetch(:build_dir)}/#{fetch(:application)}/#{path}", "#{release_path}/#{path}", recursive: true
      end
    end
  end

  'Clean up our local clone'
  task :clean do
    system( "rm -rf #{fetch(:build_dir)}" )
  end

end
