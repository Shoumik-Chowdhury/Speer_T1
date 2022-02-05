require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can register" do
    user = User.new({name: "Harry", email: "harry@hogwarts.com", password: "abc123", password_confirmation: "abc123"})
    assert user.save
  end
  
  test "user cannot register without name" do
    user = User.new({name: "", email: "harry@hogwarts.com", password: "abc123", password_confirmation: "abc123"})
    assert_not user.save
  end
  
  test "user cannot register without email" do
    user = User.new({name: "Harry", email: "", password: "abc123", password_confirmation: "abc123"})
    assert_not user.save
  end
  
  test "user cannot register with invalid email" do
    user = User.new({name: "Harry", email: "harry@hogwarts", password: "abc123", password_confirmation: "abc123"})
    assert_not user.save
  end
  
  test "user cannot register with same email" do
    user1 = User.new({name: "Harry", email: "harry@hogwarts.com", password: "abc123", password_confirmation: "abc123"})
    user2 = User.new({name: "Ron", email: "harry@hogwarts.com", password: "abc123", password_confirmation: "abc123"})
    assert user1.save
    assert_not user2.save
  end

  test "user cannot register with too short password" do
    user = User.new({name: "Harry", email: "harry@hogwarts.com", password: "abc12", password_confirmation: "abc12"})
    assert_not user.save
  end
  
  test "user cannot register with wrong password confirmation" do
    user = User.new({name: "Harry", email: "harry@hogwarts.com", password: "abc123", password_confirmation: "ABC124"})
    assert_not user.save
  end
end
