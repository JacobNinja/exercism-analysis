class Exercism
  module Adapters

    class Go

      attr_reader :code

      def initialize(code)
        @code = code
      end

      def execute(*commands)
        `GOPATH=#{go_path} go #{commands.join(' ')}`
      end

      private

      def go_path
        File.expand_path('../../../../vendor/go', __FILE__)
      end

    end

  end
end