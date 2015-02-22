class Exercism
  module Analyzers

    class Puts < Analyzer

      METHOD_NAME = 'puts'

      processor Processors::CallProcessor.partial([METHOD_NAME])

      def call
        feedback = processor.result.map do |exp|
          Feedback.from_src(:puts, exp.src_extract)
        end
        Result.new(:puts, feedback)
      end

    end

  end
end