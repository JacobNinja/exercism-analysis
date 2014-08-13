class Exercism
  module Processors

    class IndentationProcessor < Processor

      def self.inconsistent_end(*events)
        events.each do |event|
          define_method "process_#{event}" do |exp|
            if inconsistent_end?(exp)
              @inconsistent_nodes << exp
            end
          end
        end
      end

      inconsistent_end :for, :class, :def, :defs

      def initialize
        @inconsistent_nodes = []
      end

      def result
        @inconsistent_nodes.select(&method(:multiple_lines?))
      end

      def process_if(exp)
        if inconsistent_end?(exp) || (exp.else_statement && inconsistent?(exp, exp.else_statement))
          @inconsistent_nodes << exp
        end
      end

      alias process_elsif process_if

      def process_case(exp)
        if inconsistent_end?(exp) || exp.whens.any? {|when_exp| inconsistent?(exp, when_exp, 2) }
          @inconsistent_nodes << exp
        end
      end

      def process_begin(exp)
        if inconsistent_end?(exp) || [exp.rescue, exp.ensure].compact.any? {|e| inconsistent?(exp, e)}
          @inconsistent_nodes << exp
        end
      end

      private

      def inconsistent?(a, b, offset=0)
        a.column != b.column - offset
      end

      def inconsistent_end?(exp)
        exp.column != (exp.end_column - 'end'.length)
      end

      def multiple_lines?(exp)
        exp.line != exp.end_line
      end

    end

  end
end