class Exercism
  module Processors

    class RangeProcessor

      def initialize
        @ranges = []
      end

      def process_dot2(exp)
        @ranges << exp
      end

      def result
        @ranges
      end

      alias process_dot3 process_dot2

    end

  end
end