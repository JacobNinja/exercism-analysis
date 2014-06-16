module Exercism
  module Adapters

    class PythonAdapter

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def execute(*commands)
        `python #{commands.join(' ')}`
      end

    end

  end
end