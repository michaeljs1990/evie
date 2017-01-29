require 'digest/sha1'
require 'securerandom'

module Evie::Helper::Provision

  include Evie::Helper::Config

  # Kick the provisioning process off
  def start_provision collins, asset, profile, actor, suffix
    msg = "Evie: Provisioning #{asset.tag} as profile #{profile.profile}"
    collins.set_status!(asset, :provisioning, msg, :running)
    # Set the hostname for this computer
    hostname = generate_hostname(profile, suffix)
    collins.set_attribute!(asset, :hostname, hostname)
    password = generate_password
    collins.set_attribute!(asset, :password, password)
    # Reboot the asset so it will start provisioning
    collins.power!(asset, :reboothard)
  end

  # Return a hostname for a given asset
  # currently we don't care about the suffix
  def generate_hostname profile, suffix
    site = evie['provision']['site']
    domain = evie['provision']['domain']
    hash = Digest::SHA1.hexdigest(asset.tag)[0...10]
    return "#{profile.prefix}-#{hash}.#{site}.#{domain}".downcase
  end

  def generate_password
    return SecureRandom.urlsafe_base64(12)
  end

end
