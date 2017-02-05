module Evie
  module Helper
    require_relative 'helpers/config'
    require_relative 'helpers/collins'
    require_relative 'helpers/provision'
    require_relative 'helpers/profile'
  end

  module Controller
    require_relative 'controllers/base'
    require_relative 'controllers/ipxe'
    require_relative 'controllers/provision'
  end
end

