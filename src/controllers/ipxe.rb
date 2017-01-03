class Evie::Controller::Ipxe < Evie::Controller::Base

  # load the ipxe menu config picking the
  # genesis mode based on information we find
  # inside of collins.
  get '/:asset_tag' do
    genesis_mode = get_genesis_mode

    erb :ipxe, :locals => {
      :genesis_mode => genesis_mode,
      :initrd_img => evie['genesis']['initrd_img_url'],
      :vmlinuz => evie['genesis']['vmlinuz_url'],
      :conf => evie['genesis']['conf_url']}
  end

  # Figure out what mode genesis should be
  # booting up into.
  def get_genesis_mode
    collins = get_collins_client

    return 'intake'
  end

end
