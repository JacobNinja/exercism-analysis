require 'bundler'
Bundler.setup

require 'codeminer'

require File.expand_path('../exercism-analysis/processors/processor', __FILE__)
require File.expand_path('../exercism-analysis/processors/for_loop_processor', __FILE__)
require File.expand_path('../exercism-analysis/processors/iter_mutation_processor', __FILE__)
require File.expand_path('../exercism-analysis/processors/send_processor', __FILE__)

require File.expand_path('../exercism-analysis/analysis', __FILE__)
require File.expand_path('../exercism-analysis/adapters/javascript', __FILE__)
require File.expand_path('../exercism-analysis/adapters/ruby', __FILE__)
require File.expand_path('../exercism-analysis/adapters/python', __FILE__)
require File.expand_path('../exercism-analysis/adapters/go', __FILE__)
require File.expand_path('../exercism-analysis/adapters/clojure', __FILE__)

require File.expand_path('../exercism-analysis/analyzers/analyzer', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/ruby/for_loop', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/ruby/iter_mutation', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/ruby/roodi', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/ruby/send', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/javascript/jslint', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/python/pylint', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/go/golint', __FILE__)
require File.expand_path('../exercism-analysis/analyzers/clojure/kibit', __FILE__)
