require 'digest/sha1'
require 'securerandom'

module Evie::Helper::Provision

  include Evie::Helper::Config

  # Kick the provisioning process off
  def start_provision collins, asset, profile, actor, suffix
    msg = "Evie: Provisioning #{asset.tag} as profile #{profile.profile}"
    collins.set_status!(asset, :provisioning, msg, :running)
    hostname = generate_hostname(asset.tag, profile, suffix)
    collins.set_attribute!(asset, :hostname, hostname)
    password = generate_password
    collins.set_attribute!(asset, :password, password)
    generate_ip(collins, asset)
    # Start asset for provisioning
    power_on_asset(collins, asset)
  end

  # Return a hostname for a given asset
  # currently we don't care about the suffix
  def generate_hostname tag, profile, suffix
    site = evie['provisioning']['site']
    domain = evie['provisioning']['domain']
    hash = Digest::SHA1.hexdigest(tag)[0...10]
    return "#{profile.prefix}-#{hash}.#{site}.#{domain}".downcase
  end

  def generate_password
    return SecureRandom.urlsafe_base64(12)
  end

  def power_on_asset collins, asset
    begin
      # First try to reboot incase the
      # asset is already running.
      collins.power!(asset, :reboothard)
    rescue Collins::RequestError
      collins.power!(asset, :poweron)
    end
  end

  # This should be way more smart about handling allocations
  # but it works for right now.
  def generate_ip collins, asset
    num = asset.RACK_POSITION.split("-")[1]
    collins.ipaddress_delete!(asset.tag, "RACK-#{num}")
    collins.ipaddress_allocate!(asset.tag, "RACK-#{num}")
  end

end
