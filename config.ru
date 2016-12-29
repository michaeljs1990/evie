require_relative 'src/evie.rb'

map('/provision') { run Evie::Controller::Provision }
