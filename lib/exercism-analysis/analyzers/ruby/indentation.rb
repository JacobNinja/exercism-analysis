class Exercism
  module Analyzers

    class Indentation < Analyzer

      processor Processors::IndentationProcessor

      def call
        Result.new(:indentation, feedback)
      end

      def feedback
        processor.result.map do |exp|
          Feedback.from_src(:inconsistent_spacing, exp.src_extract)
        end
      end

    end

  end
end