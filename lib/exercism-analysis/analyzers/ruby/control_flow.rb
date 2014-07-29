class Exercism
  module Analyzers

    class ControlFlow < Analyzer

      processor Processors::ControlFlowProcessor

      def call
        Result.new(:control_flow, feedback)
      end

      def feedback
        processor.result.map do |exp|
          Feedback.from_src(:logical, exp.src_extract)
        end
      end

    end

  end
end