require File.expand_path('../test_helper', __FILE__)

class IterMutationAnalyzerTest < AnalyzerTestCase

  def adapter
    Exercism::Adapters::Ruby.new(code)
  end

  def analyzer
    Exercism::Analyzers::IterMutation
  end

  def setup
    @code = <<-RUBY
def foo
  array = []
  bar.each do |i|
    array << process(i)
  end
  array
end
    RUBY
  end

  def test_source
    assert_equal [<<-RUBY.chomp], feedback.map(&:src).map(&:extract)
bar.each do |i|
    array << process(i)
  end
    RUBY
  end

  def test_replacement
    assert_equal [<<-RUBY], feedback.map(&:replacement)
array = bar.map do |i|
  process(i)
end
    RUBY
  end

  def test_push
    @code = <<-RUBY
def foo
  array = []
  bar.each do |i|
    array.push process(i)
  end
  array
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
array = bar.map do |i|
  process(i)
end
    RUBY
  end

  def test_times
    @code = <<-RUBY
def foo
  array = []
  foo.times do |n|
    array << n * 2
  end
  array
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
array = foo.times.map do |n|
  n * 2
end
    RUBY
  end

  def test_condition
    @code = <<-RUBY
def foo
  array = []
  foo.each do |i|
    if i % 2 == 0
      array << i
    end
  end
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
  array = foo.select do |i|
    i % 2 == 0
  end
    RUBY
  end

  def test_nested_condition
    @code = <<-RUBY
def foo
  array = []
  foo.each do |i|
    if i.present?
      if i % 2 == 0
        array << i
      end
    end
  end
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
  array = foo.select do |i|
    if i.present?
      i % 2 == 0
    end
  end
    RUBY
  end

  def test_multiple_conditions
    @code = <<-RUBY
def foo
  array = []
  foo.each do |i|
    if i.even?
      if i % 2 == 0
        array << i
      end
    elsif i.odd?
      if i % 2 == 1
        array << i
      end
    end
  end
end
    RUBY
    assert_equal [<<-RUBY], feedback.map(&:replacement)
  array = foo.select do |i|
    if i.even?
      i % 2 == 0
    elsif i.odd?
      i % 2 == 1
    end
  end
    RUBY
  end

end