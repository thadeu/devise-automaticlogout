# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../test/dummy/db/migrate', __FILE__)]

require "rails/test_help"
require 'rails/test_unit/runner'
require 'rails/test_unit/reporter'
require 'rails/test_unit/line_filtering'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
::Rails::TestUnitReporter.executable = 'bin/test'