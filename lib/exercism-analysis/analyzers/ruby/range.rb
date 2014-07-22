require File.expand_path('../../../templates/range_exclusive', __FILE__)

class Exercism
  module Analyzers

    class Range < Analyzer

      processor Processors::RangeProcessor

      def call
        feedback = processor.result.map do |range_exp|
          if range_exp.inclusive? && decrement_one?(range_exp.right)
            Feedback.from_src(:range, range_exp.src_extract, Templates::RangeExclusive.render(range_exp))
          end
        end.compact
        Result.new(:range_inclusive, feedback)
      end

      private

      def decrement_one?(exp)
        exp.value == '-' && exp.right.value == '1'
      end

    end

  end
end