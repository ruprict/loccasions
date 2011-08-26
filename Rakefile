#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Loccasions::Application.load_tasks

# Make `rake spec` the default rake task
Rake::Task[:default].prerequisites.clear
task :default => [:spec]
