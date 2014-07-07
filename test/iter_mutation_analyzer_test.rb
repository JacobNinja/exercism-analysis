require File.expand_path('../test_helper', __FILE__)

class IterMutationAnalyzerTest < AnalyzerTestCase

  attr_reader :code

  def adapter
    Exercism::Adapters::Ruby.new(code)
  end

  def analyzer
    Exercism::Analyzers::IterMutation
  end

  def setup
    @code = <<-RUBY
def foo
  array = []
  bar.each do |i|
    array << process(i)
  end
  array
end
    RUBY
  end

  def test_source
    assert_equal [<<-RUBY.chomp], feedback.map(&:src).map(&:extract)
bar.each do |i|
    array << process(i)
  end
    RUBY
  end

  def test_replacement
    assert_equal [<<-RUBY], feedback.map(&:replacement)
array = bar.map do |i|
  process(i)
end
    RUBY
  end

  def test_push
    @code = <<-RUBY
def foo
  array = []
  bar.each do |i|
    array.push process(i)
  end
  array
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
array = bar.map do |i|
  process(i)
end
    RUBY
  end

end