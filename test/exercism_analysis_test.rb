require 'test/unit'
require File.expand_path('../../lib/exercism-analysis', __FILE__)

class TestAdapter

  attr_reader :code

  def initialize(code)
    @code = code
  end

end

class ExercismAnalysisTest < Test::Unit::TestCase

  attr_reader :adapter, :sut

  def setup
    @adapter = TestAdapter.new('class Test; end')
    @sut = Exercism::Analysis.new(adapter)
  end

  def test_calls_analyzer_with_adapter
    analyzer_arg = nil
    sut.run(-> (arg) { analyzer_arg = arg })
    assert_not_nil analyzer_arg, 'Expected analyzer to be called with adapter'
    assert_equal adapter, analyzer_arg
  end

  def test_accumulates_analyzer_results
    expected = Object.new
    analyzer = -> * { expected }
    assert_equal({analyzer => expected}, sut.run(analyzer))
  end

end
