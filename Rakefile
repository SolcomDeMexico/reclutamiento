# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake/dsl_definition'S
require 'rake'

module ::Reclutamiento
  class Application
  include Rake::DSL
end
end

module ::RakeFileUtils
 extend Rake::FileUtilsExt
end


Reclutamiento::Application.load_tasks
