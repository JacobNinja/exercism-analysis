class Exercism
  module Analyzers

    class Golint < Analyzer

      def self.call(adapter)
        raw_result = with_tempfile('go', adapter) {|temp| adapter.execute('run', runner_path, temp.path) }
        raw_result.each_line.map do |result|
          _, line, column, reason = result.split(':')
          Result.new(reason.lstrip.chomp, line, column)
        end
      end

      private

      def self.runner_path
        File.expand_path('../../../../../vendor/go/src/runner/golint_runner.go', __FILE__)
      end

    end

  end
end