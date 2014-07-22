require 'tempfile'

class Exercism
  module Analyzers

    class Analyzer

      def self.processor(klass)
        define_method(:processor) do
          @processor ||= klass.new
        end
      end

      attr_reader :processor, :adapter

      def initialize(adapter)
        @adapter = adapter
      end

      ThirdPartyResult = Struct.new(:message, :line, :column)
      Result = Struct.new(:type, :feedback)
      Feedback = Struct.new(:type, :src, :replacement, :line, :column, :end_line, :end_column) do

        def self.from_src(type, src, replacement)
          new(type, src.extract, replacement, src.line, src.column, src.end_line, src.end_column)
        end

        def self.from_line(type, line, line_no)
          new(type, line, nil, line_no, 0, line_no, line.length)
        end

      end

      def with_tempfile(name, &block)
        temp_file = Tempfile.new(name)
        temp_file.write(adapter.code)
        temp_file.flush
        result = block.call(temp_file)
        temp_file.unlink
        result
      end

      def padding(exp)
        ' ' * exp.column
      end

    end

  end
end