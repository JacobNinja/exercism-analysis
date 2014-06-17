require 'ruby_parser'

module Exercism
  module Adapters

    class Ruby

      attr_reader :code

      def initialize(code, parser=RubyParser.new)
        @code = code
        @parser = parser
      end

      def ast
        @ast ||= @parser.parse(@code)
      end

    end

  end
end