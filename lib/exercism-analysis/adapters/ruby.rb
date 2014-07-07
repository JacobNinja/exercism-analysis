class Exercism
  module Adapters

    class Ruby < Adapter

      def ast
        @ast ||= CodeMiner.parse(code)
      end

      def process(analyzer_classes)
        super(analyzer_classes).tap do |analyzers|
          CodeMiner.process(code, analyzers.map(&:processor).compact)
        end
      end

    end

  end
end