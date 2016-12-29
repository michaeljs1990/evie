require_relative 'src/evie.rb'

# Make sure that static files are served from
# public which seems to be off by default with Rack
run Rack::Directory.new("./public")

# Application Routes
map('/provision') { run Evie::Controller::Provision }
