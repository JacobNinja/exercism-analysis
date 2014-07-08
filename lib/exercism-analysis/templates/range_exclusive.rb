class Exercism
  module Templates

    class RangeExclusive < Template

      def initialize(range)
        @range = range
      end

      def render
        <<-TEMPLATE
#{@range.left.src}...#{@range.right.left.value}
        TEMPLATE
      end

    end

  end
end
