class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
    @errors = @user.errors.full_messages
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
end
