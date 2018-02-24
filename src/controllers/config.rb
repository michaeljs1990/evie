require 'json'

class Evie::Controller::Config < Evie::Controller::Base

  get '/config' do
    content_type :json
    (evie).to_json
  end

end
