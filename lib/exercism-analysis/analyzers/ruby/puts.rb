class Exercism
  module Analyzers

    class Puts < Analyzer

      STDOUT_METHODS = %w(p puts print)

      processor Processors::CallProcessor.partial(STDOUT_METHODS)

      def call
        feedback = processor.result.map do |exp|
          Feedback.from_src(:puts, exp.src_extract)
        end
        Result.new(:puts, feedback)
      end

    end

  end
end