class Exercism
  module Analyzers

    class Tab < Analyzer

      TAB_REGEX = /\A\s*\t+\s*\b/
      SPACE_REGEX = /\A\t* \t*\b/

      def call
        Result.new(:indentation, feedback)
      end

      def feedback
        feedback_lines_with_type.take(1).map do |(line, line_no), type|
          Feedback.from_line(type, line.chomp, line_no)
        end
      end

      def feedback_lines_with_type
        lines_with_tabs_and_spaces.zip([:tab_and_space]) + lines_with_tabs.zip([:tab])
      end

      def lines_with_tabs
        lines.select do |line, _|
          line =~ TAB_REGEX
        end
      end

      def lines_with_tabs_and_spaces
        lines_with_tabs.select do |line, _|
          line =~ SPACE_REGEX
        end
      end

    end

  end
end