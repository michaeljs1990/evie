module Evie::Helper::Config
  
  # Control the environment that all application
  # configuration is stored in. It should be accessed
  # via this method and never directly.
  def evie
    return env['evie']
  end

end
