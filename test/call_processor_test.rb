require File.expand_path('../test_helper', __FILE__)

class CallProcessorTest < Test::Unit::TestCase

  def test_command
    subject = Exercism::Processors::CallProcessor.new(['puts'])
    ruby = 'puts "foo"'
    CodeMiner.process(ruby, [subject])

    assert_not_empty subject.result
    result = subject.result.first
    assert_equal ruby, result.src
  end

end