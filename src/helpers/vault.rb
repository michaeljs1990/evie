require 'vault'
require 'pp'

module Evie::Helper::Vault

  include Evie::Helper::Config

  # Get a client to talk to our vault server. Setting token via ENV
  # is actually not needed but I made it explicit so it's easier for
  # other people to see what is actually happening.
  def get_client
    return Vault::Client.new(
      address: evie['vault']['host'],
      token: ENV["VAULT_TOKEN"],
      ssl_verify: false,
      timeout: 10)
  end

  # Query vault and return a token based on the given
  # nodeclass that the is making the request... Need to also
  # lock this endpoint now also I guess so an attacker just
  # can't keep making tokens.... later.
  def get_token nodeclass
    client = get_client
    rpath = evie['vault']['role']
 
    resp = client.logical.read(rpath + "/" + nodeclass + "/role-id")
    role_id = resp.data[:role_id]
    
    resp = client.logical.write(rpath + "/" + nodeclass + "/secret-id")
    secret_id = resp.data[:secret_id]

    resp = client.logical.write("auth/approle/login", 
      role_id: role_id, secret_id: secret_id)
   
    return resp.auth.client_token
  end

end
