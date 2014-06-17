module Exercism
  module Adapters

    class Javascript

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def execute(*commands)
        `node #{commands.join(' ')}`
      end

    end

  end
end