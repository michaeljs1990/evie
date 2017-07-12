class Evie::Controller::Ipxe < Evie::Controller::Base
  
  # default route to use when the system doesn't
  # have an asset tag set
  get '/' do
    erb :ipxe, :locals => {
      :genesis_mode => 'util',
      :initrd_img => evie['genesis']['initrd_img_url'],
      :vmlinuz => evie['genesis']['vmlinuz_url'],
      :conf => evie['genesis']['conf_url']}
  end

  # load the ipxe menu config picking the
  # genesis mode based on information we find
  # inside of collins.
  get '/:asset_tag' do
    tag = params['asset_tag']
    genesis_mode = get_genesis_mode tag
    clog(tag, "Booting into #{genesis_mode} mode")

    erb :ipxe, :locals => {
      :genesis_mode => genesis_mode,
      :initrd_img => evie['genesis']['initrd_img_url'],
      :vmlinuz => evie['genesis']['vmlinuz_url'],
      :conf => evie['genesis']['conf_url']}
  end

  # Figure out what mode genesis should be
  # booting up into.
  def get_genesis_mode asset_tag
    asset = @collins.get(asset_tag)
     
    #  We don't know about this machine
    # so we will try to intake it.
    if not asset
      :intake
    elsif  asset.status == 'Provisioning'
      :provision
    else
      :util
    end
  end

end
