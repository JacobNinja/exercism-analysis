class Exercism

  class Analysis

    def initialize(adapter)
      @adapter = adapter
    end

    def run(*analyzer_classes)
      analyzers = @adapter.process(analyzer_classes)
      analyzers.each_with_object({}) do |analyzer, result|
        result[analyzer.class] = analyzer.call
      end
    end

  end

end