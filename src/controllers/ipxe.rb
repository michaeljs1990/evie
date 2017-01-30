class Evie::Controller::Ipxe < Evie::Controller::Base

  # load the ipxe menu config picking the
  # genesis mode based on information we find
  # inside of collins.
  get '/:asset_tag' do
    genesis_mode = get_genesis_mode params['asset_tag']

    erb :ipxe, :locals => {
      :genesis_mode => genesis_mode,
      :initrd_img => evie['genesis']['initrd_img_url'],
      :vmlinuz => evie['genesis']['vmlinuz_url'],
      :conf => evie['genesis']['conf_url']}
  end

  # Figure out what mode genesis should be
  # booting up into.
  def get_genesis_mode asset_tag
    collins = get_collins_client
    asset = collins.get(asset_tag)
     
    #  We don't know about this machine
    # so we will try to intake it.
    if not asset
      return 'intake'
    end

    if asset.status == 'Provisioning'
      return 'provision'
    end
    
    # If we don't know what to do boot up
    # genesis in util mode for poking around
    return 'util'
  end

end
