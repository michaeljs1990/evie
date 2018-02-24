require 'yaml'

require_relative 'src/evie.rb'

# Make sure that static files are served from
# public which seems to be off by default with Rack
run Rack::Directory.new("./public")

# http://www.rubydoc.info/github/rack/rack/Rack/Config
if ENV['EVIE_CONFIG'].nil?
  raise ArgumentError, 'EVIE_CONFIG env is not defined.'
end

if not File.exist?(ENV['EVIE_CONFIG'])
  raise ArgumentError, "#{ENV['EVIE_CONFIG']} doesn't exist or couldn't be opened."
end


if ENV['PROFILE_CONFIG'].nil?
  raise ArgumentError, 'PROFILE_CONFIG env is not defined.'
end

if not File.exist?(ENV['PROFILE_CONFIG'])
  raise ArgumentError, "#{ENV['PROFILE_CONFIG']} doesn't exist or couldn't be opened."
end


use Rack::Config do |env|
  env['evie'] = YAML::load(File.open(ENV['EVIE_CONFIG']))
  env['profile'] = YAML::load(File.open(ENV['PROFILE_CONFIG']))
end

# Application Routes
map('/provision') { run Evie::Controller::Provision }
map('/ipxe') { run Evie::Controller::Ipxe }
map('/') { run Evie::Controller::Config }
