class Exercism
  module Templates

    class EachToMap < Template

      def initialize(mutation)
        @mutation =  mutation
      end

      def render
        <<-TEMPLATE
#{@mutation.variable.value} = #{invocation}.map do |#{@mutation.iter.block.params.src}|
  #{body}
end
        TEMPLATE
      end

      def invocation
        [@mutation.iter.receiver, @mutation.iter.token].compact.map(&:src).reject(&BLACKLIST.method(:include?)).join('.')
      end

      private

      def body
        [lines_before_mutation, @mutation.mutators.first.exp.body.src].reject(&:empty?).join("\n")
      end

      def lines_before_mutation
        @mutation.iter.block.body.src.lines.take(@mutation.mutators.first.exp.line - @mutation.iter.line - 1).join
      end

    end

  end
end