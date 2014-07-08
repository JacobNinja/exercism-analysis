require File.expand_path('../../../templates/each_to_map', __FILE__)
require File.expand_path('../../../templates/each_to_select', __FILE__)

class Exercism
  module Analyzers

    class IterMutation < Analyzer

      processor Processors::IterMutationProcessor

      def call
        feedback = processor.result.map do |mutation|
          Feedback.new(mutation.iter.src_extract, mutation_replacement(mutation))
        end
        Result.new(:iter_mutation, feedback)
      end

      private

      def mutation_replacement(mutation)
        if filter?(mutation)
          Templates::EachToSelect.render(mutation)
        else
          Templates::EachToMap.render(mutation)
        end
      end

      def filter?(mutation)
        mutation.iter.block.params.each_param.any? {|param| mutation.mutators.map{|m| m.exp.body.value }.include?(param.value) }
      end

    end

  end
end