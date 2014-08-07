class Exercism
  module Analyzers

    class Tab < Analyzer

      def call
        Result.new(:indentation, feedback)
      end

      def feedback
        lines_with_tabs.map do |(line, line_no)|
          Feedback.from_line(:tab, line.chomp, line_no)
        end
      end

      def lines_with_tabs
        lines.select do |line, _|
          line =~ /\t/
        end.take(1)
      end

    end

  end
end