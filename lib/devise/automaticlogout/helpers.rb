module Devise
  module AutomaticLogout
    module Helpers
      def regressive_timer
        render 'automatic_logout/timer'
      end
    end
  end
end
