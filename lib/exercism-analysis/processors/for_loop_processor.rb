class Exercism
  module Processors

    class ForLoopProcessor < Processor

      def initialize
        @fors = []
      end

      def process_for(exp)
        @fors << exp
      end

      def result
        @fors
      end

    end

  end
end