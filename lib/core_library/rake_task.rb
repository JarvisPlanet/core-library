require 'rake'

module CoreLibrary
  # Rake tasks common for each test project
  class RakeTask
    include ::Rake::DSL if defined?(::Rake::DSL)

    def install_tasks
      load 'core_library/tasks/rspec.rake'
    end
  end
end

CoreLibrary::RakeTask.new.install_tasks
