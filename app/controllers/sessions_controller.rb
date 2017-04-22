class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user 
      redirect_to root_path
    else
      flash[:notice] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to users_path
  end
end
