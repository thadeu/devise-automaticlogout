Rails.application.routes.draw do
  get 'automatic_logout/destroy' => 'automaticlogout#destroy'
end
