class Exercism
  module Templates

    class EachToSelect < Template

      def initialize(mutation)
        @mutation = mutation
      end

      def render
        [padding(@mutation.iter), "#{@mutation.variable.value} = ",
         CodeMiner::Substitution.new(@mutation.iter).substitute(*mutation_substitutions, each_to_select_substitution)].join
      end

      private

      def each_to_select_substitution
        invocation = [@mutation.iter.value, 'select'] - BLACKLIST
        CodeMiner::Substitution::Value.new(@mutation.iter.token, invocation.join('.'), @mutation.iter.column)
      end

      def mutation_substitutions
        @mutation.mutators.map do |mutator|
          CodeMiner::Substitution::Value.new(mutator.condition, mutator.condition.test.src)
        end
      end

    end

  end
end