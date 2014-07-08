class Exercism
  module Templates

    class EachToSelect < Template

      def initialize(mutation)
        @mutation = mutation
      end

      def render
        <<-TEMPLATE
#{padding(@mutation.iter.receiver)}#{@mutation.variable.value} = #{invocation}.select do |#{iter_block.params.src}|
#{body}
#{padding(@mutation.iter.receiver)}end
        TEMPLATE
      end

      private

      def invocation
        [@mutation.iter.receiver, @mutation.iter.token].compact.map(&:src).reject(&BLACKLIST.method(:include?)).join('.')
      end

      def body
        [pad(lines_before_mutation(@mutation.mutators.first), iter_block.body.each.first).chomp,
         mutation_replacements.zip(lines_between_mutations).map{|lines| lines.join("\n")}.join.chomp,
         lines_after_mutation(@mutation.mutators.last)].reject(&:empty?).join("\n")
      end

      def lines_before_mutation(mutator)
        iter_block.body.src.lines.take(mutator.condition.line - @mutation.iter.line - 1).join
      end

      def lines_between_mutations
        @mutation.mutators.map(&:condition).each_cons(2).map do |a, b|
          iter_block.body.src.lines.slice(a.end_line - iter_block.line...b.line - iter_block.end_line).to_a.join
        end
      end

      def lines_after_mutation(mutator)
        iter_block.body.src.lines.drop(mutator.condition.end_line - @mutation.iter.line).join
      end

      def mutation_replacements
        @mutation.mutators.map do |mutator|
          pad(mutator.condition.test.src.chomp, mutator.condition)
        end
      end

      def iter_block
        @mutation.iter.block
      end

    end

  end
end