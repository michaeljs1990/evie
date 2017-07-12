require 'sinatra/base'

class Evie::Controller::Base < Sinatra::Base

  include Evie::Helper::Config
  include Evie::Helper::Collins

  before do
    @collins = get_collins_client
  end

  # Change views direcory so it's not nested inside
  # the controller folder...
  set :views, File.dirname(__FILE__) + '/../../views'

  not_found do
    return 'Sorry, this page doesn\'t exist'
  end

end
