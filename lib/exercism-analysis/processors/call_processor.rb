class Exercism
  module Processors

    class CallProcessor < Processor

      class Partial
        def initialize(method_names)
          @method_names = method_names
        end

        def new
          CallProcessor.new(@method_names)
        end
      end

      def self.partial(method_names)
        Partial.new(method_names)
      end

      def initialize(method_names)
        @method_names = method_names
        @calls = []
      end

      def process_command(exp)
        @calls << exp if @method_names.include?(exp.value)
      end

      alias process_call process_command
      alias process_fcall process_command

      def result
        @calls
      end

    end

  end
end