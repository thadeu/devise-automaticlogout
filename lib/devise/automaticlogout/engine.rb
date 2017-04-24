module Devise
  module AutomaticLogout
    class Engine < ::Rails::Engine
      require 'jquery-rails'

      ActiveSupport.on_load :action_controller do
        include Devise::AutomaticLogout::Controllers
      end

      ActiveSupport.on_load :action_view do
        include Devise::AutomaticLogout::Helpers
      end
    end
  end
end
