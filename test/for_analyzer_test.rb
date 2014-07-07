require File.expand_path('../test_helper', __FILE__)

class ForAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def analyzer
    Exercism::Analyzers::ForLoop
  end

  attr_reader :ruby
  def setup
    @ruby = <<-RUBY.chomp
for i in foo
  if do_it()
    bar(i)
  end
end
    RUBY
  end

  def test_source
    assert_equal [ruby], feedback.map(&:src).map(&:extract)
  end

  def test_replacement
    replacement = <<-RUBY
foo.each do |i|
  if do_it()
    bar(i)
  end
end
    RUBY
    assert_equal [replacement], feedback.map(&:replacement)
  end

end