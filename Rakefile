require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Remove all files from the ./reports and ./doc directory'
task :clean do
  require 'fileutils'
  FileUtils.rm_rf Dir.glob('reports/*')
  FileUtils.rm_rf Dir.glob('doc/*')
end