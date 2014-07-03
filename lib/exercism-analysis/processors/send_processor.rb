class Exercism
  module Processors

    class SendProcessor

      def initialize
        @calls_to_send = []
      end

      def process_call(exp)
        if exp.value == 'send'
          @calls_to_send << exp
        end
      end

      def result
        @calls_to_send
      end

    end

  end
end