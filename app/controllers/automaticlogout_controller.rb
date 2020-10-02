class AutomaticlogoutController < ::ApplicationController
  def destroy
    session[:devise_autl_seconds] = nil
    session[:live] = !current_user.nil?
    reset_session

    redirect_to '/', notice: session[:devise_autl_message]
  end
end
