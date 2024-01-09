# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'colorize'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

require 'rubocop/rake_task'

# RuboCop::RakeTask.new

desc 'bundle install'.yellow
task :bundle do
  system('bundle install')
end

desc 'rubocop -A'.yellow
task :lint do
  system('bundle exec rubocop -A')
end

task default: %i[test rubocop]
