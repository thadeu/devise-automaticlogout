Rails.application.routes.draw do
  get 'devise/automatic_logout/status'  => 'application#automatic_logout_status'
  get 'devise/automatic_logout/destroy' => 'application#automatic_logout_destroy'
end
