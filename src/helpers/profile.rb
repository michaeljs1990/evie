require 'deep_merge'

module Evie::Helper::Profile

  include Evie::Helper::Config

  # Kick the provisioning process off
  def get_profile asset
    # Load in the default config
    nodeclass = profile[asset.NODECLASS]
    defaults = profile['defaults'] 

    # Check if the nodeclass has special setting
    # if it does merge the arrays.
    if nodeclass
      return defaults.deep_merge! nodeclass
    end

    token = get_token asset.NODECLASS
    defaults['vault_token'] = token

    return defaults 
  end

  # Return a static token for testing.
  def get_token nodeclass
    'd8b5320c-d230-1607-8746-1eda271eeed3'
  end

end
