module Devise
  module Automaticlogout
    module Helpers
      def regressive_timer(visible: false, alert: false)
        render 'automatic_logout/timer', visible: visible, alert: alert
      end
    end
  end
end
