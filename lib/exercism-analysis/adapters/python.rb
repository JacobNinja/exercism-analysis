class Exercism
  module Adapters

    class Python < Adapter

      def execute(*commands)
        `python #{commands.join(' ')}`
      end

    end

  end
end