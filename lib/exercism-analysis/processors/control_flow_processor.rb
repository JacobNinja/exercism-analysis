class Exercism
  module Processors

    class ControlFlowProcessor < Processor

      CONTROL_FLOW = %w(and or)

      def initialize
        @control_flow = []
      end

      def process_binary(exp)
        if CONTROL_FLOW.include?(exp.value)
          @control_flow << exp
        end
      end

      alias process_unary process_binary

      def result
        @control_flow
      end

    end

  end
end
