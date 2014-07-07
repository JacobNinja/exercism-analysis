require File.expand_path('../test_helper', __FILE__)

class TestAnalyzer < Exercism::Analyzers::Analyzer

  def call
    :foo
  end

end

class ExercismAnalysisTest < Test::Unit::TestCase

  attr_reader :adapter, :sut

  def setup
    @adapter = Exercism::Adapters::Adapter.new('class Test; end')
    @sut = Exercism::Analysis.new(adapter)
  end

  def test_accumulates_analyzer_results
    assert_equal({TestAnalyzer => :foo}, sut.run(TestAnalyzer))
  end

end
