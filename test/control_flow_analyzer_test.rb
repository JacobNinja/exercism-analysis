require File.expand_path('../test_helper', __FILE__)

class ControlFlowAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def analyzer
    Exercism::Analyzers::ControlFlow
  end

  attr_reader :ruby

  def test_and
    @ruby = 'foo and bar'
    assert_equal [@ruby], feedback.map(&:src)
    assert_equal [:and], feedback.map(&:type)
    assert_equal [1], feedback.map(&:line)
  end

  def test_or
    @ruby = 'foo or bar'
    assert_equal [@ruby], feedback.map(&:src)
    assert_equal [:or], feedback.map(&:type)
  end

  def test_not
    @ruby = 'not foo'
    assert_equal [@ruby], feedback.map(&:src)
    assert_equal [:not], feedback.map(&:type)
  end

end