class Exercism
  module Analyzers

    class ForLoop < Analyzer

      def self.call(adapter)
        processor = Processors::ForLoopProcessor.new
        CodeMiner.process(adapter.code, [processor])

        feedback = processor.result.map do |exp|
          Feedback.new(exp.src_extract, replace_for_with_each(exp))
        end
        Result.new(:for_loop, feedback)
      end

      private

      def self.replace_for_with_each(exp)
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