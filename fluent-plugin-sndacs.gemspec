Gem::Specification.new do |gem|
  gem.name = 'fluent-plugin-sndacs'
  gem.description = 'Sndacs output plugin for Fluent event collector'
  gem.homepage = 'https://github.com/sparkle/fluent-plugin-sndacs'
  gem.summary = gem.description
  gem.version = '0.0.3'
  gem.authors = 'Sparkle'
  gem.email = 'popeast@gmail.com'
  gem.files = `git ls-files`.split("\n")

  gem.add_dependency 'fluentd', ['>= 0.10.28', '< 2']
  gem.add_dependency 'sndacs', '~>0.2.4'
end

