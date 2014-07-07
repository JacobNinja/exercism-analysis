require 'json'

class Exercism
  module Analyzers

    class Jslint < Analyzer

      def call
        raw_result = with_tempfile('javascript') {|temp| adapter.execute(runner_path, temp.path) }
        JSON.parse(raw_result).map do |result|
          ThirdPartyResult.new(result['reason'], result['line'], result['character'])
        end
      end

      private

      def runner_path
        File.expand_path('../../../../../vendor/javascript/jshint_runner.js', __FILE__)
      end

    end

  end
end