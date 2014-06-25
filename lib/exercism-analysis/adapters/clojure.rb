class Exercism
  module Adapters

    class Clojure

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def execute(jar, namespace, argument)
        `java -cp #{[jar, namespace, argument].join(' ')}`
      end

    end

  end
end