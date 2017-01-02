module Evie
  module Helper
    require_relative 'helpers/config'
    require_relative 'helpers/collins'
  end

  module Controller
    require_relative 'controllers/ipxe'
    require_relative 'controllers/provision'
  end
end

