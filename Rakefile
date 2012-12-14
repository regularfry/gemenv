# encoding: utf-8


namespace :pkg do
  desc "Build the gem"
  task :gem do
    FileUtils.mkdir_p "pkg"
    sh "gem build gemenv.gemspec"
    sh "mv gemenv-*.gem pkg/"
  end
end

task :clean do
  sh "rm -rf pkg/"
end
