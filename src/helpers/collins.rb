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

  # This should be done better and an actual
  # application logger should be setup that can
  # magically handle where we should be logging
  # for now i'm just going to use this though to
  # make setting the rest of this up easy.
  def clog(tag, string)
    begin
      get_collins_client.log!(tag, string)
    rescue
      # Log this some place after a logger is setup
    end
  end

end
