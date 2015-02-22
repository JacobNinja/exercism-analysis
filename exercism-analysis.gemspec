Gem::Specification.new do |s|
  s.name = 'exercism-analysis'
  s.version = '0.1.0'
  s.date = '2014-06-17'

  s.summary = 'summary'
  s.description = 'description'

  s.authors = ['Jacob Richardson']
  s.email = 'jacob.ninja.dev@gmail.com'

  s.require_paths = %w[lib]

  s.add_development_dependency('test-unit', '2.5.5')
  s.add_dependency('roodi', '~> 4.0')
  s.add_dependency('codeminer', '~> 0.1')

  s.files = %w[
    exercism-analysis.gemspec
    lib/exercism-analysis.rb
    lib/exercism-analysis/analysis.rb
  ]
  s.files += Dir.glob('lib/exercism-analysis/adapters/*.rb')
  s.files += Dir.glob('lib/exercism-analysis/analyzers/**/*.rb')
  s.files += Dir.glob('lib/exercism-analysis/processors/*.rb')
  s.files += Dir.glob('lib/exercism-analysis/templates/*.rb')
  s.files += Dir.glob('vendor/**/*')

end