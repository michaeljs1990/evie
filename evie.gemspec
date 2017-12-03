require 'date'

Gem::Specification.new do |gem|
  gem.name    = 'evie'
  gem.version = '0.1'
  gem.date    = Date.today.to_s

  gem.summary = "Evie is glue for tumblr's collins & genesis"
  gem.description = "Manage the provisioning of assets"

  gem.authors  = ['Michael Schuett']
  gem.email    = 'michaeljs1990@gmail.com'
  gem.homepage = 'https://github.com/michaeljs1990/evie'

  gem.add_dependency('rake', '12.0.0')
  gem.add_dependency('sinatra', '1.4.7')
  gem.add_dependency('bundler', '1.13.7')
  gem.add_dependency('puma', '3.6.2')
  gem.add_dependency('collins-cli', '0.2.10')
  gem.add_dependency('deep_merge', '1.1.1')

  gem.add_development_dependency('rspec', [">= 2.0.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,src,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end

