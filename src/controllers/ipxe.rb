require_relative 'base'

class Evie::Controller::Ipxe < Evie::Controller::Base

  # load the ipxe menu config picking the
  # genesis mode based on information we find
  # inside of collins.
  get '/menu' do
    erb :ipxe, :locals => {
      :genesis_mode => 'intake',
      :initrd_img => evie['genesis']['initrd_img_url'],
      :vmlinuz => evie['genesis']['initrd_img_url'],
      :conf => evie['genesis']['conf_url']}
  end

end
