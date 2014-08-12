require File.expand_path('../test_helper', __FILE__)

class TabAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def analyzer
    Exercism::Analyzers::Tab
  end

  attr_reader :ruby

  def test_tabs
    @ruby = "\tfoo"
    assert_equal [:tab], feedback.map(&:type)
    assert_equal [@ruby], feedback.map(&:src)
    assert_equal [1], feedback.map(&:line)
  end

  def test_tabs_and_spaces
    @ruby = "\t foo"
    assert_equal [:tab_and_space], feedback.map(&:type)
  end

end