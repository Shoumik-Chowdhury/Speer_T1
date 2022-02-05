class SessionsController < ApplicationController
  def create
    # finds user by email by changing input to lowercase and removing trailing whitespace
    user = User.find_by(email: params[:session][:email].downcase.strip)
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      render plain: "logged in as #{user.name}", status: :ok
    else
      render plain: "cannot login", status: :bad_request
    end
  end

  def destroy
    session[:current_user_id] = nil
    render plain: "logged out", status: :ok
  end
end
