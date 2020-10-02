module Devise
  module Automaticlogout
    class Engine < ::Rails::Engine
      engine_name 'devise_automaticlogout'

      ActiveSupport.on_load :action_controller do
        include Devise::Automaticlogout::Controllers
      end

      ActiveSupport.on_load :action_view do
        include Devise::Automaticlogout::Helpers
      end
    end
  end
end
