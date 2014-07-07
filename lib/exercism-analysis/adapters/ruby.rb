class Exercism
  module Adapters

    class Ruby < Adapter

      def ast
        @ast ||= CodeMiner.parse(code)
      end


    end

  end
end