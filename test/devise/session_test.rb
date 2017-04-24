require 'test_helper'

module Devise
  class SessionTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @dhh_valid = users(:dhh_valid)
    end

    test 'when logged return the seconds' do
      sign_in @dhh_valid
      get '/devise/automatic_logout/status'
      assert_not_nil response.parsed_body['seconds']
    end

    test 'when logged return the live true' do
      sign_in @dhh_valid
      get '/devise/automatic_logout/status'
      assert_equal true, response.parsed_body['live']
    end
  end
end
