require 'sinatra/base'

class Evie::Controller::Base < Sinatra::Base
  # Change views direcory so it's not nested inside
  # the controller folder...
  set :views, File.dirname(__FILE__) + '/../../views'

  not_found do
    return 'Sorry, this page doesn\'t exist'
  end

  # Simple helper function for accessing global
  # application config.
  def evie
    return env['evie']
  end

end
