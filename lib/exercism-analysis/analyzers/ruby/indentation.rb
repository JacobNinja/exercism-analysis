class Exercism
  module Analyzers

    class Indentation < Analyzer

      def call
        Result.new(:indentation, tab_feedback)
      end

      def tab_feedback
        lines_with_tabs.map do |line, line_no|
          Feedback.new(:tab, line, nil, line_no, 0, line_no, line.length)
        end
      end

      def lines_with_tabs
        adapter.code.lines.zip(1..Float::INFINITY).select do |line, _|
          line =~ /\t/
        end
      end

    end

  end
end