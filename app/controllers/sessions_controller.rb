class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      render plain: "logged in as #{user.name}"
    else
      render plain: "cannot login"
    end
  end

  def destroy
    session[:current_user_id] = nil
    render plain: "logged out"
  end
end
