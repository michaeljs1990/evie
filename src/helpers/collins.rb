require 'collins_client'

module Evie::Helper::Collins

  include Evie::Helper::Config
 
  # Connect to collins our fancy backend key value store 
  # https://github.com/tumblr/collins/tree/master/support/ruby/collins-client/lib/collins/api
  # The above link contains all available functions that
  # we can use when making calls to collins.
  def get_collins_client
    user = evie['collins']['user'] 
    pass = evie['collins']['pass'] 
    host = evie['collins']['host'] 
    
    return Collins::Client.new config = {
      username: user, 
      password: pass, 
      host: host}
  end

end
