class Exercism
  module Processors

    class IndentationProcessor < Processor

      def initialize
        @inconsistent_nodes = []
      end

      def result
        @inconsistent_nodes
      end

      def process_if(exp)
        if inconsistent?(exp)
          @inconsistent_nodes << exp
        end
      end

      alias process_elsif process_if

      private

      def inconsistent?(exp)
        multiple_lines?(exp) && (inconsistent_end?(exp) || inconsistent_else?(exp))
      end

      def inconsistent_end?(exp)
        exp.column != (exp.end_column - 'end'.length)
      end

      def inconsistent_else?(exp)
        exp.else_statement && exp.column != exp.else_statement.column
      end

      def multiple_lines?(exp)
        exp.line != exp.end_line
      end

    end

  end
end