class Exercism
  module Analyzers

    class Indentation < Analyzer

      def call
        Result.new(:indentation, feedback)
      end

      def feedback
        lines_with_inconsistent_spacing.map do |(line, line_no)|
          Feedback.from_line(:inconsistent_spacing, line.chomp, line_no)
        end
      end

      def lines_with_inconsistent_spacing
        lines.each_cons(2).select do |(line, _), (line2, _)|
          whitespace_difference = whitespace_count(line2) - whitespace_count(line)
          whitespace_difference == 1 || whitespace_difference > 2
        end.map(&:last).take(1)
      end

      def whitespace_count(str)
        (str =~ /\S/).to_i
      end

    end

  end
end