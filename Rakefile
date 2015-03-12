require 'bundler/setup'
require 'rspec/core/rake_task'

desc "Help"
task :default do
	puts "Run rake with either 'test' or 'example'"
end

desc "Quickie test of the function"
task :example do
	require_relative 'example'
end

desc "Run all tests"
RSpec::Core::RakeTask.new(:test)
