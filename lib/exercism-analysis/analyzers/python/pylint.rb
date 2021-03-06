require 'json'

class Exercism
  module Analyzers

    class Pylint < Analyzer

      def call
        raw_result = with_tempfile('python') {|temp| adapter.execute(runner_path, temp.path) }
        JSON.parse(raw_result).map do |result|
          ThirdPartyResult.new(result['message'], result['line'], result['column'])
        end
      end

      private

      def runner_path
        File.expand_path('../../../../../vendor/python/pylint_runner.py', __FILE__)
      end

    end

  end
end