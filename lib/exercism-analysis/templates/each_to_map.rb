class Exercism
  module Templates

    class EachToMap < Template

      def initialize(mutation)
        @mutation =  mutation
      end

      def render
        [padding(@mutation.iter), "#{@mutation.variable.value} = ",
        CodeMiner::Substitution.new(@mutation.iter).substitute(*mutation_substitutions, each_to_map_substitution)].join
      end

      def mutation_substitutions
        @mutation.mutators.map do |mutator|
          CodeMiner::Substitution::Value.new(mutator.exp, mutator.exp.body.src)
        end
      end

      def each_to_map_substitution
        invocation = [@mutation.iter.value, 'map'] - BLACKLIST
        CodeMiner::Substitution::Value.new(@mutation.iter.token, invocation.join('.'), @mutation.iter.column)
      end

    end

  end
end