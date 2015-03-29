require File.expand_path('../test_helper', __FILE__)

class LoopConditionalAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(@ruby)
  end

  def analyzer
    Exercism::Analyzers::LoopConditional
  end

  def test_each_no_condition
    @ruby = <<-RUBY
foo.each do |bar|
  baz(bar)
end
    RUBY
    assert_empty feedback
  end

  def test_each
    @ruby = <<-RUBY
foo.each do |bar|
  baz if bar
end
    RUBY
    assert_equal [:loop_conditional], feedback.map(&:type)
    assert_equal ['baz if bar'], feedback.map(&:src)
  end

end
