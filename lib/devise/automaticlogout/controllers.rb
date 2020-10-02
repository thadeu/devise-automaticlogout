module Devise
  module Automaticlogout
    module Controllers
      extend ActiveSupport::Concern

      DEFAULT_MESSAGE = 'Session expired! You will be redirect.'.freeze

      module ClassMethods
        def devise_automatic_logout(options = {})
          prepend_before_action do |c|
            time = options.fetch(:time, nil)
            message = options.fetch(:message, DEFAULT_MESSAGE)
            scope = options.fetch(:scope, 'user')

            seconds = if time&.positive?
                        time
                      else
                        mapping = Devise.mappings[scope.to_sym]
                        return unless mapping

                        mapping.to.timeout_in.seconds.to_i
                      end

            if seconds
              c.session[:devise_autl_message] = message
              c.session[:devise_autl_seconds] = seconds
            end
          end
        end
      end
    end
  end
end
