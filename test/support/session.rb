module Session
  def authenticate_user!
    true
  end

  def current_user
    session[:user_id] = 1
  end
end
