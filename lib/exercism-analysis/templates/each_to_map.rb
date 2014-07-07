class Exercism
  module Templates

    class EachToMap

      def self.render(mutation)
        new(mutation).render
      end

      def initialize(mutation)
        @mutation =  mutation
      end

      def render
        <<-TEMPLATE
#{@mutation.variable.value} = #{@mutation.iter.receiver.value}.map do |#{@mutation.iter.block.params.src}|
  #{body}
end
        TEMPLATE
      end

      private

      def body
        [lines_before_mutation, @mutation.mutator.body.src].reject(&:empty?).join("\n")
      end

      def lines_before_mutation
        @mutation.iter.block.body.src.lines.take(@mutation.mutator.line - @mutation.iter.line - 1).join
      end

    end

  end
end