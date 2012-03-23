# encoding: utf-8
require 'minitest/unit'

case
when MiniTest.const_defined?(:SuiteRunner)
  load File.expand_path('../suite_runner.rb', __FILE__)
when MiniTest::Unit::VERSION =~ /^1/
  load File.expand_path('../version_1_runner.rb', __FILE__)
when MiniTest::Unit::VERSION =~ /^2/
  load File.expand_path('../version_2_runner.rb', __FILE__)
else
  raise "Unknown MiniTest runner version!"
end
