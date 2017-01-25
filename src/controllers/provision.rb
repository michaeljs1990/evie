class Evie::Controller::Provision < Evie::Controller::Base

  # Kick off provisioning process
  post '/start' do
    collins = get_collins_client

    tag = request['tag']
    profile_id = request['profile_id']
    actor = request['actor']
    suffix = request['suffix']

    asset = collins.get(tag) # returns false on failure not nil
    raise "Asset #{tag} was not found" if not asset

    profiles = collins.provisioning_profiles()

  end 

  # Provide configuration that is needed
  # for genesis processes. All that business
  # logic yeah.
  get '/:asset/config' do
    return params['asset']
  end

end
