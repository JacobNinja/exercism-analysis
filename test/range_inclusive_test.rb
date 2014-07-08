require File.expand_path('../test_helper', __FILE__)

class RangeAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(code)
  end

  def analyzer
    Exercism::Analyzers::Range
  end

  def setup
    @code = <<-RUBY
foo..bar - 1
    RUBY
  end

  def test_source
    assert_equal [@code.chomp], feedback.map(&:src).map(&:extract)
  end

  def test_replacement
    assert_equal [<<-RUBY], feedback.map(&:replacement)
foo...bar
    RUBY
  end

end