module Exercism

  class Analysis

    def initialize(adapter)
      @adapter = adapter
    end

    def run(*analyzers)
      analyzers.each_with_object({}) do |analyzer, result|
        result[analyzer] = analyzer.call(@adapter)
      end
    end

  end

end