require 'json'

class Exercism
  module Analyzers

    class Kibit < Analyzer

      def self.call(adapter)
        raw_result = with_tempfile('clojure', adapter) {|temp| adapter.execute(jar_path, 'kibit_runner.core', temp.path) }
        JSON.parse(raw_result).map do |result|
          reason = "Expression #{result['expr']} can be simplified to #{result['alt']}"
          Result.new(reason, result['line'], result['column'])
        end
      end

      private

      def self.jar_path
        File.expand_path('../../../../../vendor/clojure/kibit-runner/target/kibit-runner-0.1.0-SNAPSHOT-standalone.jar', __FILE__)
      end

    end

  end
end