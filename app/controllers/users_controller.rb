class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:current_user_id] = user.id
      render plain: 'User created!', status: :ok
    else
      render plain: 'Failed to create user!', status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
