class Exercism
  module Analyzers

    class Output < Analyzer

      STDOUT_METHODS = %w(p puts print)

      processor Processors::CallProcessor.partial(STDOUT_METHODS)

      def call
        feedback = processor.result.map do |exp|
          Feedback.from_src(:print, exp.src_extract)
        end
        Result.new(:output, feedback)
      end

    end

  end
end