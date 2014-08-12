require 'test/unit'
require File.expand_path('../../lib/exercism-analysis', __FILE__)

class AnalyzerTestCase < Test::Unit::TestCase

  attr_reader :code

  def feedback(adapter=adapter)
    result = Exercism::Analysis.new(adapter).run(analyzer)[analyzer]
    assert_not_nil result, 'Expected result to not be nil'
    result.feedback
  end

end