require File.expand_path('../test_helper', __FILE__)

class IndentationAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def analyzer
    Exercism::Analyzers::Indentation
  end

  attr_reader :ruby

  def test_tabs
    @ruby = "\tfoo"
    assert_equal [:tab], feedback.map(&:type)
    assert_equal [@ruby], feedback.map(&:src)
    assert_equal [1], feedback.map(&:line)
  end

  def test_inconsistent_spacing
    @ruby = <<-RUBY
def foo
  bar
   baz
end
    RUBY
    assert_equal [:inconsistent_spacing], feedback.map(&:type)
    assert_equal ['   baz'], feedback.map(&:src)
    assert_equal [3], feedback.map(&:line)
  end

  def test_inconsistent_spacing_with_tabs
    @ruby = <<-RUBY
def foo
#{"\t\t"}bar
#{"\t\t\t"}baz
end
    RUBY
    assert_equal [:inconsistent_spacing, :tab], feedback.map(&:type)
    assert_equal ["\t\t\tbaz", "\t\tbar"], feedback.map(&:src)
    assert_equal [3, 2], feedback.map(&:line)
  end

end