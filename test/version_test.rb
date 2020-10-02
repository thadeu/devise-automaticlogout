# frozen_string_literal: true

require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  setup do
    @module = Devise::Automaticlogout
  end

  test 'assert version lib' do
    assert_equal @module::VERSION, '1.0.0'
  end
end
