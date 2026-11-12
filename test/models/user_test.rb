require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "normalizes email and validates uniqueness" do
    User.create!(name: "Test User", email: "TEST@example.com", password: "password123")
    duplicate = User.new(name: "Other", email: "test@example.com", password: "password123")
    assert_not duplicate.valid?
  end
end
