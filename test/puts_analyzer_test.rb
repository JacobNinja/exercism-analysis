require File.expand_path('../test_helper', __FILE__)

class PutsAnalyzerTest < AnalyzerTestCase

  def analyzer
    Exercism::Analyzers::Puts
  end

  def adapter
    Exercism::Adapters::Ruby.new(<<-RUBY.chomp)
puts "foo"
    RUBY
  end

  def test_source
    assert_equal [adapter.code], feedback.map(&:src)
  end

  def test_feedback_type
    assert_equal [:puts], feedback.map(&:type)
  end

end