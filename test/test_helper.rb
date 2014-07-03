require 'test/unit'
require File.expand_path('../../lib/exercism-analysis', __FILE__)

class AnalyzerTestCase < Test::Unit::TestCase

  def feedback
    analyzer.call(adapter).feedback.tap do |feedback|
      assert !feedback.empty?, 'Expected feedback to not be empty'
    end
  end

end