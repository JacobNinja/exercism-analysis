require 'json'

module Exercism
  module Analyzers

    class Jslint < Analyzer

      def self.call(adapter)
        raw_result = with_tempfile('javascript', adapter) {|temp| adapter.execute(runner_path, temp.path) }
        JSON.parse(raw_result).map do |result|
          Result.new(result['reason'], result['line'], result['character'])
        end
      end

      private

      def self.runner_path
        File.expand_path('../../../../vendor/javascript/jshint_runner.js', __FILE__)
      end

    end

  end
end