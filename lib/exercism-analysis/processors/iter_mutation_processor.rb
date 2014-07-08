class Exercism
  module Processors

    class IterMutationProcessor < Processor

      Mutation = Struct.new(:iter, :variable, :mutator)

      SIDE_EFFECTS = %w(<< push)

      def initialize
        @mutations = []
      end

      def process_def(exp)
        assignment = find_exp(exp, :assign) {|e| e.body.type == :array }
        call_to_each = find_exp(exp, :call) {|e| e.block }
        if assignment && call_to_each
          if mutation = find_mutation_in_block(assignment, call_to_each)
            @mutations << Mutation.new(call_to_each, assignment, mutation)
          end
        end
      end

      def result
        @mutations
      end

      private

      def find_mutation_in_block(assignment, call_to_each)
        find_exp(call_to_each.block, :binary, :command) do |e|
          SIDE_EFFECTS.include?(e.value) && e.receiver.value == assignment.value
        end
      end

    end

  end
end