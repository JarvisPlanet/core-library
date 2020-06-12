begin
  require 'rspec/core/rake_task'
rescue LoadError
  raise 'RSpec not available'
end

desc 'Run integration tests'
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = %w(--color --format documentation -fhtml -oreports/rspec.html --tag ~@wip --tag ~@pact)
end
