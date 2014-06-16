module Exercism
end

require File.expand_path('../exercism-analysis/analysis', __FILE__)
require File.expand_path('../exercism-analysis/adapters/ruby_adapter', __FILE__)
require File.expand_path('../exercism-analysis/adapters/python_adapter', __FILE__)

require File.expand_path('../exercism-analysis/analyzers/analyzer', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/roodi_analyzer', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/pylint_analyzer', __FILE__)
