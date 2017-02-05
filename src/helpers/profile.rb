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

    return defaults 
  end

end
