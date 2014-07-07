require File.expand_path('../../../templates/each_to_map', __FILE__)

class Exercism
  module Analyzers

    class IterMutation < Analyzer

      processor Processors::IterMutationProcessor

      def call
        feedback = processor.result.map do |mutation|
          Feedback.new(mutation.iter.src_extract, Templates::EachToMap.render(mutation))
        end
        Result.new(:iter_mutation, feedback)
      end

    end

  end
end