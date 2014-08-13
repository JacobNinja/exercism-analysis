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

  def assert_consistent(code)
    assert_empty feedback(Exercism::Adapters::Ruby.new(code))
  end

  def test_if_consistent
    assert_consistent <<-RUBY
if foo
  bar
else
  baz
end
    RUBY
  end

  def test_single_line
    assert_consistent <<-RUBY
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

  def test_case_consistent
    assert_consistent(<<-RUBY)
case foo
  when bar then baz
  when bar
    baz
  else
    baz
end
    RUBY
  end

  def test_case_end
    assert_inconsistent(<<-RUBY, 1)
case foo
  when bar
    baz
  end
    RUBY
  end

  def test_case_when
    assert_inconsistent(<<-RUBY, 1)
case foo
when bar
  baz
end
    RUBY
  end

  def test_class_end
    assert_inconsistent(<<-RUBY, 1)
class Foo
 end
    RUBY
  end

  def test_method_end
    assert_inconsistent(<<-RUBY, 1)
def foo
 end
    RUBY
  end

  def test_begin_end
    assert_inconsistent(<<-RUBY, 1)
begin
 end
    RUBY
  end

  def test_begin_rescue
    assert_inconsistent(<<-RUBY, 1)
begin
  foo
 rescue
  bar
end
    RUBY
  end

  def test_begin_ensure
    assert_inconsistent(<<-RUBY, 1)
begin
  foo
 ensure
  bar
end
    RUBY
  end

  def test_for_end
    assert_inconsistent(<<-RUBY, 1)
for i in foo
 end
    RUBY
  end

  def test_until_consistent
    assert_consistent 'foo until bar'
  end

  def test_until_end
    assert_inconsistent(<<-RUBY, 1)
until bar
  foo
 end
    RUBY
  end

  def test_while_end
    assert_inconsistent(<<-RUBY, 1)
while bar
  foo
 end
    RUBY
  end

end