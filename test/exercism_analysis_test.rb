require 'test/unit'
require File.expand_path('../../lib/exercism-analysis', __FILE__)

class TestAdapter

  attr_reader :code

  def initialize(code)
    @code = code
  end

end

class ExercismAnalysisTest < Test::Unit::TestCase

  def test_calls_analyzer_with_adapter
    adapter = TestAdapter.new('class Test; end')
    sut = Exercism::Analysis.new(adapter)
    analyzer_arg = nil
    sut.run(-> (arg) { analyzer_arg = arg })
    assert_not_nil analyzer_arg, 'Expected analyzer to be called with adapter'
    assert_equal adapter, analyzer_arg
  end

end
