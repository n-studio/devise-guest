require 'test_helper'

class DeviseGuestTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, DeviseGuest
    assert defined?(DeviseGuest::Concern)
  end
end
