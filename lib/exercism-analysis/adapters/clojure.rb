class Exercism
  module Adapters

    class Clojure < Adapter

      def execute(jar, namespace, argument)
        `java -cp #{[jar, namespace, argument].join(' ')}`
      end

    end

  end
end