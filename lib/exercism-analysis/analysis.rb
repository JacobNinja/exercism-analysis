module Exercism

  class Analysis

    def initialize(adapter)
      @adapter = adapter
    end

    def run(*analyzers)
      analyzers.each do |analyzer|
        analyzer.call(@adapter)
      end
    end

  end

end