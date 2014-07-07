class Exercism
  module Adapters

    class Ruby

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def ast
        @ast ||= CodeMiner.parse(@code)
      end

    end

  end
end