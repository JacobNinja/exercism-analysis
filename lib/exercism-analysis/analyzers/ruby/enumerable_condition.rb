class Exercism
  module Analyzers

    class EnumerableCondition < Analyzer

      processor Processors::EnumerableConditionProcessor

      def call
        Result.new(:enumerable_condition, feedback)
      end

      def feedback
        processor.result.map do |exp|
          Feedback.from_src(:enumerable_condition, exp.src_extract)
        end
      end

    end

  end
end
