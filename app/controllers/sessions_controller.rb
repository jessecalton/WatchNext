class SessionsController < ApplicationController
  include SessionsHelper
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user 
      redirect_to user_path(user)
    else
      flash[:notice] = "Invalid email/password combination"
      render 'new'
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def destroy
    log_out
    redirect_to users_path
  end
end
