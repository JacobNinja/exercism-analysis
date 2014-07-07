class Exercism
  module Adapters

    class Javascript < Adapter

      def execute(*commands)
        `node #{commands.join(' ')}`
      end

    end

  end
end