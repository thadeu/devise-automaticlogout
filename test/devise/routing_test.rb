require 'test_helper'

module Devise
  class RoutingTest < ActionDispatch::IntegrationTest
    test 'routes to get status' do
      get '/devise/automatic_logout/status'
      assert_response :success, status
    end

    test 'routes to get destroy' do
      get '/devise/automatic_logout/destroy'
      assert_response :redirect, status
    end
  end
end
