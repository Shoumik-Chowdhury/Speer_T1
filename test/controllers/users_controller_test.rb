require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "successful registration renders correct response" do
    post "/users", params: { user: { name: "Harry", email: "harry@hogwarts.ca", password: "123abc", password_confirmation: "123abc"} }
    assert_response(:success)
    assert_equal "User created!", @response.body
  end
  
  test "unsuccessful registration renders correct response" do
    post "/users", params: { user: { name: "Harry", email: "harry@hogwarts.ca", password: "999abc", password_confirmation: "123abc"} }
    assert_response(:bad_request)
    assert_equal "Failed to create user!", @response.body
  end
end
