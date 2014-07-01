require File.expand_path('../test_helper', __FILE__)

class ForAnalyzerTest < Test::Unit::TestCase

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

  def feedback
    adapter = Exercism::Adapters::Ruby.new(ruby, CodeMiner::Parser)
    Exercism::Analyzers::ForLoop.call(adapter).feedback.tap do |feedback|
      assert !feedback.empty?, 'Expected feedback to not be empty'
    end
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