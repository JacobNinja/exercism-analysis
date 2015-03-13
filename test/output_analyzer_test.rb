require File.expand_path('../test_helper', __FILE__)

class OutputAnalyzerTest < AnalyzerTestCase

  def analyzer
    Exercism::Analyzers::Output
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

  def test_type
    assert_equal :output, result.type
    assert_equal [:print], feedback.map(&:type)
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