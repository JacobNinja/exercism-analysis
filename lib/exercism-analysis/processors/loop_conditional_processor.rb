class Exercism
  module Processors

    class LoopConditionalProcessor < Processor

      ENUMERABLE_METHODS = Set.new(%w(each))

      def initialize
        @conditionals = []
      end

      def process_method_add_block(exp)
        if ENUMERABLE_METHODS.include?(exp.value)
          @conditionals += find_exps(exp.block, :condition)
        end
      end

      def result
        @conditionals
      end

    end

  end
end
