module Devise
  module AutomaticLogout
    module Helpers
      def regressive_timer(visible: false)
        render 'automatic_logout/timer', visible: visible
      end
    end
  end
end
