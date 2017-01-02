class Evie::Controller::Provision < Evie::Controller::Base

  get '/:asset/config.json' do
    return params['asset']
  end

end
