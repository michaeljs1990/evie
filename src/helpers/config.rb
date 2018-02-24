require 'yaml'
require 'deep_merge'

module Evie::Helper::Config
  
  # Control the environment that all application
  # configuration is stored in. It should be accessed
  # via this method and never directly.
  def evie
    default_site = File.dirname(__FILE__) + "/../../config/sites/general.yml"
    default = YAML::load(File.open(default_site))
    default.deep_merge! env['evie']
  end

  # Configuration used during the provisioning
  # process such as what OS should be installed
  # and so on.
  def profile
    env['profile']
  end

end
