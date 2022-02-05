require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "existing user can login" do
    post "/login", params: { session: { email: @user.email, password: 'password' }}
    assert_response(:success) 
    assert_equal "logged in as #{@user.name}", @response.body
  end

  test "login email is case insensitive" do
    post "/login", params: { session: { email: "jACk@GmaIl.com", password: 'password' }}
    assert_response(:success) 
    assert_equal "logged in as #{@user.name}", @response.body
  end

  test "trailing whitespace in email allows login" do
    post "/login", params: { session: { email: " jack@gmail.com ", password: 'password' }}
    assert_response(:success) 
    assert_equal "logged in as #{@user.name}", @response.body
  end

  test "user cannot login with wrong email" do
    post "/login", params: { session: { email: " jack@yahoo.com ", password: 'password' }}
    assert_response(:bad_request) 
    assert_equal "cannot login", @response.body
  end
  
  test "user cannot login with wrong password" do
    post "/login", params: { session: { email: @user.email, password: 'wrongPass' }}
    assert_response(:bad_request) 
    assert_equal "cannot login", @response.body
  end

  test "user can logout" do
    get "/logout"
    assert_response(:success) 
    assert_equal "logged out", @response.body
  end
end
