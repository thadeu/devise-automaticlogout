require 'test_helper'

module Devise
  class AutomaticLogoutTest < ActionDispatch::IntegrationTest
    test 'when does not logged return the empty seconds' do
      get '/devise/automatic_logout/status'
      assert_nil response.parsed_body[:seconds]
    end

    test 'when does not logged return the live is false' do
      get '/devise/automatic_logout/status'
      assert_not response.parsed_body[:live]
    end

    test 'after destroy returns empty seconds' do
      get '/devise/automatic_logout/destroy'
      assert_response :redirect

      get '/devise/automatic_logout/status'
      assert_nil response.parsed_body[:seconds]
      assert_not response.parsed_body[:live]
    end
  end
end
