class Exercism
  module Processors

    class IterMutationProcessor < Processor

      Mutation = Struct.new(:iter, :variable, :mutators)
      Mutator = Struct.new(:exp, :condition)

      SIDE_EFFECTS = %w(<< push)

      def initialize
        @mutations = []
      end

      def process_def(exp)
        assignment = find_exp(exp, :assign) {|e| e.body.type == :array }
        call_to_each = find_exp(exp, :call) {|e| e.block }
        if assignment && call_to_each
          if mutating_exps = find_mutations_in_block(assignment, call_to_each)
            mutators = mutating_exps.map do |exp|
              Mutator.new(exp, condition_surrounding_mutation(exp, call_to_each.block))
            end
            mutation = Mutation.new(call_to_each, assignment, mutators)
            @mutations << mutation
          end
        end
      end

      def result
        @mutations
      end

      private

      def condition_surrounding_mutation(mutation, block)
        find_exp(block, :condition) do |exp|
          [exp.consequence, exp.else_statement].compact.flat_map(&:each).include?(mutation)
        end
      end

      def find_mutations_in_block(assignment, call_to_each)
        find_exps(call_to_each.block, :binary, :command) do |e|
          SIDE_EFFECTS.include?(e.value) && e.receiver.value == assignment.value
        end
      end

    end

  end
end