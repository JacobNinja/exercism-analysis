class Exercism
  module Analyzers

    class LoopConditional < Analyzer

      processor Processors::LoopConditionalProcessor

      def call
        Result.new(:loop_conditional, feedback)
      end

      def feedback
        processor.result.map do |exp|
          Feedback.from_src(:loop_conditional, exp.src_extract)
        end
      end

    end

  end
end
