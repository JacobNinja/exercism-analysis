class Exercism
  module Analyzers

    class Shebang < Analyzer

      def call
        Result.new(:shebang, feedback)
      end

      def feedback
        shebang.map do |(line, line_no)|
          Feedback.from_line(:shebang, line.chomp, line_no)
        end
      end

      def shebang
        adapter.code.lines.zip(1..Float::INFINITY).select { |(l, _)| l.start_with?('#!') }.take(1)
      end

    end

  end
end