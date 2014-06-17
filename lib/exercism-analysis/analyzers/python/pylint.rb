require 'json'

class Exercism
  module Analyzers

    class Pylint < Analyzer

      def self.call(adapter)
        raw_result = with_tempfile('python', adapter) {|temp| adapter.execute(runner_path, temp.path) }
        JSON.parse(raw_result).map do |result|
          Result.new(result['message'], result['line'], result['column'])
        end
      end

      private

      def self.runner_path
        File.expand_path('../../../../../vendor/python/pylint_runner.py', __FILE__)
      end

    end

  end
end