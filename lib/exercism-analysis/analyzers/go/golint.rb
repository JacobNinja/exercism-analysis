class Exercism
  module Analyzers

    class Golint < Analyzer

      def call
        raw_result = with_tempfile('go') {|temp| adapter.execute('run', runner_path, temp.path) }
        raw_result.each_line.map do |result|
          _, line, column, reason = result.split(':')
          ThirdPartyResult.new(reason.lstrip.chomp, line, column)
        end
      end

      private

      def runner_path
        File.expand_path('../../../../../vendor/go/src/runner/golint_runner.go', __FILE__)
      end

    end

  end
end