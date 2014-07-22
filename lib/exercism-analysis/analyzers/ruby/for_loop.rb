class Exercism
  module Analyzers

    class ForLoop < Analyzer

      processor Processors::ForLoopProcessor

      def call
        feedback = processor.result.map do |exp|
          Feedback.from_src(:for_loop, exp.src_extract, replace_for_with_each(exp))
        end
        Result.new(:for_loop, feedback)
      end

      private

      def replace_for_with_each(exp)
        padding = padding(exp)
        <<-TEMPLATE
#{padding}#{exp.receiver.src}.each do |#{exp.params.src}|
#{padding}  #{exp.body.src}
#{padding}end
        TEMPLATE
      end

    end

  end
end