require File.expand_path('../test_helper', __FILE__)

class ShebangAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(ruby)
  end

  def analyzer
    Exercism::Analyzers::Shebang
  end

  attr_reader :ruby

  def test_shebang
    @ruby = <<-RUBY
#!/usr/bin/env ruby

foo()
    RUBY
    assert_equal [:shebang], feedback.map(&:type)
    assert_equal ['#!/usr/bin/env ruby'], feedback.map(&:src)
  end

end
