require File.expand_path('../test_helper', __FILE__)

class PutsAnalyzerTest < AnalyzerTestCase

  def analyzer
    Exercism::Analyzers::Puts
  end

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def ruby
    @ruby || <<-RUBY.chomp
puts "foo"
    RUBY
  end

  def test_puts
    assert_equal [adapter.code], feedback.map(&:src)
  end

  def test_feedback_type
    assert_equal [:puts], feedback.map(&:type)
  end

  def test_p
    @ruby = 'p "foo"'
    assert_equal [adapter.code], feedback.map(&:src)
  end

  def test_print
    @ruby = 'print("foo")'
    assert_equal [adapter.code], feedback.map(&:src)
  end

end