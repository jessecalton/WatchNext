class UsersController < ApplicationController
  include SessionsHelper
  include MoviesHelper

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

  def show
    @movie_array = []

    if params[:runtime].present?
      runtime_match
    end
    if params[:director].present?
      director_match
    end
    if params[:decade].present?
      decade_match
    end
    if params[:genre].present?
      genre_match
    end
    if params[:actors].present?
      actor_match
    end
    if params[:awards].present?
      awards_match
    end
    p @movie_array
  end

private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
end
