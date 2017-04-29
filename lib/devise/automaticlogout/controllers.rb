module Devise
  module AutomaticLogout
    module Controllers
      extend ActiveSupport::Concern

      included do
        ::ApplicationController.before_action do |c|
          if current_user.present?
            key_classify = Devise.mappings.keys.first
            resource_name = Devise.mappings[key_classify].class_name.to_s
            # get instance for class using devise
            c.session[:seconds] = resource_name.classify.constantize.timeout_in.seconds.to_i
            # I18n.t devise.automaticlogout.message
            c.session[:message] = I18n.t 'devise.automaticlogout.message' || 'Session expired!'
          end

          ::ApplicationController.send :define_method, :automatic_logout_status do
            Rails.logger.info 'Sessão atualizada'
            render json: {
              live: !current_user.nil?,
              message: session[:message],
              seconds: session[:seconds]
            }, status: :ok
          end

          ::ApplicationController.send :define_method, :automatic_logout_destroy do
            Rails.logger.info 'Sessão destruída'
            session[:seconds] = ''
            session[:live] = !current_user.nil?
            reset_session
            redirect_to '/', notice: session[:message]
          end
        end
      end
    end
  end
end
