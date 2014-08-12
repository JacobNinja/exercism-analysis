require File.expand_path('../test_helper', __FILE__)

class IndentationAnalyzerTest < AnalyzerTestCase

  def analyzer
    Exercism::Analyzers::Indentation
  end

  def assert_inconsistent(code, line)
    adapter = Exercism::Adapters::Ruby.new(code)
    indentation_feedback = feedback(adapter)
    assert_equal [:inconsistent_spacing], indentation_feedback.map(&:type)
    assert_equal [line], indentation_feedback.map(&:line)
  end

  def test_if_consistent
    assert_empty feedback(Exercism::Adapters::Ruby.new(<<-RUBY))
if foo
  bar
else
  baz
end
    RUBY
  end

  def test_single_line
    assert_empty feedback(Exercism::Adapters::Ruby.new(<<-RUBY))
if foo then bar else baz end
    RUBY
  end

  def test_if_end
    assert_inconsistent(<<-RUBY, 1)
if foo
  bar
 end
    RUBY
  end

  def test_if_else
    assert_inconsistent(<<-RUBY, 1)
  if foo
    bar
else
    baz
  end
    RUBY
  end

  def test_elsif
    assert_inconsistent(<<-RUBY, 3)
if foo
  bar
elsif baz
  false
  else
  true
end
    RUBY
  end

end