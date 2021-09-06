require 'rubocop/rake_task'
require 'rake/testtask'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

task :run do
  ruby 'execute.rb'
end

task :test do
  Rake::TestTask.new do |task|
    task.pattern = 'test/*_test.rb'
  end
end
