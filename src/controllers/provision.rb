
class Evie::Controller::Provision < Evie::Controller::Base

  include Evie::Helper::Provision

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
    # Get the correct profile for provisioning this asset
    profile = profiles.detect { |x| x.profile == profile_id } if profiles.is_a? Array
    raise "No profile could be found for #{profile_id}" if profile.nil?

    start_provision(collins, asset, profile, actor, suffix)
  end 

  # Provide configuration that is needed
  # for genesis processes. All that business
  # logic yeah.
  get '/config/:asset' do
    return params['asset']
  end

end
