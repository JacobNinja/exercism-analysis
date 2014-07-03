require File.expand_path('../test_helper', __FILE__)

class SendAnalyzerTest < AnalyzerTestCase

  attr_reader :code
  def setup
    @code = 'foo.send(:bar)'
  end

  def adapter
    Exercism::Adapters::Ruby.new(code)
  end

  def analyzer
    Exercism::Analyzers::Send
  end

  def test_source
    assert_equal [code], feedback.map(&:src).map(&:extract)
  end

  def test_replacement
    assert_equal [<<-REPLACEMENT.chomp], feedback.map(&:replacement)
foo.public_send(:bar)
    REPLACEMENT
  end

end