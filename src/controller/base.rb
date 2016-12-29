require 'sinatra/base'

class Evie::Controller::Base < Sinatra::Base
  
  not_found do
    return 'Sorry, this page doesn\'t exist'
  end

end
