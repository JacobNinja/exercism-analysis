Gem::Specification.new do |s|
  s.name = 'exercism-analysis'
  s.version = '0.1.0'
  s.date = '2014-06-17'

  s.summary = 'summary'
  s.description = 'description'

  s.authors = ['Jacob Richardson']
  s.email = 'jacob.ninja.dev@gmail.com'

  s.require_paths = %w[lib]

  s.add_dependency('roodi', '~> 4.0')

  s.files = %w[
    exercism-analysis.gemspec
    lib/exercism-analysis.rb
    lib/exercism-analysis/analysis.rb
    lib/exercism-analysis/adapters/adapter.rb
    lib/exercism-analysis/adapters/clojure.rb
    lib/exercism-analysis/adapters/go.rb
    lib/exercism-analysis/adapters/javascript.rb
    lib/exercism-analysis/adapters/python.rb
    lib/exercism-analysis/adapters/ruby.rb
    lib/exercism-analysis/analyzers/analyzer.rb
    lib/exercism-analysis/analyzers/javascript/jslint.rb
    lib/exercism-analysis/analyzers/python/pylint.rb
    lib/exercism-analysis/analyzers/ruby/for_loop.rb
    lib/exercism-analysis/analyzers/ruby/iter_mutation.rb
    lib/exercism-analysis/analyzers/ruby/roodi.rb
    lib/exercism-analysis/analyzers/ruby/send.rb
    lib/exercism-analysis/analyzers/go/golint.rb
    lib/exercism-analysis/analyzers/clojure/kibit.rb
    lib/exercism-analysis/processors/processor.rb
    lib/exercism-analysis/processors/for_loop_processor.rb
    lib/exercism-analysis/processors/iter_mutation_processor.rb
    lib/exercism-analysis/processors/send_processor.rb
    lib/exercism-analysis/templates/template.rb
    lib/exercism-analysis/templates/each_to_map.rb
    lib/exercism-analysis/templates/each_to_select.rb
  ]
  s.files += Dir.glob('vendor/**/*')

end