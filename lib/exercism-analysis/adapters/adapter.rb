class Exercism
  module Adapters

    class Adapter

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def process(analyzer_classes)
        analyzer_classes.map do |klass|
          klass.new(self)
        end
      end

    end

  end


end