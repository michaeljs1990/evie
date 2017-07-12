module Evie::Helper::Config
  
  # Control the environment that all application
  # configuration is stored in. It should be accessed
  # via this method and never directly.
  def evie
    env['evie']
  end

  # Configuration used during the provisioning
  # process such as what OS should be installed
  # and so on.
  def profile
    env['profile']
  end

end
