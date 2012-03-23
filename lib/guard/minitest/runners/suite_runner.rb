# encoding: utf-8
require 'minitest/unit'
require 'guard/minitest/notifier'

module MiniTest
  class SuiteRunner

    begin
      alias_method :_run_anything_without_guard, :_run_anything
      def _run_anything(type)
        start = Time.now
        _run_anything_without_guard(type)
        duration = Time.now - start
        ::Guard::MinitestNotifier.notify(test_count, assertion_count, failures, errors, skips, duration)
      end
    rescue NameError
      puts "*** WARN: if you use MiniTest 1, please add version option in your 'Guardfile`."
      raise
    end

  end
end
