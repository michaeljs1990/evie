require 'deep_merge'

module Evie::Helper::Profile

  include Evie::Helper::Config
  include Evie::Helper::Vault

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

end
