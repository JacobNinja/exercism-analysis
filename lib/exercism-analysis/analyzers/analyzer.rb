require 'tempfile'

class Exercism
  module Analyzers

    class Analyzer

      ThirdPartyResult = Struct.new(:message, :line, :column)

      def self.with_tempfile(name, adapter, &block)
        temp_file = Tempfile.new(name)
        temp_file.write(adapter.code)
        temp_file.flush
        result = block.call(temp_file)
        temp_file.unlink
        result
      end

    end

  end
end