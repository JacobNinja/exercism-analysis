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
      Feedback = Struct.new(:src, :replacement) do
        def line
          src.line
        end

        def column
          src.column
        end

        def end_line
          src.end_line
        end

        def end_column
          src.end_column
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