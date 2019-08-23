# frozen_string_literal: true

# user controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'signup successfully!'
    else
      redirect_to root_path, notice: 'signup fail!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
